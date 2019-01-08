package poly.persistance.mapper;



import config.Mapper;
import poly.dto.StuDTO;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {
	public String getBarcode(String stu_no) throws Exception;
	public String getLogin(UserDTO mDTO) throws Exception;
	public StuDTO getStudent(String stu_no) throws Exception;
	public UserDTO getUser(String stu_no) throws Exception;
	
	// 로그인 유지 처리
	public void keepLogin(UserDTO mDTO) throws Exception;
	// 세션키 검증
	public String checkUserWithSessionKey(String session_key) throws Exception;
	public int insertUser(UserDTO uDTO) throws Exception;
	   public String getCompare(StuDTO sDTO) throws Exception;
	   public String getIdChk(String stu_no) throws Exception;
	   public int updatePhoto(UserDTO pDTO) throws Exception;
	   public int setPassword(UserDTO uDTO) throws Exception;
	   public int deleteUser(String stu_no) throws Exception;
}
