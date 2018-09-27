<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import ="webDataClasses.Room"%>
<%@ page import ="webDataClasses.RoomList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
		<link href="https://www.w3schools.com/w3css/4/w3.css" rel="stylesheet" >
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		<script>
		$(document).ready(function(){
		    $(".nav-tabs a").click(function(){
		        $(this).tab('show');
		    });
		});
		</script>
	</head>
	<%
		RoomList room =(RoomList) session.getAttribute("roomAvail");
		HashMap<String, String> lib1= new HashMap<String, String>(), 
								lib2= new HashMap<String, String>();
		
		for(int i=0;i<room.size();i++){
			String name = room.getRooms().get(i).getName();
			ArrayList<String> times = room.getRooms().get(i).getDate();
			String times_string = "";
			
			for(int j=0;j<times.size();j++){
				int a = times.get(j).indexOf("m")+1;
				String time = times.get(j).substring(0,a);
				times.set(j, time);
				times_string += time + " ";
			}
			
			if(name.length()<5){
				lib1.put(name, times_string);
			}else{
				lib2.put(name, times_string);
			}
		}
	%>
	<body style="overflow:auto">
	
	<div class="container">
	  <h2>All Available Rooms</h2>
	  <ul class="nav nav-tabs">
	    <li class="active">
	    <a href="#home">Leavey</a></li>
	    <li><a href="#menu1">Doheny</a></li>
	    <li><a href="#menu2">JFF</a></li>
	    <li><a href="#menu3">ACCT</a></li>
	  </ul>
	
	  <div class="tab-content">
	    <div id="home" class="tab-pane fade in active">
	    	<table class="comicGreen">
				<thead>
				<tr>
					<th>Room</th>
					<th>Time Period Available</th>
				</tr>
				</thead>
				
				<tbody>
				<% 
					int i=1000;
					for(Entry<String,String> e : lib1.entrySet()){ 
				%>
					<tr>
						<td><%= e.getKey() %></td><td> <%= e.getValue() %> 
							<div class="w3-container" style="float:right">
							  <button onclick="document.getElementById('id01<%=i%>').style.display='block'" class="w3-button w3-black">Notify Your Groupmates</button>
							  <div id="id01<%=i%>" class="w3-modal">
							    <div class="w3-modal-content">
							      <div class="w3-container">
							        <span onclick="document.getElementById('id01<%=i%>').style.display='none'" class="w3-button w3-display-topright">&times;</span>
						        		<form method="post" action="EmailSenderProcessor" style="margin:2%">										       
									        <h4> please enter the email addresses you wish to send the notification to</h4>
									        recipient1 <input type="email" name="recipient0"/><br/>
									        recipient2 <input type="email" name="recipient1"/><br/>
									        recipient3 <input type="email" name="recipient2"/><br/>
									        recipient4 <input type="email" name="recipient3"/><br/>
									        <input type="hidden" name="EmailType" value="notification"/>
									        <input type="hidden" name="roomName" value="<%=e.getKey()%>" />	
									        <input type="hidden" name="capacity" value="4" />										     
									        <input type="submit" value="send"/>
								        </form>
							      </div>
							    </div>
							  </div>
							</div>
						</td>
					</tr>
				<% 
					i++;
					} %>
				</tbody>
			</table>
	 	</div>
	 	
	    <div id="menu1" class="tab-pane fade">
	    	

				
				<% if(lib2.size() == 0){ %>
				<p> no rooms available at this time</p>
				<% }else{ %>
				<table class="comicGreen">
				<thead>
				<tr>
					<th>Room</th>
					<th>Time Period Available</th>
				</tr>
				</thead>
				<tbody>
					<% 
					int j=0;
					for(Entry<String,String> e : lib2.entrySet()){ 
					%>
						<tr>
							<td><%= e.getKey() %></td><td> <%= e.getValue() %> 
								<div class="w3-container" style="float:right">
								  <button onclick="document.getElementById('id02<%=j%>').style.display='block'" class="w3-button w3-black">Notify Your Groupmates</button>
								  <div id="id02<%=j%>" class="w3-modal">
								    <div class="w3-modal-content">
								      <div class="w3-container">
								        <span onclick="document.getElementById('id02<%=j%>').style.display='none'" class="w3-button w3-display-topright">&times;</span>
									        <form method="post" action="EmailSenderProcessor" style="margin:2%">										       
										        <h4> please enter the email addresses you wish to send the notification to</h4>
										        recipient1 <input type="email" name="recipient0"/><br/>
										        recipient2 <input type="email" name="recipient1"/><br/>
										        recipient3 <input type="email" name="recipient2"/><br/>
										        recipient4 <input type="email" name="recipient3"/><br/>
										        <input type="hidden" name="EmailType" value="notification"/>
										        <input type="hidden" name="roomName" value="<%=e.getKey()%>" />	
										        <input type="hidden" name="capacity" value="4" />										     
										        <input type="submit" value="send"/>
									        </form>
								      </div>
								    </div>
								  </div>
								</div>
							</td>
						</tr>
					<%j++;
					}} %>
				</tbody>
			</table>
	    </div>
	    
	    <div id="menu2" class="tab-pane fade">
	    	<p> the library is currently closed</p>
	    </div>
	    
	    <div id="menu3" class="tab-pane fade">
	    	<p> the library is currently closed</p>
	    </div>
	  </div>
	</div>	
	</body>
</html>