package service;

import java.util.List;

import bean.Admin;
import bean.ResumeCustom;
import bean.User;

public interface UserService {
	
	
	public Admin selectByPrimaryKeyAdmin(int adminid) throws Exception;

	public Admin selectByNameAdmin(Admin admin) throws Exception;

	

	//查看所有用户
	public List<User> findAllUser() throws Exception;
		
	

	public User userLogin(User user);

	public int userRegister(User user);
	
	//用户修改个人资料，即手机号、邮箱
	//public void userUpdateProfile(Integer id,User user);
	
	//根据用户名，查找该用户所有信息
	public User findUser(User user);
	
	//根据ID，显示用户信息
	public User findUserById(Integer id) throws Exception;
	
	//修改用户信息
	public void updateProfile(Integer id, User user) throws Exception;

	//修改密码
	public void userUpdatePwd(Integer id, User user) throws Exception;
	
	//删除
	public void deleteUser(User user) throws Exception;
	
	public List<ResumeCustom> findResumeList(User user) throws Exception;
	
}
