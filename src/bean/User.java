package bean;

public class User {

	private int id;
	
	private String user_name;
	
	private String user_password;

	private String user_mobile;

	private String user_email;

	public User() {
		super();
	}

	
	
	public User(String user_name, String user_password) {
		super();
		this.user_name = user_name;
		this.user_password = user_password;
	}



	public User(int id, String user_name, String user_password, String user_mobile, String user_email) {
		super();
		this.id = id;
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_mobile = user_mobile;
		this.user_email = user_email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_mobile() {
		return user_mobile;
	}

	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

}
