package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MessagesDao;

public class MessagesAddServlet extends HttpServlet {

	public MessagesAddServlet() {
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
		String mco=request.getParameter("mco");
		MessagesDao mdao=new MessagesDao();	
		mdao.addMessages(uid, mco);
		response.sendRedirect(request.getContextPath()+"/contactus.jsp?uid="+uid);
		
	}

	public void init() throws ServletException {
		
	}

}
