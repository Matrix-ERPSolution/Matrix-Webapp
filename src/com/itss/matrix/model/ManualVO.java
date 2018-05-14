package com.itss.matrix.model;

public class ManualVO {
	/**member data*/
	private int manualTasksSeq;
	private String task;
	private String repeatType;
	private String repeatDetail;
	private String spaceType;
	private String taskType;
	
	/**constructor: null값 있는 경우*/
	public ManualVO(int manualTasksSeq, String task, String spaceType, String taskType) {
		setManualTasksSeq(manualTasksSeq);
		setTask(task);
		setSpaceType(spaceType);
		setTaskType(taskType);
	}

	/**constructor: null값 없는 경우*/
	public ManualVO(int manualTasksSeq, String task, String repeatType, String repeatDetail, String spaceType, String taskType) {
		this(manualTasksSeq, task, spaceType, taskType);
		setRepeatType(repeatType);
		setRepeatDetail(repeatDetail);
	}

	/**get(), set()*/
	public int getManualTasksSeq() {
		return manualTasksSeq;
	}
		public String getTask() {
		return task;
	}
	public String getRepeatType() {
		return repeatType;
	}
	public String getRepeatDetail() {
		return repeatDetail;
	}
	public String getSpaceType() {
		return spaceType;
	}
	public String getTaskType() {
		return taskType;
	}

	private void setManualTasksSeq(int manualTasksSeq) {
		this.manualTasksSeq = manualTasksSeq;
	}
	private void setTask(String task) {
		this.task = task;
	}
	private void setRepeatType(String repeatType) {
		this.repeatType = repeatType;
	}
	private void setRepeatDetail(String repeatDetail) {
		this.repeatDetail = repeatDetail;
	}
	private void setSpaceType(String spaceType) {
		this.spaceType = spaceType;
	}
	private void setTaskType(String taskType) {
		this.taskType = taskType;
	}

	/**toString()*/
	@Override
	public String toString() {
		return "ManualVO [manualTasksSeq=" + manualTasksSeq + ", task=" + task + ", repeatType=" + repeatType
				+ ", repeatDetail=" + repeatDetail + ", spaceType=" + spaceType + ", taskType=" + taskType + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + manualTasksSeq;
		return result;
	}

	/**equals()*/
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ManualVO other = (ManualVO) obj;
		if (manualTasksSeq != other.manualTasksSeq)
			return false;
		return true;
	}

	
}
