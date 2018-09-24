package bean;

public class Province {


	private int id;
	
	private String province_name;
	
	private Region province_region;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProvince_name() {
		return province_name;
	}

	public void setProvince_name(String province_name) {
		this.province_name = province_name;
	}

	public Region getProvince_region() {
		return province_region;
	}

	public void setProvince_region(Region province_region) {
		this.province_region = province_region;
	}
	
	
}
