package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

@WebServlet("/Join")
public class Join extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");

		MemberDAO dao = new MemberDAO();

		int cnt = dao.Join(id, pw, nick);

		if (cnt > 0) {
			System.out.println("가입성공!");

			RequestDispatcher rd = request.getRequestDispatcher("join_success.jsp");

			request.setAttribute("id", id);

			rd.forward(request, response);

		} else {
			System.out.println("가입실패!");
			response.sendRedirect(".jsp"); // 수정
		}
	}
}
