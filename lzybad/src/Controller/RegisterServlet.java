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
		
		request.getRequestDispatcher("/register.jsp").forward(request, response);	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int flag=1;
		request.setCharacterEncoding("utf-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String repassword=request.getParameter("repassword");
		String secondname=request.getParameter("secondname");
		int age=Integer.parseInt(request.getParameter("age"));
		String sex=request.getParameter("sex");
		//System.out.println(password+"   "+repassword);
		if(!password.trim().equals(repassword.trim()))//ȥ���ո�
		{
			request.setAttribute("error", "�����ȷ�����벻����");
			flag=0;
		}
		if(password.trim().length()<6)//��������
		{
			request.setAttribute("error", "���볤�ȹ��̣�");
			flag=0;
		}
		UserDao userdao=new UserDao();
		boolean valid=userdao.exist(username);
		System.out.println(username+" *** "+valid);
		if(valid==true){
			System.out.println(username+" 222 "+valid);
			request.setAttribute("error", "�û����Ѿ����ڣ����������룡");
			flag=0;
		}
		if(flag==0)
		doGet(request, response);
		else
		{
			userdao.isRegister(username, password,secondname,age,sex);
			request.getSession().setAttribute("success", "ע��ɹ���");
			response.sendRedirect(request.getContextPath()+"/Login");	
		}
		
	}

	public void init() throws ServletException {
	}
}
