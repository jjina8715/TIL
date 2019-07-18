package dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.NoticeVO;
import vo.SearchNoticeInfoVO;

@Repository
public class NoticeDAO {
	@Autowired
	SqlSession session = null;

	public List<NoticeVO> search(SearchNoticeInfoVO noticeinfo) {
		String statement = "resource.NoticeMapper.searchNotice";
		List<NoticeVO> list = session.selectList(statement, noticeinfo);
		return list;
	}

	public int selectSearchCount(SearchNoticeInfoVO noticeinfo) {
		String statement = "resource.NoticeMapper.searchNoticeCount";
		return session.selectOne(statement, noticeinfo);
	}

	public NoticeVO selectNotice(int nid) {
		String statement = "resource.NoticeMapper.selectNoticeContent";
		return session.selectOne(statement,nid);
	}
}
