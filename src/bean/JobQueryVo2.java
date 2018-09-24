package bean;

/*
 * 商品包装对象 
 */
public class JobQueryVo2 {
		
	//职位信息
	private Job job;
	
	//为了系统的可扩展性，对原始po进行扩展
	private JobCustom3 jobCustom3;

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public JobCustom3 getJobCustom() {
		return jobCustom3;
	}

	public void setJobCustom(JobCustom3 jobCustom3) {
		this.jobCustom3 = jobCustom3;
	}
	 
	

}
