package vo;

public class SearchVO {
	private String key;
	private String searchType;
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	@Override
	public String toString() {
		return "SearchVO [key=" + key + ", searchType=" + searchType + "]";
	}
}
