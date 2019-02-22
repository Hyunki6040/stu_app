package poly.persistance.mapper;



import java.util.List;

import config.Mapper;
import poly.dto.AdminDTO;


@Mapper("AdminMapper")
public interface AdminMapper {
	public AdminDTO getAdmin(String campus) throws Exception;
}
