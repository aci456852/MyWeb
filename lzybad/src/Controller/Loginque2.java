package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.MyQuestion;
import Bean.User;
import Dao.QuestionDao;
import Dao.UserDao;

public class Loginque2 extends HttpServlet {

	public Loginque2() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("flag", 2);
		String hobby="";
		if(request.getSession().getAttribute("hobby")==null)
			hobby="";
		else
			hobby=request.getSession().getAttribute("hobby").toString();
		//System.out.println(hobby);
		UserDao udao=new UserDao();
		List<User> users=udao.getAll();
		int uid=-1;
		if(request.getSession().getAttribute("uid")==null)
		{
			uid = 0;
		}
		else
		{
			uid= Integer.parseInt(request.getSession().getAttribute("uid").toString());
		}
		if(uid!=0)
		{
			request.setAttribute("uid", String.valueOf(uid));
			request.setAttribute("users", users);
		}
		if(uid==0)
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		else if(uid==1)
		{
			QuestionDao qdao=new QuestionDao();
			List<MyQuestion> questions=qdao.getAll();
			request.setAttribute("questions", questions);
			request.getRequestDispatcher("/adminUsers.jsp").forward(request, response);
		}
		else
		{
			QuestionDao qdao=new QuestionDao();
			List<MyQuestion> questions1=qdao.getAll();
			request.setAttribute("questions1", questions1);
			List<MyQuestion> questions2=qdao.getfind(hobby);
			request.setAttribute("questions2", questions2);//搜索
			List<MyQuestion> questions3=qdao.getFireQues(uid);
			request.setAttribute("questions3", questions3);//热度
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String hobby=request.getParameter("hobby");
		request.getSession().setAttribute("hobby",hobby);
		UserDao userdao=new UserDao();
		int uid=userdao.isValid(username, password);
		if(uid==0)
		{
			request.setAttribute("error", "用户名或密码错误！");
			doGet(request, response);
		}
		else if(uid==1){//管理员跳转
			request.getSession().setAttribute("uid",uid);
			doGet(request, response);
			//response.sendRedirect(request.getContextPath()+"/adminResponse.jsp");
		}
		else{//普通用户跳转
			request.getSession().setAttribute("uid",uid);
			doGet(request, response);
			//response.sendRedirect(request.getContextPath()+"/Main.jsp");
		}
	}

	public void init() throws ServletException {
		
	}

}
