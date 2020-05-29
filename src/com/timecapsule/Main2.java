package com.timecapsule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
/**
 * Servlet implementation class Main2
 */
@WebServlet("/Main2")
public class Main2 extends HttpServlet {
    public Main2() {
        super();
    }
    private static final long serialVersionUID = -2588725855782494824L;
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		String titl = request.getParameter("title");
		String datt = request.getParameter("date");
		String content="";
		HttpSession session=request.getSession();
		int id = (int)session.getAttribute("uid");
		//Remote Database connection
		content = new DbHandler().displayEvent(id, titl, datt);
		if(content=="")
			request.setAttribute("alert", "Data not found!");
		else
			request.setAttribute("tareaData",content);
		request.getRequestDispatcher("Main.jsp").include(request, response);
	}
}