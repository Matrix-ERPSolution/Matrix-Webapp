package com.itss.matrix.test;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.itss.matrix.model.ManualDAO;

public class ManualDAOTest {
	public static void main(String[] args) {
		ManualDAO dao;
		dao = new ManualDAO();
		//System.out.println(dao.getManualTasks());	//ok
		//System.out.println(dao.getSpaceTypes());	//ok
		//System.out.println(dao.getTaskTypesBySpaceType("카운터"));	//기능 ok
		//System.out.println(dao.getTaskTypesBySpaceType("지하 300층"));	//비기능 cmd:선택된 레코드가 없습니다. console: []
		//System.out.println(dao.getTaskTypes());	//ok
		//System.out.println(dao.getSpaceTypesByTaskType("설비관리"));	//기능 ok
		//System.out.println(dao.getSpaceTypesByTaskType("말도 안 되는일 시키지 마세요"));	//비기능 cmd:선택된 레코드가 없습니다. console: []
		//System.out.println(dao.getTasks("카운터", "설비관리"));	//기능 OK
		//System.out.println(dao.getTasks("테라스", "고객관리"));	//비기능 cmd:선택된 레코드가 없습니다. console:[]
		//System.out.println(dao.getManualTaskSeq("바닥 쓸기"));	//기능 ok
		//System.out.println(dao.getManualTaskSeq("매뉴얼에 이런 업무가 있을까"));	//비기능  cmd:선택된 레코드가 없습니다.  console: -1
		/*List<Map> list =dao.getTasks("바", "위생관리");
		for(Map map : list){
			Set keys = map.keySet();
			for(Object key : keys)
			System.out.println(map.get(key));
		}*/
		/*List<Map> list = dao.getRecommendedTasks("2018/06/02");
		for(Map map : list){
			System.out.println(map.get("MANUAL_TASK"));
		}*/
		//System.out.println(dao.searchManualTasks("바닥"));
		System.out.println("end");
	}
}