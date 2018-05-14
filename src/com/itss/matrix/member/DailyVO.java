package com.itss.matrix.member;

import java.util.Date;

public class DailyVO {
	private int dailyTasksSeq;
	private String taskText;
	private Date assignDate;
	private int importance;
	private String assignType;
	private String assignDetail;
	private int manualTasksSeq;
	private String finisherId;
	private String finisherName;
	private String assignerId;
	private int branchSeq;

	/**업무 배정*/
	public DailyVO(String taskText, Date assignDate, int importance, String assignType, String assignDetail, String assignerId, int branchSeq) {
		setTaskText(taskText);
		setAssignDate(assignDate);
		setImportance(importance);
		setAssignDetail(assignDetail);
		setAssignerId(assignerId);
		setBranchSeq(branchSeq);
	}
	/**?*/
	public DailyVO(int dailyTasksSeq, String taskText, Date assignDate, int importance, String assignType, String assignDetail, String assignerId, int branchSeq) {
		this(taskText, assignDate, importance, assignType, assignDetail, assignerId, branchSeq);
		setDailyTasksSeq(dailyTasksSeq);
	}
	public DailyVO(int dailyTasksSeq, String taskText, Date assignDate, int importance, String assignType, String assignDetail, int manualTasksSeq, String assignerId, int branchSeq) {
		this(taskText, assignDate, importance, assignType, assignDetail, assignerId, branchSeq);
		setDailyTasksSeq(dailyTasksSeq);
		setManualTasksSeq(manualTasksSeq);
	}
	
	public int getDailyTasksSeq() {
		return dailyTasksSeq;
	}
	public String getTaskText() {
		return taskText;
	}
	public Date getAssignDate() {
		return assignDate;
	}
	public int getImportance() {
		return importance;
	}
	public String getAssignType() {
		return assignType;
	}
	public String getAssignDetail() {
		return assignDetail;
	}
	public int getManualTasksSeq() {
		return manualTasksSeq;
	}
	public String getFinisherId() {
		return finisherId;
	}
	public String getFinisherName() {
		return finisherName;
	}
	public String getAssignerId() {
		return assignerId;
	}
	public int getBranchSeq() {
		return branchSeq;
	}
	
	private void setDailyTasksSeq(int dailyTasksSeq) {
		this.dailyTasksSeq = dailyTasksSeq;
	}
	private void setTaskText(String taskText) {
		this.taskText = taskText;
	}
	private void setAssignDate(Date assignDate) {
		this.assignDate = assignDate;
	}
	private void setImportance(int importance) {
		this.importance = importance;
	}
	private void setAssignType(String assignType) {
		this.assignType = assignType;
	}
	private void setAssignDetail(String assignDetail) {
		this.assignDetail = assignDetail;
	}
	private void setManualTasksSeq(int manualTasksSeq) {
		this.manualTasksSeq = manualTasksSeq;
	}
	private void setFinisherId(String finisherId) {
		this.finisherId = finisherId;
	}
	private void setFinisherName(String finisherName) {
		this.finisherName = finisherName;
	}
	private void setAssignerId(String assignerId) {
		this.assignerId = assignerId;
	}
	private void setBranchSeq(int branchSeq) {
		this.branchSeq = branchSeq;
	}
	
	@Override
	public String toString() {
		return "DailyVO [dailyTasksSeq=" + dailyTasksSeq + ", taskText=" + taskText + ", assignDate=" + assignDate
				+ ", importance=" + importance + ", assignType=" + assignType + ", assignDetail=" + assignDetail
				+ ", manualTasksSeq=" + manualTasksSeq + ", finisherId=" + finisherId + ", finisherName=" + finisherName
				+ ", assignerId=" + assignerId + ", branchSeq=" + branchSeq + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + dailyTasksSeq;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DailyVO other = (DailyVO) obj;
		if (dailyTasksSeq != other.dailyTasksSeq)
			return false;
		return true;
	}
	
	
}
