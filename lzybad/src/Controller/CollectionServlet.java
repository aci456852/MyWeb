package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CollectionDao;
import Dao.ResponseDao;

public class CollectionServlet extends HttpServlet {

	public CollectionServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getServletPath();
		//字符串截取方法名
		method = method.substring(1, method.length()-13);
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
		method = method.substring(1, method.length()-13);
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
	
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid= Integer.parseInt(request.getSession().getAttribute("uid").toString());
		request.setAttribute("uid", String.valueOf(uid));
		request.getRequestDispatcher("/collection.jsp").forward(request, response);
	
	}
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int uid=Integer.parseInt(request.getSession().getAttribute("uid").toString());  
		int qid=Integer.parseInt(request.getParameter("qid"));
		int rid=Integer.parseInt(request.getParameter("rid"));
		System.out.println(uid+"  "+qid+"  "+rid);
		CollectionDao cdao=new CollectionDao();
		cdao.addCollection(uid, qid, rid);
		list(request,response);	
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int cid=Integer.parseInt(request.getParameter("cid"));
		CollectionDao cdao=new CollectionDao();
		cdao.deleteCollection(cid);
		list(request,response);
	}
}
