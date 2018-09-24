package mapper;

import java.util.List;

import bean.City;
import bean.Company;
import bean.District;
import bean.Job;
import bean.Job_cat;
import bean.Job_type;

//import java.util.List;


public interface JobMapper {
	
	public Job getJobInfo(Job job);
	
	public Job selectByPrimaryKey(int id);
	
	public void updateByPrimaryKey(Job job);
	
	//
	public void deleteByPrimaryKey(Job job);
	
	//查找职位类别
	public Job_type selectJob_typeByName(Job_type job_type);
	
	//查找区
	public District selectDistrictByName(District district);
	
	//查找市
	public City selectCityByName(City city);
	
	//查找公司
	public Company selectCompanyByName(Company company);
	
	//职位类别列表查询
	public List<Job_type> findJobTypeList(Job_cat job_cat);
	
	//新建公司
	public void newCompany(Company company);
	
	//发布职位
	public void newJob(Job job);

}
