package com.itss.matrix.test;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itss.matrix.model.ManualDAO;

public class ManualDAOTest {
	public static void main(String[] args) {
		ManualDAO dao;
		dao = new ManualDAO();
		//System.out.println(dao.getManualTasks());
		//System.out.println(dao.getSpaceTypes());
		//System.out.println(dao.getTaskTypesBySpaceType("홀"));
		//System.out.println(dao.getManualTasksSeq("바닥 쓸기"));
		//System.out.println(dao.getTaskTypes());
		//System.out.println(dao.getSpaceTypesByTaskType("위생관리"));
		//System.out.println(dao.getTasks("홀", "위생관리"));
		
		System.out.println(dao.getManualTaskSeq("바닥 닦기"));
		System.out.println(dao.getManualTaskSeq("바닥 "));
	}
}
