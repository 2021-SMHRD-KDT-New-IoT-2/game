package model;

public class MemberVO {
	
	private String user_no;
	private String user_id;
	private String user_pw;
	
	public MemberVO (String user_no, String user_id, String user_pw) {
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		
	}

	public String getUser_no() {
		return user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}
	

	

}
