package bean;

/*
 * 商品包装对象 
 */
public class JobQueryVo {
		
	//职位信息
	private Job job;
	
	//为了系统的可扩展性，对原始po进行扩展
	private JobCustom jobCustom;
	
	
	private String city_name;
	 
	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public JobCustom getJobCustom() {
		return jobCustom;
	}

	public void setJobCustom(JobCustom jobCustom) {
		this.jobCustom = jobCustom;
	}
	 
	

}
