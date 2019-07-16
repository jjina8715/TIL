package article.service;

import java.util.Map;

public class ModifyRequest {
	
	private String userId;
	private int articleId;
	private String title;
	private String content;
	
	public ModifyRequest(String userId, int no, String title, String content) {
		this.userId = userId;
		this.articleId = no;
		this.title = title;
		this.content = content;
	}

	public void validate(Map<String, Boolean> errors) {
		if (title == null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}

	public int getArticleId() {
		return articleId;
	}

	public String getUserId() {
		return userId;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

}
