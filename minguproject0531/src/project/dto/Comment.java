package project.dto;

public class Comment {
	private String comment;
	private String c_live;
	private String c_id;
	private String c_ct;
	private String c_good;
	private String c_sin;
	private String c_data;
	
	private String nick;		//조인으로 사용해서 데이터베이스에 없음

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getC_live() {
		return c_live;
	}

	public void setC_live(String c_live) {
		this.c_live = c_live;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getC_ct() {
		return c_ct;
	}

	public void setC_ct(String c_ct) {
		this.c_ct = c_ct;
	}

	public String getC_good() {
		return c_good;
	}

	public void setC_good(String c_good) {
		this.c_good = c_good;
	}

	public String getC_sin() {
		return c_sin;
	}

	public void setC_sin(String c_sin) {
		this.c_sin = c_sin;
	}

	public String getC_data() {
		return c_data;
	}

	public void setC_data(String c_data) {
		this.c_data = c_data;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}
	
	
	

}
