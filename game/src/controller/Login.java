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

		String user_no = request.getParameter("user_no");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");

		MemberDAO dao = new MemberDAO();

		MemberVO vo = dao.login(user_id, user_pw);

		if (vo != null) {
			HttpSession session = request.getSession();

			session.setAttribute("member", vo);

			response.sendRedirect("index.html"); // ����

		} else {
			response.sendRedirect("index.html"); // ����
		}
	}
}