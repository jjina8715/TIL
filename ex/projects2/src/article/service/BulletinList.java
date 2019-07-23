package article.service;

import java.util.List;

import article.model.Bulletin;;

public class BulletinList {
	private int bulletinTotalCount;
	private List<Bulletin> bulletinList;
	
	public BulletinList(List<Bulletin> bulletinList ,int bulletinTotalCount){
		this.bulletinTotalCount = bulletinTotalCount;
		this.bulletinList = bulletinList;
	}
	
	public int getBulletinTotalCount() {
		return bulletinTotalCount;
	}

	public List<Bulletin> getBulletinList() {
		return bulletinList;
	}
	
	
	public boolean isEmpty() {
		return bulletinTotalCount == 0;
	}
}
