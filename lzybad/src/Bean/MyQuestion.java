package Bean;

import java.util.Date;

public class MyQuestion {
	private int qid;
	private int uid;
	private String qtitle;
	private String qco;
	private Date qtime;
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQco() {
		return qco;
	}
	public void setQco(String qco) {
		this.qco = qco;
	}
	public Date getQtime() {
		return qtime;
	}
	public void setQtime(Date qtime) {
		this.qtime = qtime;
	}
	
}
