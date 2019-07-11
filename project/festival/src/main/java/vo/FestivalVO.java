package vo;

public class FestivalVO {
	private int fid;
	private String name;
	private String place;
	private float lat;
	private float lng;
	private String type;
	private String fcontent;
	private String hostinfo;
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
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFcontent() {
		return fcontent;
	}
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	public String getHostinfo() {
		return hostinfo;
	}
	public void setHostinfo(String hostinfo) {
		this.hostinfo = hostinfo;
	}
	@Override
	public String toString() {
		return "FestivalVO [fid=" + fid + ", name=" + name + ", place=" + place + ", lat=" + lat + ", lng=" + lng
				+ ", type=" + type + ", fcontent=" + fcontent + ", hostinfo=" + hostinfo + "]";
	}
}
