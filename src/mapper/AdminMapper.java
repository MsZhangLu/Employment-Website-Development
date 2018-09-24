package mapper;

import bean.Admin;

public interface AdminMapper {

	public Admin selectByPrimaryKey(int adminid) throws Exception;
	
	public Admin selectByName(Admin admin) throws Exception;
	
}
