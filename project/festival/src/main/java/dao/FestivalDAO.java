package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.FestivalVO;
import vo.SearchInfoVO;

@Repository
public class FestivalDAO {
	@Autowired
	SqlSession session = null;
	
	public List<FestivalVO> search(SearchInfoVO info){
		List<FestivalVO> list;
		String statement = "resource.FestivalMapper.selectFestival";
		list = session.selectList(statement, info);
		return list;
	}
	public int selectCount(SearchInfoVO info) {
		String statement = "resource.FestivalMapper.selectFestivalCount";
		return session.selectOne(statement, info);
	}
}
