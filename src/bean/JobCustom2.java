package bean;

/*
 * 职位信息的扩展类－2
 * 通过此类能够映射职位小类、区域、公司、用户关联查询的结果，选择继承关联字段较多的类。
 */

public class JobCustom2 extends Job{

	//添加职位信息的扩展属性
	//小类名称
	private String job_type_name;
	
	//区域名称
	private String district_name;
	
	//公司名称
	private String cp_name;
	
	//发布用户
	private String user_name;

	public String getJob_type_name() {
		return job_type_name;
	}

	public void setJob_cat_name(String job_type_name) {
		this.job_type_name = job_type_name;
	}

	public String getDistrict_name() {
		return district_name;
	}

	public void setDistrict_name(String district_name) {
		this.district_name = district_name;
	}

	public String getCp_name() {
		return cp_name;
	}

	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	
	
	
}
