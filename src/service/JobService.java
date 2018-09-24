package service;

import java.util.List;

import bean.City;
import bean.Company;
import bean.District;
import bean.Job;
import bean.JobCustom;
import bean.JobCustom2;
import bean.JobCustom3;
import bean.JobQueryVo;
import bean.Job_cat;
import bean.Job_type;
import bean.Resume;
import bean.User;

public interface JobService {

	public Job getJobInfo(Job job);
	
	//职位查询列表
	public List<JobCustom> findJobList(JobQueryVo jobQueryVo) throws Exception;
	
	//按名字，职位列表查询
	public List<JobCustom> findJobListByName(JobCustom3 jobCustom3) throws Exception;
	
	//查询职位详细信息
	public JobCustom3 findJobDetails(JobCustom3 jobCustom3) throws Exception;
	
	//查询职位详细信息列表
	public List<JobCustom3> findJobDetailsList() throws Exception;
	
	//查询职位，关联查询公司、区域
	public List<JobCustom> findJobCpDis() throws Exception;
	
	//查询“我”发布的职位信息，关联职位小类、区域、公司、用户
	public List<JobCustom2> findMyHire(User user) throws Exception;
	
	//职位类别列表查询
	public List<Job_type> findJobTypeList(Job_cat job_cat) throws Exception;
	
	//根据id查询职位信息
	public JobCustom3 findJobById(Integer id) throws Exception;
	
	//修改职位信息
	public void updateJob(Integer id, Job job) throws Exception;
	
	//删除职位
	public void deleteJob(Job job) throws Exception;
	
	//发布职位
	public void newJob(Job job) throws Exception;
	
	//查找职位类别
	public Job_type selectJob_typeByName(Job_type job_type) throws Exception;

	//查找区
	public District selectDistrictByName(District district) throws Exception;
	
	//查找市
	public City selectCityByName(City city) throws Exception;
	
	//查找公司
	public Company selectCompanyByName(Company company) throws Exception;
		
	//新建公司
	public void newCompany(Company company) throws Exception;
	
	//创建简历
	public void newResume(Resume resume) throws Exception;
	
}
