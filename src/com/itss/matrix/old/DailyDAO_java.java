package com.itss.matrix.old;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.itss.matrix.model.DailyVO;

public class DailyDAO_java {
	private Connection conn;

	public DailyDAO_java() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String uri = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String id = "hr";
		String pw = "hr";
		conn = DriverManager.getConnection(uri, id, pw);
	}

	/** 선택한 날짜에 해당하는 배정대상 목록 보기 */
	public List<String> getAssignTypes(String assignDate) {
		List<String> list = new ArrayList<>();

		String sql = "select distinct assign_detail from daily_tasks where assign_type='파트' and assign_date = ?";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, assignDate);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/** 선택한 날짜, 배정대상에 속한 업무 목록 보기 */
	public Collection<Map<String, String>> getDailyTasks(String assignDate, String assignDetail) {
		return null;
	}

	/** 업무 배정 */
	public boolean addDailyTask(String taskText, String assignDate, int importance, String assignType,
			String assignDetail, String assignerId, int branchSeq) {
		boolean result = false;
		String sql = "insert into daily_tasks (daily_tasks_seq, input_task, assign_date, importance, assign_type, assign_detail, assigner_id, branch_seq, manual_tasks_seq)"
				+ " values(daily_tasks_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		String inputTask = null;
		
		try {
			int manualTasksSeq = new ManualDAO_old().getManualTaskSeq(taskText);
			if(manualTasksSeq == -1){	//매뉴얼에 없는 업무 --> input_task
				inputTask = taskText;
				sql = "insert into daily_tasks (daily_tasks_seq, input_task, assign_date, importance, assign_type, assign_detail, assigner_id, branch_seq, manual_tasks_seq)"
						+ " values(daily_tasks_seq.nextval, ?, ?, ?, ?, ?, ?, ?, null)";
			}
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputTask);
			pstmt.setString(2, assignDate);
			pstmt.setInt(3, importance);
			pstmt.setString(4, assignType);
			pstmt.setString(5, assignDetail);
			pstmt.setString(6, assignerId);
			pstmt.setInt(7, branchSeq);
			if(manualTasksSeq != -1){
				pstmt.setInt(8, manualTasksSeq);
			}
			if (pstmt.executeUpdate() == 1) {
				result = true;
			}
			pstmt.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return result;

	}

	public boolean addDailyTask(DailyVO vo) {
		return false;
	}

	/** 업무 수정 */
	public boolean setDailyTask(String newTaskText, String oldTaskText, String assignDate, String assignDetail) {
		return false;
	}

	/** 업무 재배정 */
	public boolean setDailyAssign(String newAssignType,
			String newAssignDetail, String assignDate, String oldAssignDetail, String taskText) {
		boolean result = false;
		String sql = "update daily_tasks set assign_type=?, assign_detail=? where assign_date=? and assign_detail=? and manual_tasks_seq=?";
		
		String inputTask = null;
		
		try {
			int manualTasksSeq = new ManualDAO_old().getManualTaskSeq(taskText);
			if(manualTasksSeq == -1){	//매뉴얼에 없는 업무 --> input_task
				inputTask = taskText;
				sql = "update daily_tasks set assign_type=?, assign_detail=? where assign_date=? and assign_detail=? and input_task=?";
			}
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newAssignType);
			pstmt.setString(2, newAssignDetail);
			pstmt.setString(3, assignDate);
			pstmt.setString(4, oldAssignDetail);
			if(manualTasksSeq == -1){
				pstmt.setString(5, inputTask);
			} else {
				pstmt.setInt(5, manualTasksSeq);
			}
			if (pstmt.executeUpdate() == 1) {
				result = true;
			}
			pstmt.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return result;
	}

	/** 업무 삭제 */
	public boolean removeDailyTask(String taskText, String assignDate, String assignType, String assignDetail) {
		boolean result = false;
		String sql = "delete daily_tasks where assign_date=? and assign_type=? and assign_detail=? and manual_tasks_seq=?";
		
		String inputTask = null;
		
		try {
			int manualTasksSeq = new ManualDAO_old().getManualTaskSeq(taskText);
			if(manualTasksSeq == -1){	//매뉴얼에 없는 업무 --> input_task
				inputTask = taskText;
				sql = "delete daily_tasks where assgin_date=? and assign_type=? and assign_detail=? and input_task=?";
			}
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, assignDate);
			pstmt.setString(2, assignType);
			pstmt.setString(3, assignDetail);
			if(manualTasksSeq == -1){
				pstmt.setString(4, inputTask);
			} else {
				pstmt.setInt(4, manualTasksSeq);
			}
			if (pstmt.executeUpdate() == 1) {
				result = true;
			}
			pstmt.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return result;
	}
}
