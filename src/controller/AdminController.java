package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Admin;
import bean.Job;
import bean.JobCustom;
import bean.JobCustom3;
import bean.User;
import service.JobService;
import service.UserService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
//	@Autowired
//	public AdminService as;
	
	@Autowired
	public UserService us;
	
	@Autowired
	public JobService js;
	

	//显示管理愿登录页
	@RequestMapping("/adminLogin")
	public ModelAndView amdinLogin() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("admin", new Admin());
		mv.setViewName("/back/adminLogin");
		
//		Admin a = as.selectByPrimaryKey(1);
		System.out.println("顺利吗" + us.findUserById(1));
//		System.out.println(a.getAdmin_name()+" AND "+a.getAdmin_password());
		
		return mv;
	}
	
	//管理员登录，验证
	@RequestMapping("/adminLoginSubmit")
	public ModelAndView adminLoginSubmit(HttpServletRequest req) throws Exception{
		ModelAndView mv = new ModelAndView();

		List<User> userList = us.findAllUser();
		req.getSession().setAttribute("userSum", userList.size());
		List<JobCustom3> jobList = js.findJobDetailsList();
		req.getSession().setAttribute("jobSum", jobList.size());
		
		
		Admin admin = new Admin();
		admin.setAdmin_name(req.getParameter("admin_name"));
		admin.setAdmin_password(req.getParameter("admin_password"));
		
		String admin_name = req.getParameter("admin_name");
		System.out.println("admin_name是" + admin_name);
		admin = us.selectByNameAdmin(admin);
		
		if(admin!=null){
			req.getSession().setAttribute("admin", admin);
			mv.setViewName("/back/adminDashBoard");
		} else{
			mv.addObject("error", "用户名或密码输入错误，无法登陆，请重新输入");
			mv.addObject("back", "/back/adminLogin");
			mv.setViewName("/back/fail");
		}
		return mv;
	}
	
	//退出登录
	@RequestMapping("/adminLogout")
	public ModelAndView userLogout(HttpServletRequest req) throws Exception{
		req.getSession().setAttribute("admin", null);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/back/adminLogin");
		return mv;
	}
	
	//后台主页
	@RequestMapping("/adminDashBoard")
	public ModelAndView adminDashBoard(HttpServletRequest req) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<User> userList = us.findAllUser();
		req.getSession().setAttribute("userSum", userList.size());
		List<JobCustom3> jobList = js.findJobDetailsList();
		req.getSession().setAttribute("jobSum", jobList.size());
		
		mv.setViewName("/back/adminDashBoard");
		return mv;
	}
	
	//用户管理
	@RequestMapping("/adminUser")
	public ModelAndView adminUser(HttpServletRequest req) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<User> userList = us.findAllUser();
		req.getSession().setAttribute("userList", userList);
		
		mv.setViewName("/back/adminUser");
		return mv;
	}
	
	//删除职位
	@RequestMapping("/userDelete")
	public ModelAndView userDelete(HttpServletRequest req,
			@RequestParam(value="userid",required=true) Integer userid) throws Exception{
		ModelAndView mv = new ModelAndView();
		//调用service查询职位信息
		User u = us.findUserById(userid);
		//根据user的id删除
		us.deleteUser(u);
		mv.addObject("success", "用户已删除～");
		mv.addObject("back", "admin/adminUser");
		mv.setViewName("/back/success");
		return mv;
	}
	
	//职位管理
	@RequestMapping("/adminJob")
	public ModelAndView adminJob(HttpServletRequest req) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<JobCustom3> jobList = js.findJobDetailsList();
		req.getSession().setAttribute("jobList", jobList);
		
		mv.setViewName("/back/adminJob");
		return mv;
	}
	
	//删除职位
	@RequestMapping("/jobDelete")
	public ModelAndView jobDelete(HttpServletRequest req,
			@RequestParam(value="jobid",required=true) Integer jobid) throws Exception{
		ModelAndView mv = new ModelAndView();
		//调用service查询职位信息
		Job job = js.findJobById(jobid);
		//根据job的id删除
		js.deleteJob(job);
		mv.addObject("success", "职位已删除～");
		mv.addObject("back", "admin/adminJob");
		mv.setViewName("/back/success");
		return mv;
	}
	
	//条件查询
	@RequestMapping("/jobQueryByDetail")
	public ModelAndView jobQueryByDetail(HttpServletRequest req) throws Exception{
		
		ModelAndView mv= new ModelAndView();
		
		String job_name = req.getParameter("job_name");
		String job_type_name = req.getParameter("job_type_name");
		
		JobCustom3 j3 = new JobCustom3();
		j3.setJob_name(job_name);
		j3.setJob_type_name(job_type_name);
		
		List<JobCustom> jobList = js.findJobListByName(j3);
		
		if(jobList.size()==0){
			mv.addObject("error", "抱歉，暂无相关职位。。。");
			mv.addObject("back", "admin/adminJob");
			mv.addObject("info", "查看其他职位");
			mv.setViewName("/back/fail");
		} else{
			mv.addObject("jobList", jobList);
			req.getSession().setAttribute("job_type_name", req.getParameter("job_type_name"));
			//指定视图
			mv.setViewName("/back/adminJob");
		}
		return mv;
	}
	
	
}
