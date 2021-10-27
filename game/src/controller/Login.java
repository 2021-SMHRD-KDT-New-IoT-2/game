package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberVO;

@WebServlet("/Login")
public class Login extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");

		MemberDAO dao = new MemberDAO();

		MemberVO vo = dao.login(id, pw, nick);

		if (vo != null) {
			HttpSession session = request.getSession();

			session.setAttribute("member", vo);

			response.sendRedirect(".jsp"); // 수정

		} else {
			response.sendRedirect(".jsp"); // 수정
		}
	}
}
