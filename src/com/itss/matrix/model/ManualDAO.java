package com.itss.matrix.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class ManualDAO {
	private Connection conn;
	public ManualDAO() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String uri = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String id = "hr"; String pw = "hr";
		conn = DriverManager.getConnection(uri, id, pw);
	}
	
	/**매뉴얼 업무 전체 출력(자동완성): 업무배정, 업무수정*/
	public Collection<Map<String, String>> getManualTasks() {
		Collection<Map<String, String>> list = new ArrayList();
		String sql="select m.TASK, s.SPACE_TYPE from MANUAL_TASKS m, SPACE_TYPES s where m.SPACE_TYPES_SEQ=s.SPACE_TYPES_SEQ order by m.SPACE_TYPES_SEQ asc, m.MANUAL_TASKS_SEQ asc";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				Map<String, String> map = new HashMap();
				map.put("taskName", rs.getString(1));
				map.put("spaceType", rs.getString(2));
				list.add(map);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**공간분류 보기: 업무배정, 업무수정, 매뉴얼 보기*/
	public Collection<String> getSpaceTypes() {
		Collection<String> list = new ArrayList();
		String sql="select space_type from space_types";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**선택한 공간에 속한 업무분류 보기: 업무배정, 업무수정, 매뉴얼 보기*/
	public Collection<String> getTaskTypes(String spaceType) {
		Collection<String> list = new ArrayList();
		String sql="select distinct task_type from manual_tasks m, space_types s, task_types t where m.space_types_seq = s.space_types_seq and m.task_types_seq = t.task_types_seq and s.space_type=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, spaceType);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**업무분류 보기: 매뉴얼 보기*/
	public Collection<String> getTaskTypes() {
		Collection<String> list = new ArrayList();
		String sql="select task_type from task_types";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**선택한 업무에 속한 공간분류 보기: 매뉴얼 보기*/
	public Collection<String> getSpaceTypes(String taskType) {
		Collection<String> list = new ArrayList();
		String sql="select distinct space_type from manual_tasks m, space_types s, task_types t where m.space_types_seq = s.space_types_seq and m.task_types_seq = t.task_types_seq and t.task_type=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, taskType);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**선택한 공간/업무분류에 속한 업무 목록 보기: 업무배정, 업무수정, 매뉴얼 보기*/
	public Collection<Map<String, String>> getTasks(String spaceType, String taskType) {
		Collection<Map<String, String>> list = new ArrayList();
		String sql="select task, repeat_type, repeat_detail from manual_tasks m, space_types s, task_types t where m.space_types_seq = s.space_types_seq and m.task_types_seq = t.task_types_seq and s.space_type=? and t.task_type=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, spaceType);
			pstmt.setString(2, taskType);			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				Map<String, String> map = new HashMap();
				map.put("taskName", rs.getString(1));
				map.put("repeatType", rs.getString(2));
				map.put("repeatDetail", rs.getString(3));
				list.add(map);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**i: 업무명, o: ManualTaskSeq*/
	public int getManualTaskSeq(String searchTask){
		int manualTaskSeq=0;
		String sql="select manual_tasks_seq from manual_tasks where task=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchTask);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				manualTaskSeq=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return manualTaskSeq;
	}
	
}
