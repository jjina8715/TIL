package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.NewsVO;
import vo.SearchVO;

@Repository
public class NewsDAO {
	@Autowired
	SqlSession session = null;
	
	public boolean insert(NewsVO vo) {//insertNews
		boolean result=true;
		String statement = "resource.NewsMapper.insertNews";
		if(session.insert(statement, vo)!=1)
			result=false;
		return result;
	}
	
	public boolean update(NewsVO vo) {//updateNews
		boolean result = true;
		String statement = "resource.NewsMapper.updateNews";
		if(session.update(statement, vo)!=1)
			result=false;
		return result;
	}
	
	public boolean delete(int id) {//deleteNews
		boolean result = true;
		String statement = "resource.NewsMapper.deleteNews";
		if(session.delete(statement, id)!=1)
			result = false;
		return result;
	}
	
	public List<NewsVO> listAll(){//selectNews
		List<NewsVO> list = new ArrayList<>();
		String statement = "resource.NewsMapper.selectNews";
		list = session.selectList(statement);
		return list;
	}
	public List<NewsVO> listWriter(SearchVO vo){//searchNews
		List<NewsVO> list=new ArrayList<NewsVO>();
		String statement = "resource.NewsMapper.searchWriter";
		list = session.selectList(statement, vo);
		return list;
	}
	public NewsVO listOne(int id) {//updateNewsCnt selectNewsOne
		NewsVO vo = null;
		String statement = "resource.NewsMapper.updateNewsCnt";
		session.update(statement, id);
		statement = "resource.NewsMapper.selectNewsOne";
		vo = session.selectOne(statement, id);
		return vo;
	}
	public List<NewsVO> search(SearchVO vo){//searchNews
		List<NewsVO> list=new ArrayList<NewsVO>();
		String statement = "resource.NewsMapper.searchNews";
		list = session.selectList(statement, vo);
		return list;
	}
}