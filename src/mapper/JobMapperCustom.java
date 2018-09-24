package mapper;

import java.util.List;

import bean.Job;
import bean.JobCustom;
import bean.JobCustom2;
import bean.JobCustom3;
import bean.JobQueryVo;
import bean.Resume;
import bean.User;

public interface JobMapperCustom {
 
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
	
	//发布职位
	public void newJob(Job job) throws Exception;
	
	//根据id查询职位信息
	public JobCustom3 findJobById(Integer id) throws Exception;
	
	//创建简历
	public void newResume(Resume resume) throws Exception;
	
}
