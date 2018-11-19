package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ResponseDao;

public class ResponseAddServlet extends HttpServlet {

	public ResponseAddServlet() {
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
		int qid=Integer.parseInt(request.getParameter("qid"));  
		String rco=request.getParameter("rco");
		if(rco!=""){
			ResponseDao rdao=new ResponseDao();
			rdao.addResponse(uid, qid, rco);
		}
		response.sendRedirect(request.getContextPath()+"/Login");
	}
	public void init() throws ServletException {
	}

}
