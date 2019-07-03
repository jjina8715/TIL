package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import model.dao.NewsDAO;
import model.vo.NewsVO;

@WebServlet("/news")
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tmpId = request.getParameter("id");
		String action = request.getParameter("action");
		String key=request.getParameter("key");
		String searchType=request.getParameter("searchType");
		HttpSession session = request.getSession();
		String[] status = (String[]) session.getAttribute("status");
		NewsDAO dao = new NewsDAO();
		List<NewsVO> list = null;
		if(action!=null) {
			if(tmpId!=null) {
				int id = Integer.parseInt(tmpId);
				if(action.equals("read")) {
					NewsVO vo = dao.listOne(id);
					request.setAttribute("vo", vo);
				}else if(action.equals("delete")) {
					if (dao.delete(id))
						request.setAttribute("msg", "������ ���������� �����Ǿ����ϴ�.");
					else
						request.setAttribute("msg", "������ �����ϴµ�  �����߽��ϴ�.");
				}	
				if(status!=null) {
					list = dao.search(status[0], status[1]);
				}else {
					list = dao.listAll();
				}
			}else {
				status = new String[2];
				status[0] = key;
				if(action.equals("search")) {
					status[1] = searchType;
					list=dao.search(key,searchType);
				}else if (action.equals("listwriter")) {
					status[1] = "writer";
					list=dao.search(key,"writer");
				}
				session.setAttribute("status", status);
			}
				
		}else {
			session.removeAttribute("status");
			list = dao.listAll();
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("jspexam/newsView.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String id = request.getParameter("id");
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		String[] status = (String[]) session.getAttribute("status");
		NewsDAO dao = new NewsDAO();
		List<NewsVO> list = null;
		NewsVO vo = new NewsVO();
		vo.setWriter(writer);
		vo.setTitle(title);
		vo.setContent(content);
		
		if(action.equals("insert")) {
			boolean result = dao.insert(vo);
			if (result) {
				request.setAttribute("msg", "������ ���������� �ԷµǾ����ϴ�.");
			} else {
				request.setAttribute("msg", "���� �Է¿� �����߽��ϴ�.");
			}
			session.removeAttribute("status");
		}else if(action.equals("update")&&id!=null){
			vo.setId(Integer.parseInt(id));
			boolean result = dao.update(vo);
			if(result) {
				request.setAttribute("msg", "������ ���������� �����Ǿ����ϴ�.");
			} else {
				request.setAttribute("msg", "���� ������ �����߽��ϴ�.");
			}
			if(status!=null) {
				list = dao.search(status[0], status[1]);
			}
		}
		request.setAttribute("list", list==null?dao.listAll():list);
		request.getRequestDispatcher("jspexam/newsView.jsp").forward(request, response);
	}

}
