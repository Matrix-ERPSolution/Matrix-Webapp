package com.itss.matrix.action;

public class ActionFactory {
	public static Action getAction(String cmd){
		Action a = null;
		
		switch(cmd){
		case "homeUI":
			a = new HomeUI();
			break;
		case "loginUI":
			a = new LoginUI();
			break;
		case "loginAction":
			a = new LoginAction();
			break;
		case "headerAdminUI":
			a = new HeaderAdminUI();
			break;
		}
		return a;
	}
}
