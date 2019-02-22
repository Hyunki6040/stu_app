package poly.service;

import java.util.List;

import poly.dto.AdminDTO;

public interface IAdminService {
	public AdminDTO getAdmin(String campus) throws Exception;
}
