<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import ="webDataClasses.Room"%>
<%@ page import ="webDataClasses.RoomList"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>	Room reservation</title>
</head>
<body>
Location:
<select onchange="Show(parseInt(this.value), 'loc');">
  <option selected="selected" value="1">LVL</option>
  <option value="2">Doheny</option>
  <option value="3">JFF</option>
    <option value="3">ACCT</option>
</select>
&nbspTime:
<select  onchange="ShowTime(parseInt(this.value));">
 <option value="1">9:00am - 9:30am</option>
 <option value="2">9:30am - 10:00am</option>
  <option value="3">10:00am - 10:30am</option>
   <option value="4">10:30am - 11:00am</option>
    <option value="5">11:00am - 11:30am</option>
     <option value="6">11:30am - 12:00pm</option>
  <option value="7">12:00pm - 12:30pm</option>
  <option value="8">12:30pm - 1:00pm</option>
  <option value="9">1:00pm - 1:30pm</option>
   <option value="10">1:30pm - 2:00pm</option>
    <option value="11">2:00pm - 2:30pm</option>
    <option value="12">2:30pm - 3:00pm</option>
    <option value="13">3:00pm - 3:30pm</option>
    <option value="14">3:30pm - 4:00pm</option>
  	<option value="15">4:00pm - 4:30pm</option>
  	<option value="16">4:30pm - 5:00pm</option>
  	<option value="17">5:00pm - 5:30pm</option>
  	<option value="18">5:30pm - 6:00pm</option>
  	<option value="19">6:00pm - 6:30pm</option>
  	<option value="20">6:30pm - 7:00pm</option>
  	<option value="21">7:00pm - 7:30pm</option>
  	<option value="22">7:30pm - 8:00pm</option>
</select>

            <div style="display:block" id="loc1">
                 <div style="display:none" class="roomInfo" id="time1"></div>
                 <div style="display:none" class="roomInfo" id="time2"></div>
                 <div style="display:none" class="roomInfo" id="time3"></div>
                 <div style="display:none" class="roomInfo" id="time4"></div>
                 <div style="display:none" class="roomInfo" id="time5"></div>
                 <div style="display:none" class="roomInfo" id="time6"></div>
                 <div style="display:none" class="roomInfo" id="time7"></div>
                 <div style="display:none" class="roomInfo" id="time8"></div>
                 <div style="display:none" class="roomInfo" id="time9"></div>
                 <div style="display:none" class="roomInfo" id="time10"></div>
                 <div style="display:none" class="roomInfo" id="time11"></div> 
                 <div style="display:none" class="roomInfo" id="time12"></div>
                 <div style="display:none" class="roomInfo" id="time13"></div>
                 <div style="display:none" class="roomInfo" id="time14"></div>
                 <div style="display:none" class="roomInfo" id="time15"></div>
                 <div style="display:none" class="roomInfo" id="time16"></div>
                 <div style="display:none" class="roomInfo" id="time17"></div>
                 <div style="display:none" class="roomInfo" id="time18"></div>
                 <div style="display:none" class="roomInfo" id="time19"></div>
                 <div style="display:none" class="roomInfo" id="time20"></div>
                 <div style="display:none" class="roomInfo" id="time21"></div> 
                 <div style="display:none" class="roomInfo" id="time22"></div> 
                           
            </div>
            <div style="display:none" id="loc2">
                 <div style="display:none" class="roomInfo" id="tim1"></div>
                 <div style="display:none" class="roomInfo" id="tim2"></div>
                 <div style="display:none" class="roomInfo" id="tim3"></div>
                 <div style="display:none" class="roomInfo" id="tim4"></div>
                 <div style="display:none" class="roomInfo" id="tim5"></div>
                 <div style="display:none" class="roomInfo" id="tim6"></div>
                 <div style="display:none" class="roomInfo" id="tim7"></div>
                 <div style="display:none" class="roomInfo" id="tim8"></div>
                 <div style="display:none" class="roomInfo" id="tim9"></div>
                 <div style="display:none" class="roomInfo" id="tim10"></div>
                 <div style="display:none" class="roomInfo" id="tim11"></div> 
                 <div style="display:none" class="roomInfo" id="tim12"></div>
                 <div style="display:none" class="roomInfo" id="tim13"></div>
                 <div style="display:none" class="roomInfo" id="tim14"></div>
                 <div style="display:none" class="roomInfo" id="tim15"></div>
                 <div style="display:none" class="roomInfo" id="tim16"></div>
                 <div style="display:none" class="roomInfo" id="tim17"></div>
                 <div style="display:none" class="roomInfo" id="tim18"></div>
                 <div style="display:none" class="roomInfo" id="tim19"></div>
                 <div style="display:none" class="roomInfo" id="tim20"></div>
                 <div style="display:none" class="roomInfo" id="tim21"></div> 
                 <div style="display:none" class="roomInfo" id="tim22"></div> 
            </div>

     
          


<br>
<%
RoomList room =(RoomList) session.getAttribute("roomAvail");
 for(int i=0;i<room.size();i++){
%>

<% 
	if(room.getRooms().get(i).getName().length()<5){
%>
<script>
document.getElementById("loc1").innerHTML += "";
</script>

<% 		
	}
	else{
%>
<script>
document.getElementById("loc2").innerHTML += "";
</script>
<%
	}
%>



<% for(int j = 0;j<room.getRooms().get(i).getDate().size();j++){
%>
<% 
	if(room.getRooms().get(i).getName().length()<5){
		int a =room.getRooms().get(i).getDate().get(j).indexOf("m")-1;
		String b = room.getRooms().get(i).getDate().get(j).substring(0,a);
		int c = 0;
		//System.out.println (b);
		//System.out.println(b);
		if(b.equals("9:00")){
			c=1;
		}
		else if(b.equals("9:30")){
			c=2;
		}
		else if(b.equals("10:00")){
			c=3;
		}
		else if(b.equals("10:30")){
			c=4;
		}
		else if(b.equals("11:00")){
			c=5;
		}
		else if(b.equals("11:30")){
			c=6;
		}
		else if(b.equals("12:00")){
			//System.out.println("saaaaa");
			c=7;
		}
		else if(b.equals("12:30")){
			c=8;
		}
		else if(b.equals("1:00")){
			c=9;
		}
		else if(b.equals("1:30")){
			c=10;
		}
		else if(b.equals("2:00")){
			c=11;
		}
		else if(b.equals("2:30")){
			c=12;
		}
		else if(b.equals("3:00")){
			c=13;
		}
		else if(b.equals("3:30")){
			c=14;
		}
		else if(b.equals("4:00")){
			c=15;
		}
		else if(b.equals("4:30")){
			c=16;
		}
		else if(b.equals("5:00")){
			c=17;
		}
		else if(b.equals("5:30")){
			c=18;
		}
		else if(b.equals("6:00")){
			c=19;
		}
		else if(b.equals("6:30")){
			c=20;
		}
		else if(b.equals("7:00")){
			c=21;
		}
		else if(b.equals("7:30")){
			c=22;
		}
		String temp="time"+String.valueOf(c);
		//System.out.println(temp);
%>
<script>
console.log(<%=temp%>);
document.getElementById("<%=temp%>").innerHTML+="<button type='button' onclick='notifyUser('<%=room.getRooms().get(i).getName()%>')'>Notify Me!</button>&nbsp&nbsp";
document.getElementById("<%=temp%>").innerHTML +="Room:&nbsp<%=room.getRooms().get(i).getName() %><br>";

</script>

<% 		
	}
	else{
		int a =room.getRooms().get(i).getDate().get(j).indexOf("m")-1;
		String b = room.getRooms().get(i).getDate().get(j).substring(0,a);
		int c = 0;
		if(b.equals("9:00")){
			c=1;
		}
		else if(b.equals("9:30")){
			c=2;
		}
		else if(b.equals("10:00")){
			c=3;
		}
		else if(b.equals("10:30")){
			c=4;
		}
		else if(b.equals("11:00")){
			c=5;
		}
		else if(b.equals("11:30")){
			c=6;
		}
		else if(b.equals("12:00")){
			c=7;
		}
		else if(b.equals("12:30")){
			c=8;
		}
		else if(b.equals("1:00")){
			c=9;
		}
		else if(b.equals("1:30")){
			c=10;
		}
		else if(b.equals("2:00")){
			c=11;
		}
		else if(b.equals("2:30")){
			c=12;
		}
		else if(b.equals("3:00")){
			c=13;
		}
		else if(b.equals("3:30")){
			c=14;
		}
		else if(b.equals("4:00")){
			c=15;
		}
		else if(b.equals("4:30")){
			c=16;
		}
		else if(b.equals("5:00")){
			c=17;
		}
		else if(b.equals("5:30")){
			c=18;
		}
		else if(b.equals("6:00")){
			c=19;
		}
		else if(b.equals("6:30")){
			c=20;
		}
		else if(b.equals("7:00")){
			c=21;
		}
		else if(b.equals("7:30")){
			c=22;
		}
		String tmp="tim"+String.valueOf(c);
%>
<script>
//console.log(<%=tmp%>);
document.getElementById("<%=tmp%>").innerHTML+="<button type='button' onclick='notifyUser('<%=room.getRooms().get(i).getName()%>')'>Notify Me!</button>&nbsp&nbsp";
document.getElementById("<%=tmp%>").innerHTML +="Room:&nbsp<%=room.getRooms().get(i).getName() %><br>";

</script>
<%
	}
%>

<%
}
%>

<%
 }
%>
</body>

</html>