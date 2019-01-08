package poly.dto;



public class StuDTO {
	private String stu_no; //학번
	private String Department; //학과
	private String stu_name; //학과
	private String birth_date; //생일
	private String reg_dt; //등록일자
	private String payment;
	
	public String getStu_no() {
		return stu_no;
	}
	public void setStu_no(String stu_no) {
		this.stu_no = stu_no;
	}
	public String getDepartment() {
		return Department;
	}
	public void setDepartment(String Department) {
		this.Department = Department;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	
}
