package member;

import java.sql.SQLException;

import basket.service.ServiceException;

public class CofirmMemberService {
	private static CofirmMemberService instance = new CofirmMemberService();

	public static CofirmMemberService getInstance() {
		return instance;
	}

	private CofirmMemberService() {
	}
	
	public String confirmMember(String tag) {
		try {
			MemberDAO memberDAO = new MemberDAO();
			String cid = memberDAO.confirmMember(tag);
		
			return cid;
		} catch (SQLException e) {
			throw new ServiceException("error: " + e.getMessage(), e);
		} 
	}
}
