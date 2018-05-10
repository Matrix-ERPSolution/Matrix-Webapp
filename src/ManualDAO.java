import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

public class ManualDAO {
	private Connection conn;
	public ManualDAO(Connection conn) throws ClassNotFoundException, SQLException{
		this.conn = conn;
	}
	
	/**������ ��õ����*/
	
	
	
	/**�Ŵ��󿡼� �����ϱ� - �����з� ����Ʈ ���*/
	public Collection<String> getSpaceTypeList(){
		Collection<String> list = new ArrayList();
		String sql="select space_type from space_types";
		try{
			Statement stmt=conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e){
			e.printStackTrace();
		}
		return list;
	}

	/**�Ŵ��󿡼� �����ϱ� - ���õ� �����з� ���� �����з� ����Ʈ ���*/
	public Collection<String> getTaskTypeList(String spaceType){
		Collection<String> list = new ArrayList();
		String sql="select distinct task_type from manual_tasks m, space_types s, task_types t "
				+ "where m.space_types_seq = s.space_types_seq and m.task_types_seq = t.task_types_seq "
				+ "and s.space_type=?";
		try{
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, spaceType);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e){
			e.printStackTrace();
		}
		return list;
	}
	
	/**�Ŵ��󿡼� �����ϱ� - ���õ� ����/�����з� ���� ������� ����Ʈ, �ݺ���������, �ݺ����ػ� ���*/
	//�ݺ���������(��Ʈ/�Ⱓ) �������� ���ó�� ����
	public Collection<String> getTaskList(String spaceType, String taskType){
		Collection<String> list = new ArrayList();
		String sql="select task, repeat_type, repeat_detail from manual_tasks m, space_types s, task_types t "
				+ "where m.space_types_seq = s.space_types_seq and m.task_types_seq = t.task_types_seq "
				+ "and s.space_type=? and t.task_type=?";
		try{
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, spaceType);
			pstmt.setString(2, taskType);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e){
			e.printStackTrace();
		}
		return list;
	}
	
	
/*	
	*//**����� �����ϱ� - �������(��Ʈ) ��ü ��� *//*
	public Collection<String> getPartList(){
		Collection<String> list = new ArrayList();
		String sql="select distinct repeat_detail from manual_tasks where repeat_type=?";
		try{
			Statement stmt=conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e){
			e.printStackTrace();
		}
		return list;
	}

	*/
	
	/**�������(����) ��ü ��� */
	
	
	
	/**���õ� �������(��Ʈor����) ���*/
	
	
	
	/*
	 * 
	
	//**��ü �Է� �� list ���*//*
    public Collection<UserDataVO> getSpaceList() {
        Collection<UserDataVO> cvo = new ArrayList();
        String query = "select name, gender from userdata";
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()) {
                cvo.add(new UserDataVO(rs.getString("name"), rs.getString("gender")));
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cvo;
    }
	
	
	
	
	public Map inBodyResult(String id){
		Map map = new HashMap();
		String sql="select distinct c.name, c.gender, to_char(r.test_date, 'YYYY-MM-DD hh24:mi:ss') as test_date, i.height, i.weight, r.bmi, r.obesity, r.proper_weight from clients c, inputs i, inbodyresults r where c.id=i.id and c.id=? and i.inputs_seq=r.inputs_seq and i.inputs_seq=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, getInputsSeq(id));
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				map.put("name", rs.getString(1));
				map.put("gender", rs.getString(2));
				map.put("testDate", rs.getString(3));
				map.put("height", rs.getDouble(4));
				map.put("weight", rs.getDouble(5));
				map.put("bmi", rs.getDouble(6));
				map.put("obesity", rs.getString(7));
				map.put("properWeight", rs.getDouble(8));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int age = ageCalc(id);
		map.put("age", age);
		map.put("refKcal", getReferenceKcal(age, id));
		return map;
	}
	
	
	public int getInputsSeq(String id) {
		int inputsSeq=0;
		String sql="select max(inputs_seq) from inputs where id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			inputsSeq = rs.getInt(1);
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return inputsSeq;
	}*/
}
