package com.itss.matrix.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
			
			/** 파트별 - 선택한 날짜, 배정대상에 해당하는 업무 목록 보기 */
			//System.out.println(dao.getDailyTasksForParts("2018/05/20", "마감"));	//기능 ok. cmd & console:null항목은 아예 출력 안됨
			//System.out.println(dao.getDailyTasksForParts("2440/12/31", "지구종말"));	//비기능 cmd:선택된 레코드가 없습니다. console:[]
			
			/** 개인별 - 선택한 날짜에 해당하는 업무 목록 보기 */
			//System.out.println(dao.getDailyTasksForPerson("2018/05/18"));	//기능 ok
			//System.out.println(dao.getDailyTasksForPerson("2400/10/10"));	//비기능 cmd:선택된 레코드가 없습니다. console:[]
			
			/** 업무 중복확인 */
			//System.out.println(dao.isDailyTask("직접해라직접", "2018/11/11"));
			//System.out.println(dao.isDailyTask("바닥 쓸기", "2400/20/20"));
			
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
			
			
			/*DAO예외처리 테스트*/
			//dao.addDailyTask(null, "2018/01/01", 1, "개인", "taehun", 1);
			//dao.addDailyTask("환풍기 청소", "2018/01/01", 0, "파트", "오픈", 1);
			//dao.addDailyTask("test", "2018/01/01", 0, "파트", "오픈", 1);
			//dao.addDailyTask("test2", "2018/01/01", 0, "없는배정유형", "몰라", 1);
			//System.out.println(dao.getAssignedParts("2020/12/12"));
			//System.out.println(dao.getDailyTasksForParts("2440/12/31", "새벽"));
			//System.out.println(dao.getDailyTasksForPerson("2440/12/31"));
			//System.out.println(dao.isDailyTask("에어컨 필터 교체", "2018/01/01"));
			//System.out.println(dao.isDailyTask("에어컨 필터 교체", "2020/31/11"));
			//dao.addDailyTask("중요도 0,1이 아닌경우", "2018/01/01", 3, "개인", "yunseok", 1);
			//dao.addDailyTask("", "2018/01/01", 3, "개인", "yunseok", 1);
			//dao.addDailyTask("없는파트에 업무배정1", "2018/01/01", 1, "파트", "없는파트", 1);
			//dao.addDailyTask("없는 직원에 업무배정 test", "2018/01/01", 1, "개인", "yunseok", 1);
			//dao.addDailyTask("없는 관리자코드에 업무배정 exception", "2018/01/01", 1, "파트", "마감", 10);
			//dao.setDailyTask("바꾸려는업무", "test23", "2018/01/01", "오픈");
			//dao.setDailyTask("손 세정제 리필", "현금 시재 확인", "2018/01/01", "미들"); // 현금 새재 확인 - 미들
			//dao.setDailyAssign(null, null, "2018/01/01", "파트", "새벽", "야간개장 준비");
			//dao.setDailyAssign("파트", "새벽", "2018/01/01", "파트", "마감", "야간개장 준비");
			//dao.getAssignedParts("2018/05/31");
			//System.out.println(dao.getDailyTasksForPerson("2018/05/30"));
			//dao.setDailyAssign("파트", "없는파트", "2018/01/01", "파트", "마감", "환풍기 청소");
			//dao.setDailyAssign("개인", "없는직원", "2018/01/01", "파트", "마감", "환풍기 청소");
			//dao.setDailyAssign("없는타입", "아무거나", "2018/01/01", "파트", "마감", "환풍기 청소");
			
			//System.out.println(dao.getDailyTask("환풍기 청소", "2018/01/01", "오픈"));
			//System.out.println(dao.getDailyTask("환풍기", "2018/01/01", "마감"));
			//dao.removeDailyTask("test", "2018/01/01", "파트", "새벽");
			//dao.setDailyTask("직접입력업무를 입력할때는 VARCHAR2(60)이 넘으면 안된다", "test", "2018/01/01", "오픈");
			//dao.addDailyTask("직접입력업무를 입력할때는 VARCHAR2(60)이 넘으면 안된다", "2018/01/01", 1, "파트", "마감", 1);
			//dao.addDailyTask("testtest", "2018/01/01", 1, "파트", "마감", 1);
			//dao.setDailyTask("새로운 업무", "바꾸려는 업무", "2018/01/01", "오픈");
			//dao.removeDailyTask("test", "2018/01/01", "파트", "오픈");
			
			System.out.println("\nend");
	}
}
