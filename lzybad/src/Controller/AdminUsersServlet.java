package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.QuestionDao;
import Dao.UserDao;

public class AdminUsersServlet extends HttpServlet {

	public AdminUsersServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getServletPath();
		//字符串截取方法名
		method = method.substring(1, method.length()-13);
		Method m = null;
		try {
			m = this.getClass().getDeclaredMethod(method,HttpServletRequest.class, HttpServletResponse.class);			
			m.invoke(this, request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}					
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getServletPath();
		//字符串截取方法名
		method = method.substring(1, method.length()-13);
		Method m = null;
		try {
			m = this.getClass().getDeclaredMethod(method,HttpServletRequest.class, HttpServletResponse.class);			
			m.invoke(this, request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	public void init() throws ServletException {
		
	}
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/adminUsers.jsp").forward(request, response);
	
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int uid=Integer.parseInt(request.getParameter("uid"));  
		UserDao udao=new UserDao();
		udao.deleteUser(uid);
		list(request,response);
	}
}
