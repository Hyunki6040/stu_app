package poly.service;

import poly.dto.AdminDTO;
import poly.dto.StuDTO;
import poly.dto.UserDTO;

public interface IUserService {
	public String getBarcode(String stu_no) throws Exception;
	public String getLogin(UserDTO mDTO) throws Exception;
	public StuDTO getStudent(String stu_no) throws Exception;
	public UserDTO getUser(String stu_no) throws Exception;
	public int getPhotoNum(String stu_no) throws Exception;
	
	public void keepLogin(UserDTO mDTO) throws Exception;
	public String checkLoginBefore(String session_key) throws Exception;
	
	public int insertUser(UserDTO uDTO) throws Exception;
	   public String getCompare(StuDTO sDTO) throws Exception;
	   public String getIdChk(String stu_no) throws Exception;
	   public String getNickNameCk(String nickname) throws Exception;   
	   public int updatePhoto(UserDTO pDTO) throws Exception;
	   public int setPassword(UserDTO uDTO) throws Exception;
	   public int setNickname(UserDTO uDTO) throws Exception;
	   public int deleteUser(String stu_no) throws Exception;
	
	public AdminDTO getSetting(String campus) throws Exception;
	public int updatePeriod(String stu_no) throws Exception;
	public String getPath(String stu_no) throws Exception;
}
