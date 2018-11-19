package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CollectionDao;

public class CollectionDeleteServlet extends HttpServlet {

	public CollectionDeleteServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int uid=Integer.parseInt(request.getParameter("uid"));
		int cid=Integer.parseInt(request.getParameter("cid"));
		CollectionDao cdao=new CollectionDao();
		cdao.deleteCollection(cid);
		response.sendRedirect(request.getContextPath()+"/collection.jsp?uid="+uid);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void init() throws ServletException {
	}

}
