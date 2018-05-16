package com.itss.matrix.test;

import com.itss.matrix.model.DailyDAO;

public class DailyDAOTest {

	public static void main(String[] args) {
			DailyDAO dao = new DailyDAO();
			//System.out.println(dao.getAssignTypes("2018/05/10"));
			//dao.removeDailyTask("바닥 쓸기", "2018/05/15", "파트", "마감");
			dao.setDailyAssign("파트", "오픈", "2018/05/15", "파트", "마감", "바닥 쓸기");
			//void 메소드 테스트할 때 결과 출력 안되니까 조심
			//
	}
}
