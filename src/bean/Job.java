package bean;

public class Job {

//	@Override
//	public String toString(){
//		return "Job [id=" + id + ", name = " + job_name 
//				+", " + "company = " + job_company 
//				+ ", district = " + job_district +" ]";
//	}
	
	private int id;

	private String job_name;
	
//	private Job_type job_type;
	
	private String job_type;
	
	private String job_amount;
	
	private String job_pay;
	
	private String job_summary;
	
//	private District job_district;
	
	private String job_district;
	
	private String job_contact;
	
	private String job_phone;
	
//	private Company job_company;
	
	private String job_company;
	
	private String job_user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getJob_name() {
		return job_name;
	}

	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}

	public String getJob_type() {
		return job_type;
	}

	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}

	public String getJob_amount() {
		return job_amount;
	}

	public void setJob_amount(String job_amount) {
		this.job_amount = job_amount;
	}

	public String getJob_pay() {
		return job_pay;
	}

	public void setJob_pay(String job_pay) {
		this.job_pay = job_pay;
	}

	public String getJob_summary() {
		return job_summary;
	}

	public void setJob_summary(String job_summary) {
		this.job_summary = job_summary;
	}

	public String getJob_district() {
		return job_district;
	}

	public void setJob_district(String job_district) {
		this.job_district = job_district;
	}

	public String getJob_contact() {
		return job_contact;
	}

	public void setJob_contact(String job_contact) {
		this.job_contact = job_contact;
	}

	public String getJob_phone() {
		return job_phone;
	}

	public void setJob_phone(String job_phone) {
		this.job_phone = job_phone;
	}

	public String getJob_compnay() {
		return job_company;
	}

	public void setJob_compnay(String job_company) {
		this.job_company = job_company;
	}

	public String getJob_user() {
		return job_user;
	}

	public void setJob_user(String job_user) {
		this.job_user = job_user;
	}


	

	
}
