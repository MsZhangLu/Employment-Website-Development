package mapper;

import java.util.List;

import bean.Admin;
import bean.ResumeCustom;
import bean.User;

/**
 * @author vickie
 * 此接口文件直接和UserMapper.xml对应
 * 与用户有关的数据库操作接口
 *
 */
public interface UserMapper {
	
	public Admin selectByPrimaryKeyAdmin(int adminid) throws Exception;
	
	public Admin selectByNameAdmin(Admin admin) throws Exception;

	
	
	//查看所有用户
	public List<User> findAllUser() throws Exception;
	
	
	//新用户注册
	public int userRegister(User user);
	//用户登录，进行用户名和密码的检查
	public User userLogin(User user);
	//用户修改个人资料，即手机号、邮箱
	public void userUpdateProfile(User user);
	//验证用户密码
	public User userValiate();
	//用户修改密码
	public int userUpdatePwd();
	
	//根据用户名，查找该用户所有信息
	public User findUser(User user);
	
	//查看我收到的简历列表
	public List<ResumeCustom> findResumeList(User user) throws Exception;
	

	
	
	
	
	
	public User selectByPrimaryKey(int id);
	
	public void updateByPrimaryKey(User user);
	
	//修改密码
	public void userUpdatePwd(User user);
	
	//删除
	public void deleteByPrimaryKey(User user);
	
}
