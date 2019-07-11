package vo;

public class SearchTypeVO {
	private String district;
	private String month;
	private String type;
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "SearchType [district=" + district + ", month=" + month + ", type=" + type + "]";
	}	
}
