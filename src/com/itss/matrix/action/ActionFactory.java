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
		case "addUserNextUI":
			a=new AddUserNextUI();
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
		case "tabMenuAdminUI":
			a = new TabMenuAdminUI();
			break;
		case "tabMenuStaffUI":
			a = new TabMenuStaffUI();
			break;
		case "dailyTaskAdminUI":
			a = new DailyTaskAdminUI();
			break;
		case "setDailyTaskUI":
			a = new SetDailyTaskUI();
			break;
		case "setDailyAssignUI":
			a = new SetDailyAssignUI();
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
		case "getDailyTasksAction":
			a = new GetDailyTasksAction();
			break;
		case "setDailyTaskAction":
			a = new SetDailyTaskAction();
			break;
		case "setDailyAssignAction":
			a = new SetDailyAssignAction();
			break;
		case "removeDailyTaskAction":
			a = new RemoveDailyTaskAction();
			break;
		case "getRecommendedTasksAction":
			a = new GetRecommendedTasksAction();
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
		case "getWorkPartsAction":
			a = new GetWorkPartsAction();
			break;
		case "getAssignableStaffsAction":
			a = new GetAssignableStaffsAction();
			break;
		case "searchManualTasksAction":
			a = new SearchManualTasksAction();
			break;
		case "addDailyTaskAction":
			a = new AddDailyTaskAction();
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
		case "getUserIdByPhoneNumAction":
			a=new GetUserIdByPhoneNumAction();
			break;
		case "getPreStaffsAction":
			a=new GetPreStaffsAction();
			break;
		case "setJoinDateAction":
			a=new SetJoinDateAction();
			break;
		case "removeStaffAction":
			a=new RemoveStaffAction();
			break;
		case "getWorkingStaffsAction":
			a=new GetWorkingStaffsAction();
			break;
		case "setWorkPartAction" :
			a=new SetWorkPartAction();
			break;
		case "setLeaveDateAction":
			a=new SetLeaveDateAction();
			break;
		case "getLeftStaffsAction":
			a=new GetLeftStaffsAction();
			break;
		case "getStaffDetailAction":
			a=new GetStaffDetailAction();
			break;
		}
		return a;
	}
}
