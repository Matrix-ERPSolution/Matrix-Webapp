package com.itss.matrix.model;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class DailyDAO {
	   /** 선택한 날짜에 해당하는 배정대상 목록 보기 */
	   public List<String> getAssignTypes(Date assignDate){
		   return null;
	   }
	   /** 선택한 날짜, 배정대상에 속한 업무 목록 보기 */
	   public Collection<Map<String, String>> getDailyTasks(Date assignDate, String assignDetail){
		   return null;
	   }
	   
	   /** 업무 배정 */
	   public boolean addDailyTask(String taskText, Date assignDate, int importance, String assignType, String assignDetail, String assignerId, int branchSeq){
		   return false;
	   }
	   public boolean addDailyTask(DailyVO vo){
		   return false;
	   }
	   /** 업무 수정 */
	   public boolean setDailyTask(String newTaskText, String oldTaskText, Date assignDate, String assignDetail){
		   return false;
	   }
	   /** 업무 재배정 */
	   public boolean setDailyAssign(String oldAssignType, String oldAssignDetail, String newAssignType, String newAssignDetail, Date assignDate, String taskText){
		   return false;
	   }
	   /** 업무 삭제 */
	   public boolean removeDailyTask(String taskText, Date assignDate, String assignType, String assignDetail){
		   return false;
	   }
}
