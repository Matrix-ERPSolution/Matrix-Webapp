package com.itss.matrix.test;

import com.itss.matrix.model.DailyDAO;

public class DailyDAOTest {

	public static void main(String[] args) {
			DailyDAO dao = new DailyDAO();
			//System.out.println(dao.getAssignTypes("2018/05/10"));
			//dao.removeDailyTask("바닥 쓸기", "2018/05/15", "파트", "마감");
			//dao.setDailyAssign("파트", "오픈", "2018/05/15", "파트", "마감", "바닥 쓸기");
			//void 메소드 테스트할 때 결과 출력 안되니까 조심
			
			/** 선택한 날짜에 해당하는 배정대상 목록 보기 */
			//System.out.println(dao.getAssignedParts("2018/05/15"));	//기능 ok
			//System.out.println(dao.getAssignedParts("2440/12/31"));	//비기능 cmd:선택된 레코드가 없습니다. console: []
			
			/** 파트별 - 선택한 날짜, 배정대상에 속한 업무 목록 보기 */
			//System.out.println(dao.getDailyTasksForParts("2018/05/20", "마감"));	//기능 ok. cmd & console:null항목은 아예 출력 안됨
			//System.out.println(dao.getDailyTasksForParts("2440/12/31", "지구종말"));	//비기능 cmd:선택된 레코드가 없습니다. console:[]
			
			/** 개인별 - 선택한 날짜, 배정대상에 속한 업무 목록 보기 */
			//System.out.println(dao.getDailyTasksForPerson("2018/05/18"));	//기능 ok
			//System.out.println(dao.getDailyTasksForPerson("2400/10/10"));	//비기능 cmd:선택된 레코드가 없습니다. console:[]
			
			/** 업무 중복확인 */
			//System.out.println(dao.isDailyTask("직접해라직접", "2018/11/11"));
			
			/** 업무 배정 */
			//dao.addDailyTask("직접해라직접", "2018/11/11", 1, "개인", "taehun", 1);	//직접입력-기능 ok
			//dao.addDailyTask("매우엄청중요한직접업무", "2018/11/11", 3, "파트", "오픈", 1);	//직접입력-비기능 중요도: 0,1 이외 입력해도 입력됨
			//dao.addDailyTask("어딨는진모르지만직접해라", "2018/11/11", 1, "없음", "taehun", 1);	//직접입력-비기능 배정유형:개인/파트 말고 다른거 입력해도 입력됨
			//dao.addDailyTask("누군지모르겠지만직접해라", "2018/11/11", 0, "파트", "밤샘", 1);	//직접입력-기능? 새로운 파트명으로 입력
			//dao.addDailyTask("테라스 외부 청소", "2018/11/11", 0, "파트", "오픈", 1);	//매뉴얼입력-기능 ok
			//비기능: 똑같은 쿼리문 오류 없이 여러번 들어감
			//System.out.println(dao.getDailyTasks("2018/05/20"));
			
			/** 업무 수정 */
			//dao.setDailyTask("새로운업무", "테라스 외부 청소", "2018/11/11", "오픈");	//기능 ok
			//비기능: addDailyTask로 같은 쿼리문으로 여러번 들어간 경우 update 안됨
			
			System.out.println("\nend");
	}
}
