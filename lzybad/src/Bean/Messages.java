package Bean;

import java.util.Date;

public class Messages {
	private int uid;
	private int mid;
	private String mco;
	private Date mtime;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getMco() {
		return mco;
	}
	public void setMco(String mco) {
		this.mco = mco;
	}
	public String getMtime() {
		String time=mtime.toString();
		String t=time.substring(0,10);
		return t;
	}
	public void setMtime(Date mtime) {
		this.mtime = mtime;
	}
	
}
