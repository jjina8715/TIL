package article.model;

import java.util.Date;

public class Article {
	private int bulId;
	private Integer articleId;
	private String writerId;
	private String title;
	private String content;
	private Date postingDate;
	private int readCount;
	
	public Article(int bulId, Integer articleId, String writerId, String title, String content, Date postingDate, int readCount) {
		this.bulId = bulId;
		this.articleId = articleId;
		this.writerId = writerId;
		this.title = title;
		this.content = content;
		this.postingDate = postingDate;
		this.readCount = readCount;
	}

	public int getBulId() {
		return bulId;
	}

	public Integer getArticleId() {
		return articleId;
	}

	public String getWriterId() {
		return writerId;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}
	
	public Date getPostingDate() {
		return postingDate;
	}

	public int getReadCount() {
		return readCount;
	}

}
