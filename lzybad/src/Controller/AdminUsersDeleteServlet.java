package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserDao;

public class AdminUsersDeleteServlet extends HttpServlet {

	public AdminUsersDeleteServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int uid=Integer.parseInt(request.getParameter("uid"));  
		UserDao udao=new UserDao();
		udao.deleteUser(uid);
		response.sendRedirect(request.getContextPath()+"/adminUsers.jsp");
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void init() throws ServletException {
		
	}

}
