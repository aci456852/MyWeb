package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ResponseDao;

public class AdminResponseDeleteServlet extends HttpServlet {

	
	public AdminResponseDeleteServlet() {
		super();
	}


	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//request.getRequestDispatcher("/response.jsp").forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
		request.setCharacterEncoding("utf-8");
		int rid=Integer.parseInt(request.getParameter("rid"));  
		ResponseDao rdao=new ResponseDao();
		rdao.deleteResponse(rid);
		response.sendRedirect(request.getContextPath()+"/adminResponse.jsp");
	}
	public void init() throws ServletException {
	}

}
