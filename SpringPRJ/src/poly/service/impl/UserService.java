package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.StuDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.UserMapper;
import poly.service.IUserService;

@Service("UserService")
public class UserService implements IUserService {

	@Resource(name = "UserMapper")
	private UserMapper userMapper;

	@Override
	public String getBarcode(String stu_no) throws Exception {
		return userMapper.getBarcode(stu_no);
	}

	@Override
	public String getLogin(UserDTO mDTO) throws Exception {
		return userMapper.getLogin(mDTO);
	}

	@Override
	public StuDTO getStudent(String stu_no) throws Exception {
		return userMapper.getStudent(stu_no);
	}
	
	@Override
	public UserDTO getUser(String stu_no) throws Exception {
		return userMapper.getUser(stu_no);
	}

	@Override
	public void keepLogin(UserDTO mDTO) throws Exception {
		userMapper.keepLogin(mDTO);
	}

	@Override
	public String checkLoginBefore(String session_key) throws Exception {
		return userMapper.checkUserWithSessionKey(session_key);
	}

	@Override
	public int insertUser(UserDTO uDTO) throws Exception {
		return userMapper.insertUser(uDTO);
	}

	@Override
	public String getCompare(StuDTO sDTO) throws Exception {
		return userMapper.getCompare(sDTO);
	}

	@Override
	public String getIdChk(String stu_no) throws Exception {
		System.out.println("service");
		return userMapper.getIdChk(stu_no);
	}

	@Override
	   public int updatePhoto(UserDTO pDTO) throws Exception {
	      return userMapper.updatePhoto(pDTO);
	   }
	@Override
	   public int setPassword(UserDTO uDTO) throws Exception {
	      return userMapper.setPassword(uDTO);
	   }
	
	@Override
	   public int deleteUser(String stu_no) throws Exception {
	      return userMapper.deleteUser(stu_no);
	   }

}
