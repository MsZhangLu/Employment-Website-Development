package service.impl;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
import mapper.JobMapper;
import mapper.JobMapperCustom;
import service.JobService;

@Service
@Transactional
public class JobServiceImpl implements JobService{

	@Autowired(required=false)
	public JobMapperCustom jobMapperCustom;
	
	@Autowired(required=false)
	public JobMapper jobMapper;
	
	@Override
	public Job getJobInfo(Job job) {
		System.out.println("jobserviceIMPL is called");
		return this.jobMapper.getJobInfo(job);
	}

	@Override
	public List<JobCustom> findJobList(JobQueryVo jobQueryVo) throws Exception {
		//通过JobMapperCustom查询数据库
		return jobMapperCustom.findJobList(jobQueryVo);
	}

	//查询职位详情
	@Override
	public JobCustom3 findJobDetails(JobCustom3 jobCustom3) throws Exception {
		return jobMapperCustom.findJobDetails(jobCustom3);
	} 

	
	@Override
	public List<JobCustom> findJobCpDis() throws Exception {
		//通过JobMapperCustom查询数据库
		return jobMapperCustom.findJobCpDis();
	}

	@Override
	public List<JobCustom2> findMyHire(User user) throws Exception {
		//通过JobMapperCustom查询数据库
		return jobMapperCustom.findMyHire(user);
	}

	//根据id查找工作
	@Override
	public JobCustom3 findJobById(Integer  id) throws Exception {
		Job job = jobMapper.selectByPrimaryKey(id); 
		//中间进行业务处理
		// ...
		//返回 JobCustom2 
		JobCustom3 jobCustom3 = new JobCustom3();
		//将job中的属性值内容拷贝到jobCustom2
		BeanUtils.copyProperties(job, jobCustom3); 
		return jobCustom3;
	}

	//修改职位信息
	@Override
	public void updateJob(Integer id, Job job) throws Exception {
		//添加业务校验，通常在service接口对关键参数进行校验 
		//校验id是否为空，如果为空 抛出异常
		job.setId(id);
		//更新商品信息，根据id更新所有信息,所以必须传入ID
		jobMapper.updateByPrimaryKey(job);
		
	}
	
	//删除职位
	@Override
	public void deleteJob(Job job) throws Exception {
		jobMapper.deleteByPrimaryKey(job);
	}

	//发布职位
	@Override
	public void newJob(Job job) throws Exception {
//		jobMapperCustom.newJob(job);
		jobMapper.newJob(job);
	}

	//查找职位类别
	@Override
	public Job_type selectJob_typeByName(Job_type job_type) throws Exception {
		Job_type jt = jobMapper.selectJob_typeByName(job_type);
		return jt;
	}

	//查找区
	@Override
	public District selectDistrictByName(District district) throws Exception {
		District d = jobMapper.selectDistrictByName(district);
		return d;
	}
	
	//查找市
	@Override
	public City selectCityByName(City city) throws Exception {
		City c = jobMapper.selectCityByName(city);
		return c;
	}

	//查找公司
	@Override
	public Company selectCompanyByName(Company company) throws Exception {
		Company c = jobMapper.selectCompanyByName(company);
		return c;
	}

	//新建公司
	@Override
	public void newCompany(Company company) throws Exception {
		jobMapper.newCompany(company);
	}

	//职位列表查询
	@Override
	public List<Job_type> findJobTypeList(Job_cat job_cat) throws Exception {
		return jobMapper.findJobTypeList(job_cat);
	}

	//创建简历
	@Override
	public void newResume(Resume resume) throws Exception {
		jobMapperCustom.newResume(resume);
	}

	//按名字，职位列表查询
	@Override
	public List<JobCustom> findJobListByName(JobCustom3 jobCustom3) throws Exception {
		return jobMapperCustom.findJobListByName(jobCustom3);
	}

	//查询职位详细信息列表
	@Override
	public List<JobCustom3> findJobDetailsList() throws Exception {
		return jobMapperCustom.findJobDetailsList();
	}

	

}
