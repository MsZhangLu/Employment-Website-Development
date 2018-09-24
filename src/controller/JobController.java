package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Company;
import bean.District;
import bean.Job;
import bean.JobCustom;
import bean.JobCustom3;
import bean.JobQueryVo;
import bean.Job_type;
import bean.Resume;
import bean.User;
import service.JobService;
import service.UserService;

@Controller
@RequestMapping("/job")
public class JobController {

	@Autowired
	public JobService js;
	
	@Autowired
	public UserService us;
	
	static int count = 0;
	
	@RequestMapping("/welcome")
	public ModelAndView welcome(HttpServletRequest req) throws Exception{
		ModelAndView mv = new ModelAndView();
		//首次加载此页面时，给地区赋值
		if(count == 0){
			req.getSession().setAttribute("city_selected", "南京");
			count++;
		} 
		mv.setViewName("/front/welcome");
		return mv;
	}
	
	//类型表,暂时作为首页
	@RequestMapping("/jobType")
	public ModelAndView jobType(HttpServletRequest req) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/front/jobType");
		return mv;
	}
	
	//职位查询
	@RequestMapping("/jobQuery")
	public ModelAndView jobQuery(HttpServletRequest req,
			@RequestParam(value="job_type_name",required=true) String job_type_name,
			@RequestParam(value="city_name",required=true) String city_name) throws Exception{
		
//		City city = new City();
//		city.setCity_name(city_name);
//		city = js.selectCityByName(city);
//		
		
		Job_type jt = new Job_type();
		jt.setJob_type_name(job_type_name);
		jt = js.selectJob_typeByName(jt);
		
		Job j = new Job();
		j.setJob_type(Integer.toString(jt.getId()));
		
		JobQueryVo jqv = new JobQueryVo();
		jqv.setJob(j);
		jqv.setCity_name(city_name);
		
		//调用Service查找数据库，查询职位列表
		List<JobCustom> jobList = js.findJobList(jqv);
		
		//返回ModelAndView
		ModelAndView mv= new ModelAndView();
		
		if(jobList.size()==0){
			mv.addObject("error", "抱歉，目前该城市该类别暂无发布职位。。。");
			mv.addObject("back", "job/jobType");
			mv.addObject("info", "查看其他职位");
			mv.setViewName("/front/fail");
		} else{
			mv.addObject("jobList", jobList);
			mv.addObject("job_type_name", job_type_name);
			req.getSession().setAttribute("job_type_name", job_type_name);
			
			req.getSession().setAttribute("job", j);
			//指定视图
			mv.setViewName("/front/jobQuery");
		}
		return mv;
		
	}
	
	//职位查询2,显示所有查询结果
	@RequestMapping("/jobQueryByJobName")
	public ModelAndView jobQueryByJobName(HttpServletRequest req,
			@RequestParam(value="city_name",required=true) String city_name) throws Exception{
		ModelAndView mv= new ModelAndView();
		JobCustom3 j3 = new JobCustom3();
		j3.setJob_name(req.getParameter("job_name"));
		j3.setJob_type_name(req.getParameter("job_type_name"));
		j3.setCity_name(city_name);
		List<JobCustom> jobList = js.findJobListByName(j3);
		
		if(jobList.size()==0){
			mv.addObject("error", "抱歉，暂无相关职位。。。");
			mv.addObject("back", "job/jobType");
			mv.addObject("info", "查看其他职位");
			mv.setViewName("/front/fail");
		} else{
			mv.addObject("jobList", jobList);
			//指定视图
			mv.setViewName("/front/jobQueryByJobName");
		}
		return mv;
		
	}
	
	//职位查询3，多条件查询
	@RequestMapping("/jobQueryByDetail")
	public ModelAndView jobQueryByDetail(HttpServletRequest req,
			@RequestParam(value="city_name",required=true) String city_name) throws Exception{
		ModelAndView mv= new ModelAndView();
		JobCustom3 j3 = new JobCustom3();
		j3.setJob_name(req.getParameter("job_name"));
		j3.setJob_type_name(req.getParameter("job_type_name"));
		j3.setCity_name(city_name);
		
		List<JobCustom> jobList = js.findJobListByName(j3);
		
		if(jobList.size()==0){
			mv.addObject("error", "抱歉，暂无相关职位。。。");
			mv.addObject("back", "job/jobType");
			mv.addObject("info", "查看其他职位");
			mv.setViewName("/front/fail");
		} else{
			mv.addObject("jobList", jobList);
			req.getSession().setAttribute("job_type_name", req.getParameter("job_type_name"));
			//指定视图
			mv.setViewName("/front/jobQuery");
		}
		return mv;
	}	
	
	
	//职位详情
	@RequestMapping("/jobDetail")
	public ModelAndView jobDetail(HttpServletRequest req,@RequestParam(value="jobid",required=true) Integer jobid) throws Exception{
		System.out.println("jobid是"+jobid);
		//调用service，根据jobid查找job 信息包装成JobCustom3对象返回页面
		JobCustom3 j = new JobCustom3();
		j.setId(jobid);
		
		JobCustom3 jobCustom3 = new JobCustom3();
		jobCustom3 = js.findJobDetails(j);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("jobCustom3", jobCustom3);
		
		mv.setViewName("/front/jobDetail");
		return mv;
	}
	
	//职位申请提交
	@RequestMapping("/jobApplySubmit")
	public ModelAndView jobApplySubmit(HttpServletRequest req,
			@RequestParam(value="userid",required=true) Integer userid,
			@RequestParam(value="jobid",required=true) Integer jobid) throws Exception{
		//创建简历对象
		Resume resume = new Resume();
		resume.setResume_name(req.getParameter("resume_name"));
		resume.setResume_sex(req.getParameter("resume_sex"));
		resume.setResume_age(req.getParameter("resume_age"));
		resume.setResume_experience(req.getParameter("resume_experience"));
		resume.setResume_mobile(req.getParameter("resume_mobile"));
		resume.setResume_summary(req.getParameter("resume_summary"));
		resume.setResume_user(Integer.toString(userid));
		resume.setResume_job(Integer.toString(3));
		
		js.newResume(resume);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("success", "职位申请成功，请等候招聘方联系！");
		mv.addObject("info", "查看其他工作");
		mv.addObject("back", "job/jobType");
		mv.setViewName("/front/success");
		return mv;
	}

	//发布职位页面
	@RequestMapping("/jobAdd")
	public String jobAdd() throws Exception{
		return "/front/jobAdd";
	}
	
	//发布职位提交
	@RequestMapping("/jobAddSubmit")
	public ModelAndView jobAddSubmit(HttpServletRequest req, @RequestParam(value="userid",required=true) Integer userid) throws Exception{
		
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
			js.newJob(j);
			
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
			js.newJob(j);
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("success", "您已成功发布新职位！");
		mv.addObject("info", "我的招聘，查看您发布的职位");
		mv.addObject("back", "user/myHire?userid=" + userid);
		mv.setViewName("/front/success");
		return mv;
	}
	
	

	
	//切换城市页面
	@RequestMapping("/cityChange")
	public ModelAndView cityChange() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/front/cityChange");
		return mv;
	}
	
	//切换城市提交
	@RequestMapping("/cityChangeSubmit")
	public ModelAndView cityChangeSubmit(HttpServletRequest req, @RequestParam(value="city_name",required=true) String city_name) throws Exception{
		ModelAndView mv = new ModelAndView();
		req.getSession().setAttribute("city_selected", city_name);
		mv.setViewName("/front/jobType");
		return mv;
	}
	
}
