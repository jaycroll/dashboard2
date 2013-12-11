<%@ include file="../sub/header.jsp"%>

<%@ page import="com.misc.lib.RolePermission" %> 
<%@ page import="com.model.lib.*" %>
<%@ page import="java.sql.*" %>
<% 
	HttpSession sMain=request.getSession();
	RolePermission rpMain=new RolePermission();
	rpMain.gAppProperties(request.getRealPath("/"));
	String[] territories = (String[]) request.getAttribute("territories");
	String[] areas = (String[]) request.getAttribute("areas");
	String[] isSelected = (String[]) request.getAttribute("isSelected");
	String selected = request.getParameter("selected");
	

%>

<%	
	    /*ResultSet rs = (ResultSet) request.getAttribute("listAutoLoad");
		if (rs.next()) {  
		do{*/
	%>	
	 
 <%		
		/*
		} while (rs.next());
		
	    }
		*/
  %>



<div id="header" align="center"><img src="<%=sitePathInit%>images/ppe-blk.png"/></div>
<div id="title">

<a href="<%=sitePathInit%>" class="lucida_21_black"><img src="<%=sitePathInit%>images/target-small.png" align="absmiddle"/>Dashboard</a>

</div>
 
<% if(loggedState){%>
<div id="menu">
<div id="menu-right" class="lucida_12_tungsten_b"> Hello, <%=sess.getAttribute("username")%> (<%=sess.getAttribute("rolename")%>). <a href="<%=sitePathInit%>User/logout"><span class="lucida_12_red_b">Logout</span></a></div>
<div id="menu-left">
	<ul class="sub">
	<li id="menu1" ><a href="<%=sitePathInit%>Projection" title="menu1"><span class="displace"></span></a></li>
	<li id="menu2"><a href="<%=sitePathInit%>Team" title="menu2" ><span class="displace"></span></a></li>
    <li id="menu3"><a href="<%=sitePathInit%>Area"  title="menu3"class="active" ><span class="displace"></span></a></li>
    </ul>
	
</div>
</div>
	<p>Target - Actual % (Achievment)
    <p>Territory: <span style="text-align: center">
    <select name="territory" class="text_12_tungsten" id="select2">
    <option value="" selected=""></option>
    <%
    	for(int i = 1; i<territories.length;i++){
    		if(territories[i]!=null){
    			%>
    				<option value="<%=i %>" ><%=territories[i] %></option>
    			<%
    		}
    	}
    %>
    </select>
	<h2 id="showValHere"></h2>
<form id='formTarget'>
<% if(rpMain.verifyModule(Integer.parseInt(sMain.getAttribute("roleid").toString()),9,6)){	%> 
<div id="content" style='float:left'>


<%
	  /*
	  ResultSet rs = (ResultSet) request.getAttribute("agentlist");
		if (rs.next()) {  
		do{*/
%>	
	
 <%		
		/*} while (rs.next()); rs.getString("userfirstname")
	    } */
  %>

			<img src="<%=sitePathInit%>images/screen/area.jpg">
</div>

<% }else{ %>
		<div style='clear:both'>&nbsp;</div>
		<div  class='divCenter txtCenter'>
			  <div class='access_denied'>Access Denied</div>
			  <div class='clr'>&nbsp;</div>
			  <div class='clr'><a  style='color:#3E7836;' href="<%=sitePathInit%>">Back to Main</a></div>
              <div class='clr'>&nbsp;</div>
	    </div>
<% } %>
<input type='hidden' name='action' class='jqAction' value='loadDefault'> 
</form>


<script type='text/javascript'>

$(document).ready(function($){
	$("#content").html("");	

});
$("#select2").change(function(){
	var str = "";
    $( "#select2 option:selected" ).each(function() {
      str += $( this ).val();
      
    	});
    $("#content").empty();	
	<%
		for(int i=1;i<territories.length;i++){
			if(territories[i]!=null){
	%>
				if(str==<%=i%>){
					
					loadAreas(str);
				}
	<%
			}
		}
	%>
	}).change();
function loadAreas(territoryid){
	var territoryid = territoryid;
	$.post("<%=sitePathInit%>AArea",{action:'loadAreas',territoryid:territoryid},
			   function(data){
		$("#content").append(data);	
	});
}



</script>

<% }%>