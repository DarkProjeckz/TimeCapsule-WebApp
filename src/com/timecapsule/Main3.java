package com.timecapsule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
/**
 * Servlet implementation class Main3
 */
@WebServlet("/Main3")
public class Main3 extends HttpServlet {
	
    public Main3() {
        super();
    }
    private static final long serialVersionUID = 8894224352720163372L;
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		String titt = request.getParameter("title");
		String dt = request.getParameter("date");
		String datta = request.getParameter("tarea");
		HttpSession session=request.getSession();
		int id = (int)session.getAttribute("uid");
		DbHandler db = new DbHandler();
		if(db.checkDataExistence(id, titt, dt))
		{
			//Updating events of specifc user
			db.modifyEvent(id, titt, dt, datta);
			request.setAttribute("alert", "Successfully updated");
		}
		else
			request.setAttribute("alert", "Data does not exists for modification");
		request.getRequestDispatcher("Main.jsp").include(request, response);
	}
}
