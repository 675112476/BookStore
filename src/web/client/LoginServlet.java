package web.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.User;
import service.impl.BusinessServiceImpl;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		BusinessServiceImpl service = new BusinessServiceImpl();
		User user = service.userLogin(username, password);
		if(user == null){
			request.setAttribute("message", "用户名和密码不对");
			return;
		}
		request.getSession().setAttribute("user", user);
		response.sendRedirect("IndexServlet?method=getAll");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
