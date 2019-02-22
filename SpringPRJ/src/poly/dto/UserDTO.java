package poly.dto;

import java.sql.Date;

public class UserDTO {

	private int user_no; //유저 번호
	private String stu_no; //학번
	private String password; //비밀번호
	private String reg_dt; //가입일자
	private String barcode_no; //바코드 번호
	private String photo;//사진
	private String nickname; //익명
	private String campus; //캠퍼스 구분
	private int photo_num;//사진 수정 횟수
	
	//자동로그인
	private String session_key;
	private Date session_limit;
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getStu_no() {
		return stu_no;
	}
	public void setStu_no(String stu_no) {
		this.stu_no = stu_no;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getBarcode_no() {
		return barcode_no;
	}
	public void setBarcode_no(String barcode_no) {
		this.barcode_no = barcode_no;
	}
	public String getSession_key() {
		return session_key;
	}
	public void setSession_key(String session_key) {
		this.session_key = session_key;
	}
	public Date getSession_limit() {
		return session_limit;
	}
	public void setSession_limit(Date session_limit) {
		this.session_limit = session_limit;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getCampus() {
		return campus;
	}
	public void setCampus(String campus) {
		this.campus = campus;
	}
	public int getPhoto_num() {
		return photo_num;
	}
	public void setPhoto_num(int photo_num) {
		this.photo_num = photo_num;
	}
	
	
	
}
