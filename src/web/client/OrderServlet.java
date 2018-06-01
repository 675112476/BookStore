package web.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.impl.BusinessServiceImpl;
import domain.Cart;
import domain.User;

public class OrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try{
			User user = (User) request.getSession().getAttribute("user");
			if(user == null){
				request.setAttribute("message", "�Բ������ȵ�¼");
				request.getRequestDispatcher("/client/clientlistorder.jsp").forward(request, response);
				return;
			}
			
			Cart cart = (Cart) request.getSession().getAttribute("cart");
			BusinessServiceImpl service = new BusinessServiceImpl();
			service.createOrder(cart, user);
			request.setAttribute("message", "����������");
			request.getSession().removeAttribute("cart");//��չ��ﳵ���������Լ�����ȥ�ģ���Ϊ�㹺����������չ��ﳵ��ǰ�˵���鿴���ﳵ�ֳ�����
			response.sendRedirect("ClientListOrderServlet");
//			request.getRequestDispatcher("ClientListOrderServlet").forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("message", "��������ʧ��");
			request.getRequestDispatcher("/client/listcart.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
