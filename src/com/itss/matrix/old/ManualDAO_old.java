package com.itss.matrix.old;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

public class ManualDAO_old {
   private Connection conn;
   public ManualDAO_old(Connection conn) throws ClassNotFoundException, SQLException{
      this.conn = conn;
   }
   
   /**오늘의 추천업무*/
   
   
   
   /**매뉴얼에서 선택하기 - 공간분류 리스트 출력*/
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

   /**매뉴얼에서 선택하기 - 선택된 공간분류 안의 업무분류 리스트 출력*/
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
   
   /**매뉴얼에서 선택하기 - 선택된 공간/업무분류 안의 업무목록 리스트, 반복기준유형, 반복기준상세 출력*/
   //반복기준유형(파트/기간) 기준으로 결과처리 구분
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
   *//**담당자 지정하기 - 배정대상(파트) 전체 출력 *//*
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
   
   /**배정대상(직원) 전체 출력 */
   
   
   
   /**선택된 배정대상(파트or직원) 출력*/
   
   
   
   /*
    * 
   
   //**전체 입력 고객 list 출력*//*
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