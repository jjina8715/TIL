package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.FestivalVO;
import vo.LatlngVO;
import vo.SearchFestaInfoVO;

@Repository
public class FestivalDAO {
	@Autowired
	SqlSession session = null;
	
	public List<FestivalVO> search(SearchFestaInfoVO info){
		List<FestivalVO> list;
		String statement = "resource.FestivalMapper.selectFestival";
		list = session.selectList(statement, info);
		return list;
	}
	public int selectCount(SearchFestaInfoVO info) {
		String statement = "resource.FestivalMapper.selectFestivalCount";
		return session.selectOne(statement, info);
	}
	//위도 경도
	public List<LatlngVO> selectPlace(){
		List<LatlngVO> list;
		String statement = "resource.NoticeMapper.searchPlace";
		list = session.selectList(statement);
		return list;
	}
	public int updateLatlng(LatlngVO info) {
		String statement = "resource.NoticeMapper.updateLatlng";
		
		return session.update(statement, info);
	}
}
