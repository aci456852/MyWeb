package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.QuestionDao;

public class AdminQuestionDeleteServlet extends HttpServlet {

	public AdminQuestionDeleteServlet() {
		super();
	}


	public void destroy() {
		super.destroy();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		//request.getRequestDispatcher("/question.jsp").forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int qid=Integer.parseInt(request.getParameter("qid"));
		QuestionDao qdao=new QuestionDao();
		qdao.deleteQuestion(qid);
		response.sendRedirect(request.getContextPath()+"/adminQuestion.jsp");
	}

	public void init() throws ServletException {
	}


}
