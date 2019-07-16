package article.service;

import java.util.Map;

public class WriteRequest {
	
	private String writerId;
	private int bul_id;
	private String title;
	private String content;
	
	public WriteRequest(String writerId, int bulId, String title, String content) {
		this.writerId = writerId;
		this.bul_id = bulId;
		this.title = title;
		this.content = content;
	}

	public void validate(Map<String, Boolean> errors) {
		if (title == null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}

	public String getWriterId() {
		return writerId;
	}

	public int getBul_id() {
		return bul_id;
	}

	public String getTitle() {
		return title;
	}
	
	public String getContent() {
		return content;
	}

}
