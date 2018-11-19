package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MessagesDao;

public class MessagesDeleteServlet extends HttpServlet {

	public MessagesDeleteServlet() {
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
		int mid=Integer.parseInt(request.getParameter("mid"));
		MessagesDao mdao=new MessagesDao();	
		mdao.deleteMessages(mid);
		response.sendRedirect(request.getContextPath()+"/adminContactUs.jsp");
	}

	
	public void init() throws ServletException {
		
	}

}
