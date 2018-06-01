package web.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.impl.BusinessServiceImpl;
import domain.Order;
import domain.User;

public class ClientListOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if(user == null){
			request.setAttribute("message", "对不起，请先登录");
			request.getRequestDispatcher("/client/clientlistorder.jsp").forward(request, response);
			return;
		}
		String userid = user.getId();
		BusinessServiceImpl service = new BusinessServiceImpl();
		List<Order> orders = service.clientListOrder(userid);
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("/client/clientlistorder.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
