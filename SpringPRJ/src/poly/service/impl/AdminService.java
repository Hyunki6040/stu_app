package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.AdminDTO;
import poly.persistance.mapper.AdminMapper;
import poly.service.IAdminService;

@Service("AdminService")
public class AdminService implements IAdminService {

	@Resource(name = "AdminMapper")
	private AdminMapper adminMapper;
	
	@Override
	public AdminDTO getAdmin(String campus) throws Exception {
		AdminDTO admin = adminMapper.getAdmin(campus);
		return admin;
	}
	

}
