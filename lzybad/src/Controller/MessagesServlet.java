package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MessagesDao;
import Dao.QuestionDao;

public class MessagesServlet extends HttpServlet {

	public MessagesServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getServletPath();
		//字符串截取方法名
		method = method.substring(1, method.length()-11);
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
		method = method.substring(1, method.length()-11);
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
	private void listforUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid= Integer.parseInt(request.getSession().getAttribute("uid").toString());
		request.setAttribute("uid", String.valueOf(uid));
		request.getRequestDispatcher("/contactus.jsp").forward(request, response);	
	}
	
	private void listforAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid= Integer.parseInt(request.getSession().getAttribute("uid").toString());
		request.setAttribute("uid", String.valueOf(uid));
		request.getRequestDispatcher("/adminContactUs.jsp").forward(request, response);	
	}
	
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int uid=Integer.parseInt(request.getSession().getAttribute("uid").toString());
		String mco=request.getParameter("mco");
		MessagesDao mdao=new MessagesDao();	
		mdao.addMessages(uid, mco);
		listforUser(request,response);	
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int mid=Integer.parseInt(request.getParameter("mid"));
		MessagesDao mdao=new MessagesDao();	
		mdao.deleteMessages(mid);	
		listforAdmin(request,response);	
	}
}
