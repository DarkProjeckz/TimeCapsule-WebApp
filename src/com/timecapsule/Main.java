package com.timecapsule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Main")
public class Main extends HttpServlet {
    public Main() {
        super();
    }
    private static final long serialVersionUID = -534446648127873033L;
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		String data = request.getParameter("tarea");
		String tit= request.getParameter("title");
		String dat = request.getParameter("date");
		HttpSession session=request.getSession();
		int id = (int)session.getAttribute("uid");
		//Remote Database connection
		DbHandler db = new DbHandler();
		if(!(db.checkDataExistence(id, tit, dat)))
		{
			//Adding user events
			db.addEvent(id, tit, dat, data);
			int count = db.getEventCount(id);
			session.setAttribute("count", count);
			request.setAttribute("alert","Successfully added"); 
		}
		else{
			request.setAttribute("alert","Title with same date exists"); 
		}
		request.getRequestDispatcher("Main.jsp").include(request, response);
	}
}