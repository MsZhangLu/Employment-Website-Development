package bean;

public class Job_type {
	
	private int id;
	
	private String job_type_name;
	
	private Job_cat job_type_cat;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getJob_type_name() {
		return job_type_name;
	}

	public void setJob_type_name(String job_type_name) {
		this.job_type_name = job_type_name;
	}

	public Job_cat getJob_type_cat() {
		return job_type_cat;
	}

	public void setJob_type_cat(Job_cat job_type_cat) {
		this.job_type_cat = job_type_cat;
	}
	
	

}
