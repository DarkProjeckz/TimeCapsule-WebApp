package com.timecapsule;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class Login extends HttpServlet {
    public Login() {
        super();
    }
    private static final long serialVersionUID = -7316999659665092862L;
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		response.setContentType("text/html");  
		Map<String,String> msg;
		HttpSession session=request.getSession(true);
		DbHandler db = new DbHandler();
		int id;
		if((id = db.authenticateUser(uname, pass))!=0)
		{
			System.out.println(id+" -> Logged in");
			//Getting total count of events for the specific user
			int count = db.getEventCount(id);
			msg = db.getUserData(id);
			session.setAttribute("uid",id );
			session.setAttribute("data", msg);
			session.setAttribute("count", count);
			request.getRequestDispatcher("Main.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("signerr","Invalid username or password. Please try again"); 
			request.getRequestDispatcher("index.jsp").include(request, response);
		}
	}
}
