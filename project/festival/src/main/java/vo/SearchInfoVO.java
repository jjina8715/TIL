package vo;

public class SearchInfoVO {
	private String district;
	private String month;
	private String type;
	private int startRow;
	private int size;
	private String action;
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
		return "SearchInfoVO [district=" + district + ", month=" + month + ", type=" + type + ", startRow=" + startRow
				+ ", size=" + size + ", action=" + action + "]";
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}	
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
}
