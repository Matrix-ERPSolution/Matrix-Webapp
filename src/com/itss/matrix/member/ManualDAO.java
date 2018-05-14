package com.itss.matrix.member;

import java.util.Collection;
import java.util.Map;

public class ManualDAO {
	/**매뉴얼 업무 전체 출력: 업무배정, 업무수정*/
	public Collection<Map<String, String>> getManualTasks() {	//autoCompleteManualTask
		return null;
	}
	
	/**공간분류 보기: 업무배정, 업무수정, 매뉴얼 보기*/
	public Collection<String> getSpaceTypes() {
		return null;
	}
	
	/**선택한 공간에 속한 업무분류 보기: 업무배정, 업무수정, 매뉴얼 보기*/
	public Collection<String> getTaskTypes(String spaceType) {
		return null;
	}
	
	/**업무분류 보기: 매뉴얼 보기*/
	public Collection<String> getTaskTypes() {
		return null;
	}
	
	/**선택한 업무에 속한 공간분류 보기: 매뉴얼 보기*/
	public Collection<String> getSpaceTypes(String taskType) {
		return null;
	}
	
	/**선택한 공간/업무분류에 속한 업무 목록 보기: 업무배정, 업무수정, 매뉴얼 보기*/
	public Collection<Map<String, String>> getTasks(String spaceType, String taskType) {
		return null;
	}
	
	/**i: 업무명, o: ManualTaskSeq*/
	public int getManualTaskSeq(String searchTask){
		return 0;
		
	}
	
}
