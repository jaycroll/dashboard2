package com.controller.lib;


import org.json.simple.JSONObject;
import com.misc.lib.CustomHelper;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.lib.*;

/**
 * Servlet implementation class Index
 */

@WebServlet(description = "Target servlet", urlPatterns = { "/ProductTarget" })

public class ProductTarget extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String strName="Testing";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductTarget() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action	= request.getParameter("action");
		HttpSession sess=request.getSession();
		CustomHelper ch=new CustomHelper();
		
		 TargetModel tar=new TargetModel();
		 tar.projectFile=getServletContext().getRealPath("");
		
		
		if(ch.checkMemberSession(sess)){
	
			ProjectionModel proj=new ProjectionModel();
			proj.projectFile=getServletContext().getRealPath("");
			
			RequestDispatcher view=null;
			Boolean useDispatcher=false;
			
			if(action==null){
				
				 Map det=new HashMap();
				 request.setAttribute("banner","dashboard");
				 useDispatcher=true;
				 
				 ResultSet listTarget=tar.loadTarget(det);
				 request.setAttribute("listTarget",listTarget);
				 
				 ResultSet listDepartment=tar.loadDepartment();
				 request.setAttribute("listDepartment",listDepartment);
				 
				 ResultSet listTargetGroup=tar.loadTargetGroup();
				 request.setAttribute("listTargetGroup",listTargetGroup);
				 
				 view = request.getRequestDispatcher("target/main.jsp");
				
				////////////////////////////////////////////////////////
				
			}
			
			if(useDispatcher){	
				response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
				response.setHeader("Pragma", "no-cache");
				view.forward(request, response); 
			}
		}else{
			response.sendRedirect("/Dashboard");
		}
		 
			
		
		 
	}

	private int count(float[] iSales) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}