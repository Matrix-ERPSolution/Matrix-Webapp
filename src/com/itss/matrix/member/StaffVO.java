package com.itss.matrix.member;

public class StaffVO {
	/**member data*/
	private String workPart;
	private String staffName;
	private String staffId;
	
	/**constructor*/
	public StaffVO(String workPart, String staffName) {
		setWorkPart(workPart);
		setStaffName(staffName);
	}
	
	/**get(), set()*/
	public String getWorkPart() {
		return workPart;
	}
	public String getStaffName() {
		return staffName;
	}
	public String getStaffId() {
		return staffId;
	}
	
	private void setWorkPart(String workPart) {
		this.workPart = workPart;
	}
	private void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	private void setStaffId(String staffId) {
		this.staffId = staffId;
	}

	/**toString()*/
	@Override
	public String toString() {
		return "StaffVO [workPart=" + workPart + ", staffName=" + staffName + ", staffId=" + staffId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((staffId == null) ? 0 : staffId.hashCode());
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
		StaffVO other = (StaffVO) obj;
		if (staffId == null) {
			if (other.staffId != null)
				return false;
		} else if (!staffId.equals(other.staffId))
			return false;
		return true;
	}
	
}
