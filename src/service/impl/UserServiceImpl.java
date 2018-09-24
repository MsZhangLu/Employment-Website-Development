package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bean.Admin;
import bean.ResumeCustom;
import bean.User;
import mapper.UserMapper;
import service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired(required=false)
	public UserMapper userMapper;
	
	@Override
	public Admin selectByPrimaryKeyAdmin(int adminid) throws Exception {
		return userMapper.selectByPrimaryKeyAdmin(adminid);
	}

	@Override
	public Admin selectByNameAdmin(Admin admin) throws Exception {
		return userMapper.selectByNameAdmin(admin);
	}
	
	//用户登录
	@Override
	public User userLogin(User user){
		return this.userMapper.userLogin(user);
	}
	
	//新用户注册
	@Override
	public int userRegister(User user) {
		return userMapper.userRegister(user);
	}

	//根据用户名，查找该用户所有信息
	@Override
	public User findUser(User user){
		return userMapper.findUser(user);
	}

	//根据用户id，显示用户资料
	@Override
	public User findUserById(Integer id) throws Exception{
		User user = userMapper.selectByPrimaryKey(id);
		//返回User
		return user;
	}
	
	//修改用户信息
	@Override
	public void updateProfile(Integer id, User user) throws Exception {
		user.setId(id);
		userMapper.updateByPrimaryKey(user);
	}
	
	//修改密码
	@Override
	public void userUpdatePwd(Integer id, User user) throws Exception {
		user.setId(id);
		userMapper.userUpdatePwd(user);
	}

	//查看所有用户
	@Override
	public List<User> findAllUser() throws Exception {
		return userMapper.findAllUser();
	}
	
	//删除用户
	@Override
	public void deleteUser(User user) throws Exception{
		userMapper.deleteByPrimaryKey(user);
	}
	
	//简历表
	@Override
	public List<ResumeCustom> findResumeList(User user) throws Exception{
		return userMapper.findResumeList(user);
	}
}
