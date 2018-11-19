package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.QuestionDao;

public class QuestionAddServlet extends HttpServlet {

	
	public QuestionAddServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int uid=Integer.parseInt(request.getParameter("uid"));
		String qtitle=request.getParameter("qtitle");
		String qco=request.getParameter("qco");
		QuestionDao qdao=new QuestionDao();
		qdao.addQuestion(uid,qtitle,qco);
		response.sendRedirect(request.getContextPath()+"/question.jsp?uid="+uid);
	
	}

	
	public void init() throws ServletException {
	}

}
