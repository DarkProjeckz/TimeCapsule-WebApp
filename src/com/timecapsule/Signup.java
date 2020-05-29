package com.timecapsule;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
    public Signup() {
        super();
    }
    private static final long serialVersionUID = 8071010115461663805L;
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		String usname = request.getParameter("usname");
		String passw = request.getParameter("passw");
		String cpassw = request.getParameter("cpassw");
		String mail = request.getParameter("mail");
		String dob = request.getParameter("dob");
		String mob = request.getParameter("mob");
		String gen = request.getParameter("gen");
		
		Map<String,String> fetch = new HashMap<String,String>();
		fetch.put("name",usname);
		fetch.put("mail", mail);
		fetch.put("mob", mob);
		fetch.put("dob", dob);
		
		DbHandler db = new DbHandler();
		//Adding new user to db
		if(!db.checkUniqueUser(usname))
		{
			if(passw.equals(cpassw))
			{
				db.userInsert(usname, passw, cpassw, mail, dob, mob, gen);
				request.setAttribute("signerr", "Signed up successfully");
			}
			else {
				request.setAttribute("signerr","Password Mismatched");
				request.setAttribute("fetch",fetch);
			}
		}
		else {
			request.setAttribute("signerr","Username already exists");
			request.setAttribute("fetch",fetch);
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);					
	}
}