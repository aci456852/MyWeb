package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CollectionDao;

public class CollectionAddServlet extends HttpServlet {

	public CollectionAddServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int uid=Integer.parseInt(request.getParameter("uid"));
		int qid=Integer.parseInt(request.getParameter("qid"));
		int rid=Integer.parseInt(request.getParameter("rid"));
		CollectionDao cdao=new CollectionDao();
		cdao.addCollection(uid, qid, rid);
		response.sendRedirect(request.getContextPath()+"/Login");
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	public void init() throws ServletException {
	}

}
