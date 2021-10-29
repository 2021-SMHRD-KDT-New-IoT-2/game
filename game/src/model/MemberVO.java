package model;

public class MemberVO {
	
	private int user_no;
	private String user_id;
	private String user_pw;
	
	public MemberVO (int user_no, String user_id, String user_pw) {
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		
	}
	
	public int getEmail() {
		return user_no;
	}
	public String getTel() {
		return user_id;
	}
	public String getAdd() {
		return user_pw;
	}
	

}
