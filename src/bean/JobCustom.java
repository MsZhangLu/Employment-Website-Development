package bean;

/*
 * 职位信息的扩展类 
 * 通过此类能够映射职位、公司、区域关联查询的结果，选择继承关联字段较多的类。
 */
public class JobCustom extends Job{

	private String job_type_name;
	
	public String getDistrict_city() {
		return district_city;
	}

	public void setDistrict_city(String district_city) {
		this.district_city = district_city;
	}

	public String getCity_province() {
		return city_province;
	}

	public void setCity_province(String city_province) {
		this.city_province = city_province;
	}

	public String getProvince_name() {
		return province_name;
	}

	public void setProvince_name(String province_name) {
		this.province_name = province_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	private String job_cat_name;
	
	private String district_name;
	
	private String district_city;
	
	private String city_name;
	
	private String city_province;
	
	private String province_name;
	
	private String cp_name;
	
	private String user_name;

	public String getJob_type_name() {
		return job_type_name;
	}

	public void setJob_type_name(String job_type_name) {
		this.job_type_name = job_type_name;
	}

	public String getJob_cat_name() {
		return job_cat_name;
	}

	public void setJob_cat_name(String job_cat_name) {
		this.job_cat_name = job_cat_name;
	}

	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	public String getCp_name() {
		return cp_name;
	}

	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}

	public String getDistrict_name() {
		return district_name;
	}

	public void setDistrict_name(String district_name) {
		this.district_name = district_name;
	}
	
	
	
	
}
