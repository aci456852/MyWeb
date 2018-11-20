package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Dao.QuestionDao;

public class QuestionServlet extends HttpServlet {

	
	public QuestionServlet() {
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
		request.getRequestDispatcher("/question.jsp").forward(request, response);	
	}
	
	private void listforAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/adminQuestion.jsp").forward(request, response);	
	}
	
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int uid=Integer.parseInt(request.getSession().getAttribute("uid").toString());
		String qtitle=request.getParameter("qtitle");
		String qco=request.getParameter("qco");
		QuestionDao qdao=new QuestionDao();
		qdao.addQuestion(uid,qtitle,qco);
		listforUser(request,response);
	
	}
	
	private void deleteforUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int qid=Integer.parseInt(request.getParameter("qid"));
		//System.out.println(qid+"***");
		QuestionDao qdao=new QuestionDao();
		qdao.deleteQuestion(qid);		
		listforUser(request,response);
	}
	
	private void deleteforAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int qid=Integer.parseInt(request.getParameter("qid"));
		QuestionDao qdao=new QuestionDao();
		qdao.deleteQuestion(qid);
		listforAdmin(request,response);
	}
}
