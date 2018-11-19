package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.User;
import Dao.UserDao;

public class PersonalServlet extends HttpServlet {

	public PersonalServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/personal.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String secondname=request.getParameter("secondname");
		String email=request.getParameter("email");
		int age=Integer.parseInt(request.getParameter("age"));
		String sex=request.getParameter("sex");
		String hobby=request.getParameter("hobby");
		String motto=request.getParameter("motto");
		int uid=Integer.parseInt(request.getParameter("uid"));  
		UserDao userdao=new UserDao();
		userdao.personal(secondname,email,age,sex,hobby,motto,uid);
		request.setAttribute("sucess", "修改个人信息成功！");
		doGet(request, response);
		//response.sendRedirect(request.getContextPath()+"/main.jsp");
		
	}

	public void init() throws ServletException {
	}

}
