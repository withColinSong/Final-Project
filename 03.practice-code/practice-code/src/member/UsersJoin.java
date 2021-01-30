package member;

public class UsersJoin {
	private String mid;
	private String pw;
	private String email;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "UsersJoin [mid=" + mid + ", pw=" + pw + ", email=" + email + "]";
	}
}
