package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ManageTransaction;
import Model.users;

/**
 * Servlet implementation class MemberHistoryServlet
 */
@WebServlet("/MemberHistoryServlet")
public class MemberHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int UserID = Integer.parseInt(request.getParameter("UserID"));
		users User = new users();
		User.setUserID(UserID);
		
		ManageTransaction History = new ManageTransaction();
		try {
			Object[] Transaction = History.getTransactionHistory(User);
			request.setAttribute("TransactionHistory", Transaction);
			request.setAttribute("Success", Transaction.length!=0 || Transaction.length!=1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("MemberHistory.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
