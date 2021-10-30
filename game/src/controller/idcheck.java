package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

@WebServlet("/idcheck")
public class idcheck extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");

		String id = request.getParameter("id");
		
//		System.out.println(id);
		
		MemberDAO dao = new MemberDAO();
		
//		boolean check = dao.idCheck(id);
		
		PrintWriter out = response.getWriter();

//		out.print(check); 
	}

}
