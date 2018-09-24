package controller;

//import java.util.HashMap;
import java.util.List;
//import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Company;
import bean.District;
import bean.Job;
import bean.JobCustom2;
import bean.JobCustom3;
import bean.Job_type;
import bean.ResumeCustom;
import bean.User;
import bean.UserCustom;
import service.JobService;
import service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	public UserService us;
	
	@Autowired
	public JobService js;
	
	@RequestMapping("/test1")
	public String testAllUser(){
		return "/back/allUser";
	}
	
	//默认打开登录页
	@RequestMapping("/userLogin")
	public ModelAndView userLogin() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", new User());
		mv.setViewName("/front/userLogin");
		return mv;
	}
	
	//用户登录，验证
	@RequestMapping("/userLoginSumbit")
	public ModelAndView userLoginSumbit(HttpServletRequest req) throws Exception{
		String user_name =  req.getParameter("user_name");
		String user_password = req.getParameter("user_password");
		
		User user = new User();
		user.setUser_name(user_name);
		user.setUser_password(user_password);
		
		ModelAndView mv = new ModelAndView();
		
		user = us.userLogin(user);
		
		if(user!=null){
			System.out.println(user.getId());
			mv.setViewName("/front/welcome");
			req.getSession().setAttribute("user", user);
		} else{
			mv.addObject("error", "用户名或密码输入错误，请重新输入");
			mv.addObject("back", "user/userLogin");
			mv.setViewName("/front/fail");
		}
		return mv;
	}
	
	//用户退出登录
		@RequestMapping("/userLogout")
		public ModelAndView userLogout(HttpServletRequest req) throws Exception{
			ModelAndView mv = new ModelAndView();
			mv.addObject("confirm", "您确定退出登录吗？");
			mv.addObject("go", "user/useLogoutConfirm");
			mv.setViewName("/front/confirm");
			return mv;
		}
	
	//用户确认退出登录
	@RequestMapping("/userLogoutConfirm")
	public ModelAndView userLogoutConfirm(HttpServletRequest req) throws Exception{
		req.getSession().setAttribute("user", null);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/front/welcome");
		return mv;
	}
	
	

	//打开用户注册页
	@RequestMapping("/userRegister")
	public ModelAndView userRegister() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("userCustom", new UserCustom());
		mv.setViewName("/front/userRegister");
		return mv;
	}
	
	//用户注册
	@RequestMapping("/userRegisterSubmit")
	public ModelAndView userRegisterSubmit(HttpServletRequest req) throws Exception{
		User user = new User();
		
		ModelAndView mv = new ModelAndView();
		//查询系统中，用户名是否已经被使用
		String user_name = req.getParameter("user_name");
		user.setUser_name(user_name);
		if(us.findUser(user)!=null){
			System.out.println("该用户名已被占用，不能注册");
			mv.addObject("error", "该用户名已被占用，不能注册，请重新输入");
			mv.addObject("back", "user/userRegister");
			mv.setViewName("/front/fail");
		} else{
			//两次密码是否匹配
			String user_password = req.getParameter("user_password");
			String user_password2 = req.getParameter("user_password2");
			
			if(user_password.equals(user_password2)){
				System.out.println("密码一致，可以注册");
				
				user.setUser_name(req.getParameter("user_name"));
				user.setUser_password(req.getParameter("user_password"));
				user.setUser_mobile(req.getParameter("user_mobile"));
				user.setUser_email(req.getParameter("user_email"));
				us.userRegister(user);
				mv.addObject("success", "恭喜您，您已注册成为“蓝领劳务”的新用户~");
				mv.addObject("back", "user/userLogin");
				mv.addObject("info", "登录页面");
				mv.setViewName("/front/success");
				
			} else{
				mv.addObject("error", "密码输入不匹配，请重新输入");
				mv.addObject("back", "user/userRegister");
				mv.setViewName("/front/fail");
			}
		}
		return mv;
	}
		
	//显示用户卡片
	@RequestMapping("/myProfile")
	public String myProfile(Model model, @RequestParam(value="userid",required=true) Integer id) throws Exception{
		User user = us.findUserById(id);
		System.out.println(id+"cccc");
		model.addAttribute("user", user);
		return "/front/myProfile";
	}
	
	//用户信息页面展示
	@RequestMapping("/editProfile")
	//@RequestParam里面指定request传入参数名称和形参进行绑定
	public String editProfile(Model model, @RequestParam(value="userid",required=true) Integer userid ) throws Exception{
		//调用service根据id查询用户信息
		User user = us.findUserById(userid);
		
		//通过形参中的model将model数据传到页面
		//相当于ModelAndView。addObject 方法
		model.addAttribute("user", user);
		return "/front/editProfile";
	}
	
	//用户信息提交
	@RequestMapping("/editProfileSubmit")
	public ModelAndView editProfileSubmit(HttpServletRequest req, @RequestParam(value="userid",required=true) Integer userid, User user) throws Exception{
		//调用service更新用户信息
		System.out.println("user_name" + user.getUser_name() +"user_pwd" + user.getUser_password());
		us.updateProfile(userid, user);
		System.out.println("修改成功！");
		ModelAndView mv = new ModelAndView();
		mv.addObject("success", "个人信息修改成功～");
		mv.addObject("info", "个人信息页");
		mv.addObject("back", "user/myProfile?userid=" + userid);
		mv.setViewName("/front/success");
		return mv;
	}
	
	//显示修改密码页面
	@RequestMapping("/editPwd")
	public String editPwd(Model model, @RequestParam(value="userid",required=true) Integer userid) throws Exception{
		User user = us.findUserById(userid);
		model.addAttribute("user", user);
		return "/front/editPwd";
	}
	
	//验证旧密码是否正确
	//验证两次新密码输入是否一致
	//修改密码
	@RequestMapping("/editPwdSubmit")
	public ModelAndView editPwdSubmit(HttpServletRequest req, @RequestParam(value="userid",required=true) Integer userid) throws Exception{
		User user = us.findUserById(userid);
		String user_password = req.getParameter("user_password");
		System.out.println("获取的密码"+user_password);
		System.out.println("user的密码"+user.getUser_password());
		System.out.println("验证成功");
		ModelAndView mv = new ModelAndView();
		if(user_password.equals(user.getUser_password())){
			String user_password_new = req.getParameter("user_password_new");
			String user_password_new2 = req.getParameter("user_password_new2");

			if(user_password_new.equals(user_password_new2)){
				//修改密码
				user.setUser_password(user_password_new2);
				us.userUpdatePwd(userid, user);
				mv.addObject("success", "密码修改成功～");
				mv.addObject("info", "个人信息页");
				mv.addObject("back", "user/myProfile?userid=" + userid);
				mv.setViewName("/front/success");
				return mv;
				
			} else {
				mv.addObject("error", "新密码不一致，密码修改失败＝＝");
				mv.addObject("back", "user/myProfile?userid=" + userid);
				mv.setViewName("/front/success");
				mv.setViewName("/front/fail");
				return mv;			
			}
		} else{
			mv.addObject("error", "密码输入错误，修改失败＝＝");
			mv.addObject("back", "user/editPwd?userid=" + userid);
			mv.setViewName("/front/success");
			mv.setViewName("/front/fail");
			return mv;
		}
		
	}
		
	//查询“我”发布的职位信息
	@RequestMapping("/myHire")
	public ModelAndView myHire(HttpServletRequest req,
			@RequestParam(value="userid",required=true) Integer userid) throws Exception{
		//String user_name = req.getParameter("user_name");
		User user = us.findUserById(userid);
		
		//调用service查找数据库，查询职位列表
		List<JobCustom2> myHireList = js.findMyHire(user);
		//返回ModelAndView
		ModelAndView mv = new ModelAndView();
		mv.addObject("myHireList", myHireList);
		//指定视图
		mv.setViewName("/front/myHire");
		return mv;
	}
	
	//查看我发布的职位详情
	@RequestMapping("/myHireDetail")
	public ModelAndView myHireDetail(HttpServletRequest req,
			@RequestParam(value="jobid",required=true) Integer jobid) throws Exception{
		System.out.println("jobid是"+jobid);
		//调用service，根据jobid查找job 信息包装成JobCustom3对象返回页面
		JobCustom3 j = new JobCustom3();
		j.setId(jobid);
		
		JobCustom3 jobCustom3 = new JobCustom3();
		jobCustom3 = js.findJobDetails(j);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("jobCustom3", jobCustom3);
		
		mv.setViewName("/front/myHireDetail");
		return mv;
	}
	
	//职位信息页面展示
	@RequestMapping("/editJob")
	public ModelAndView editJob(HttpServletRequest req,@RequestParam(value="jobid",required=true) Integer jobid) throws Exception{
		//调用service查询职位详细信息
		JobCustom3 jobCustom3 =  js.findJobById(jobid);
		jobCustom3 = js.findJobDetails(jobCustom3);
		
		//返回ModelAndView 
		ModelAndView mv = new ModelAndView();
		//将职位信息放到model 
		mv.addObject("jobCustom3", jobCustom3); 
		mv.setViewName("/front/editJob");
		return mv;
	}
	
	//职位信息修改后的提交
	@RequestMapping("/editJobSubmit")
	public ModelAndView editJobSubmit(HttpServletRequest req, 
			@RequestParam(value="userid",required=true) Integer userid,
			@RequestParam(value="jobid",required=true) Integer jobid) throws Exception{
		//调用service更新职位信息，页面需要将信息传到此方法
		String job_type_name = req.getParameter("job_type_name");
		System.out.println("获取到的类别名称："+job_type_name);
		//调用service，根据类别名称查找id
		Job_type jt = new Job_type();
		jt.setJob_type_name(job_type_name);
		jt = js.selectJob_typeByName(jt);
		
		//调用service,根据区名查找id
		String district_name = req.getParameter("district_name");
		System.out.println("获取到区名：" + district_name);
		District d = new District();
		d.setDistrict_name(district_name);
		d = js.selectDistrictByName(d);
		
		System.out.println(userid+"idshi");
		User u = us.findUserById(userid);
		
		//调用service，如果公司已经存在，直接返回公司ID；如果公司不存在，在tb_company中新建公司，在返回相应ID
		String cp_name = req.getParameter("cp_name");
		System.out.println("获取到的公司名：" + cp_name);
		Company c = new Company();
		c.setCp_name(cp_name);
		c = js.selectCompanyByName(c);
		
		if(c==null){
			Company c2 = new Company();
			c2.setCp_name(cp_name);
			js.newCompany(c2);
			c2 = js.selectCompanyByName(c2);	
			
			Job j = new Job();
			j.setJob_name(req.getParameter("job_name"));
			j.setJob_type(Integer.toString(jt.getId()));
			j.setJob_amount(req.getParameter("job_amount"));
			j.setJob_pay(req.getParameter("job_pay"));
			j.setJob_summary(req.getParameter("job_summary"));
			j.setJob_district(Integer.toString(d.getId()));
			j.setJob_contact(req.getParameter("job_contact"));
			j.setJob_phone(req.getParameter("job_phone"));
			j.setJob_compnay(Integer.toString(c2.getId()));
			j.setJob_user(Integer.toString(u.getId()));
			js.updateJob(jobid, j);
			
		} else{
			Job j = new Job();
			j.setJob_name(req.getParameter("job_name"));
			j.setJob_type(Integer.toString(jt.getId()));
			j.setJob_amount(req.getParameter("job_amount"));
			j.setJob_pay(req.getParameter("job_pay"));
			j.setJob_summary(req.getParameter("job_summary"));
			j.setJob_district(Integer.toString(d.getId()));
			j.setJob_contact(req.getParameter("job_contact"));
			j.setJob_phone(req.getParameter("job_phone"));
			j.setJob_compnay(Integer.toString(c.getId()));
			j.setJob_user(Integer.toString(u.getId()));
			js.updateJob(jobid, j);
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("success", "您已成功修改职位信息！");
		mv.addObject("info", "我的招聘，查看您发布的职位");
		mv.addObject("back", "user/myHire?userid=" + userid);
		mv.setViewName("/front/success");
		return mv;
	}
	
	//删除职位
	@RequestMapping("/jobDelete")
	public ModelAndView jobDelete(HttpServletRequest req,
			@RequestParam(value="jobid",required=true) Integer jobid,
			@RequestParam(value="userid",required=true) Integer userid) throws Exception{
		//返回ModelAndView
		ModelAndView mv = new ModelAndView();
		mv.addObject("confirm", "您确定要删除这条职位信息吗？");
		mv.addObject("go", "user/jobDeleteConfirm?jobid="+jobid+"&userid="+userid);
		//指定视图
		mv.setViewName("/front/confirm");
		return mv;
	}
	
	//删除职位
		@RequestMapping("/jobDeleteConfirm")
		public ModelAndView jobDeleteConfirm(HttpServletRequest req,
				@RequestParam(value="jobid",required=true) Integer jobid,
				@RequestParam(value="userid",required=true) Integer userid) throws Exception{
			ModelAndView mv = new ModelAndView();
			//调用service查询职位信息
			Job job = js.findJobById(jobid);
			//根据job的id删除
			js.deleteJob(job);
			mv.addObject("success", "职位已删除～");
			mv.addObject("back", "user/myHire?userid=" + userid);
			mv.setViewName("/front/success");
			return mv;
		}
	
	//我收到的简历
	@RequestMapping("/resumeQuery")
	public ModelAndView resumeQuery(HttpServletRequest req,
			@RequestParam(value="userid",required=true) Integer userid) throws Exception{
		ModelAndView mv = new ModelAndView();
		User user = us.findUserById(userid);
		List<ResumeCustom> resumeList = us.findResumeList(user);
		req.getSession().setAttribute("resumeList", resumeList);
		mv.setViewName("/front/resumeQuery");
		return mv;
	}
	
	//获取我的帮助
	@RequestMapping("/myHelp")
	public String myHelp() throws Exception{
		return "/front/myHelp";
	}
	
	
}
