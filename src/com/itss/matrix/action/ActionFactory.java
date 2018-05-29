package com.itss.matrix.action;

public class ActionFactory {
	public static Action getAction(String cmd){
		Action a = null;

		switch(cmd){
		/*UI*/
		case "homeUI":
			a = new HomeUI();
			break;
		case "loginUI":
			a = new LoginUI();
			break;
		case "addUserUI":
			a = new AddUserUI();
			break;
		case "certificationUI":
			a = new CertificationUI();
			break;
		case "certifyStaffUI":
			a = new CertifyStaffUI();
			break;
		case "certifyAdminUI":
			a = new CertifyAdminUI();
			break;
		case "findIdPasswordUI":
			a = new FindIdPasswordUI();
			break;
		case "headerAdminUI":
			a = new HeaderAdminUI();
			break;
		case "headerStaffUI":
			a = new HeaderStaffUI();
			break;
		case "dailyTaskAdminUI":
			a = new DailyTaskAdminUI();
			break;
		case "assignTaskAdminUI":
			a = new AssignTaskAdminUI();
			break;
		case "assignTaskNextAdminUI":
			a = new AssignTaskNextAdminUI();
			break;
		case "manualAdminUI":
			a = new ManualAdminUI();
			break;
		case "staffManagementAdminUI":
			a = new StaffManagementAdminUI();
			break;
		case "staffDetailAdminUI":
			a = new staffDetailAdminUI();
			break;
			
		/*Action*/
		case "loginAction":
			a = new LoginAction();
			break;
		case "getCertifiedInfoAction":
			a = new GetCertifiedInfoAction();
			break;
		case "getAssignedPartsAction":
			a = new GetAssignedPartsAction();
			break;
		case "getSpaceTypesAction":
			a = new GetSpaceTypesAction();
			break;
		case "getTaskTypesAction":
			a = new GetTaskTypesAction();
			break;
		case "getTaskTypesBySpaceTypeAction":
			a = new GetTaskTypesBySpaceTypeAction();
			break;
		case "getSpaceTypesByTaskTypeAction":
			a = new GetSpaceTypesByTaskTypeAction();
			break;
		case "getManualTasksAction":
			a = new GetManualTasksAction();
			break;
		case "getSlideInfoAction":
			a = new GetSlideInfoAction();
			break;
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
		case "getUserIdByPhoneNumAction":
			a=new GetUserIdByPhoneNumAction();
			break;
		}
		return a;
	}
}
