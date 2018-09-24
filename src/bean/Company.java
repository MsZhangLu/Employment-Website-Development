package bean;

public class Company {

	private int id;
	
	private String cp_name;
	
	private String cp_summary;
	
	private City cp_city;
	
	private District cp_district;
	
	private String cp_address;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCp_name() {
		return cp_name;
	}

	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}

	public String getCp_summary() {
		return cp_summary;
	}

	public void setCp_summary(String cp_summary) {
		this.cp_summary = cp_summary;
	}

	public City getCp_city() {
		return cp_city;
	}

	public void setCp_city(City cp_city) {
		this.cp_city = cp_city;
	}

	public District getCp_district() {
		return cp_district;
	}

	public void setCp_district(District cp_district) {
		this.cp_district = cp_district;
	}

	public String getCp_address() {
		return cp_address;
	}

	public void setCp_address(String cp_address) {
		this.cp_address = cp_address;
	}
	
	
	
}
