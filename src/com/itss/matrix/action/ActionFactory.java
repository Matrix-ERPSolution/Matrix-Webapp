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
		case "getSlideInfoAction":
			a = new GetSlideInfoAction();
			break;
		//180526 태훈;
		case "isUserPhoneAction":
			a= new IsUserPhoneAction();
			break;
		case "isUserIdAction":
			a=new IsUserIdAction();
			break;
		case "getUserPhoneAction":
			a=new GetUserPhoneAction();
			break;
		case "addUserNextAction":
			a=new AddUserNextAction();
			break;

		}
		return a;
	}
}
