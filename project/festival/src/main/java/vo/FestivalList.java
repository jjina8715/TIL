package vo;

import java.util.List;

public class FestivalList {
	private int total;
	private int currentPage;
	private List<FestivalVO> list;
	private int totalPages;
	private int startPage;
	private int endPage;
	public FestivalList(int total, int currentPage, int size, List<FestivalVO> list) {
		this.total = total;
		this.currentPage = currentPage;
		this.list = list;
		if(total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		}else {
			totalPages = total/size;
			if(total%size>0) {
				totalPages++;
			}
			int modVal = currentPage%5; 
			startPage = currentPage/5*5+1;
			if(modVal==0) startPage-=5;
			endPage = startPage + 4;
			if(endPage > totalPages) endPage = totalPages;
		}
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public List<FestivalVO> getList() {
		return list;
	}
	public void setList(List<FestivalVO> list) {
		this.list = list;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean hasNoFestivals() {
		return total == 0;
	}

	public boolean hasFestivals() {
		return total > 0;
	}
	@Override
	public String toString() {
		return "FestivalList [total=" + total + ", currentPage=" + currentPage + ", list=" + list + ", totalPages="
				+ totalPages + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
}
