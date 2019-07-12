package vo;

import java.sql.Blob;
import java.util.List;

public class FestivalVO {
	private int fid;
	private String name;
	private float lat;
	private float lng;
	private String fcontent;
	private Blob mainimage;
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public float getLng() {
		return lng;
	}
	public void setLng(float lng) {
		this.lng = lng;
	}
	public String getFcontent() {
		return fcontent;
	}
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	@Override
	public String toString() {
		return "FestivalVO [fid=" + fid + ", name=" + name + ", lat=" + lat + ", lng=" + lng + ", fcontent=" + fcontent
				+ ", image=" + mainimage + "]";
	}
	public Blob getMainimage() {
		return mainimage;
	}
	public void setMainimage(Blob mainimage) {
		this.mainimage = mainimage;
	}

}
