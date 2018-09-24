package bean;

public class UserCustom extends User{

	//新密码
	private String user_password_new;
	
	//确认密码
	
	private String user_password2;

	public String getUser_password_new() {
		return user_password_new;
	}

	public void setUser_password_new(String user_password_new) {
		this.user_password_new = user_password_new;
	}

	public String getUser_password2() {
		return user_password2;
	}

	public void setUser_password2(String user_password2) {
		this.user_password2 = user_password2;
	}
	
}
