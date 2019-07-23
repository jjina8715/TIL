package article.model;

public class Bulletin {
	private int bul_id;
	private String title;
	
	public Bulletin(int bul_id, String title) {
		this.bul_id = bul_id;
		this.title = title;
	}
	
	public int getBul_id() {
		return bul_id;
	}

	public String getTitle() {
		return title;
	}
}
