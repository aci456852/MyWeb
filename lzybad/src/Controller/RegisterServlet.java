package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserDao;

public class RegisterServlet extends HttpServlet {

	public RegisterServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//request.getRequestDispatcher("/register.jsp").forward(request, response);
		RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");  
		try {  
		    rd.forward(request, response);  
		         return;  
		}catch(Exception e){}  
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String repassword=request.getParameter("repassword");
		String secondname=request.getParameter("secondname");
		int age=Integer.parseInt(request.getParameter("age"));
		String sex=request.getParameter("sex");
		//System.out.println(password+"   "+repassword);
		if(!password.trim().equals(repassword.trim()))//去掉空格
		{
			request.setAttribute("error", "密码和确认密码不符！");
			doGet(request, response);
		}
		UserDao userdao=new UserDao();
		boolean valid=userdao.exist(username);
		if(valid==true){
			request.setAttribute("error", "用户名已经存在，请重新输入！");
			doGet(request, response);
		}
		else{
		userdao.isRegister(username, password,secondname,age,sex);
		response.sendRedirect(request.getContextPath()+"/Login");
		}
		
	}

	public void init() throws ServletException {
	}
}
