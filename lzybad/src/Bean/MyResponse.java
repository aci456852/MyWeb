package Bean;

import java.util.Date;

public class MyResponse {
	private int qid;
	private int uid;
	private int rid;
	private String rco;
	private Date rtime;
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
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRco() {
		return rco;
	}
	public void setRco(String rco) {
		this.rco = rco;
	}
	public Date getRtime() {
		return rtime;
	}
	public void setRtime(Date rtime) {
		this.rtime = rtime;
	}
	
}
