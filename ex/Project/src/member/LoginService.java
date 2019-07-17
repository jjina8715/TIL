package member;

public class LoginService {

	public String login(String id, String password) {
		MemberDAO memberDao = new MemberDAO();
		Member member = memberDao.selectById(id);
		if(member == null) {
			throw new LoginFailException();
		}
		if(!member.matchPassword(password)) {
			throw new LoginFailException();
		}
		return member.getId();
	}

}
