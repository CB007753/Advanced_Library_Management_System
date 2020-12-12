<%-- 
    Document   : ViewComments
    Created on : Dec 10, 2020, 12:13:35 PM
    Author     : CRIMINAL
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Star rating</title>
	<link rel="stylesheet" href="ViewComments.css">
</head>
<body>
	<div class="container">
            
            <div class = "side-bar minimised">
        <!--sidebar here-->
        <a class = "nav-list" onclick = "$('.side-bar').toggleClass('minimised');">
            <div class = "nav-icon">
            <i class = "fa fa-navicon closed"></i>
            <i class = "fa fa-close opened"></i>
            </div>
        </a>
    
        
        <a class = "nav-list active" href = "Home2.jsp" title="Home">
         <div class = "nav-icon">
           <i class = "fa fa-home"></i>
         </div>
         <div class = "nav-title">Home</div>
        </a>
    
        
        
        <a class = "nav-list" href = "#" title="Profile">
          <div class = "nav-icon">
          <i class = "fa fa-user"></i>
          </div>
          <div class = "nav-title">Profile</div>
        </a>
        
        
        
        <a class = "nav-list" href = "#" title="Contact us">
          <div class = "nav-icon">
          <i class = "fa fa-edit"></i>
          </div>
          <div class = "nav-title">Contact us</div>
        </a>
    
    
        <a class = "nav-list" href = "#" title="About Us">
          <div class = "nav-icon">
          <i class = "fa fa-info"></i>
          </div>
          <div class = "nav-title">About Us</div>
       </a> 
        
        <a class = "nav-list" href ="Home2.jsp" title="Go Back">
          <div class = "nav-icon" >
          <i class="fa fa-reply" aria-hidden="true"></i>
          </div>
          <div class = "nav-title" >Back</div>
       </a> 
        
        <a class = "nav-list" href ="/OnlineLibrary/Logout1" title="Logout">
          <div class = "nav-icon" >
          <i class = "fa fa-lock" ></i>
          </div>
          <div class = "nav-title" >Logout</div>
       </a> 
        
  </div>
            <div class = "main-content">
            <div class="header">
    <div class = "dashboard">
       <h1>
           A L L&emsp;   C O M M E N T S&emsp;
        
       </h1>
        
        
        
    </div>
                <br><br> 
           
           <div class = "tabs">
      <div class = "tab-header">
        Comments
      </div>
      <a class = "tab " href = "SearchBook.jsp" onclick = "change(this,event,'all')">
        Search for Books
      </a>
      <a class = "tab " href = "ViewComments.jsp" onclick = "change(this,event,'ongoing')">
        View Comments
      </a>
      <a class = "tab" href = "ViewRating.jsp" onclick = "change(this,event,'future')">
        View Ratings
      </a>
      <a class = "tab" href = "#mock" onclick = "change(this,event,'mock')">
        Request Book
      </a>     
        
    </div>
           <hr><br><br>
               
                
            
                
		
                    
                    
                
                <%-- SQL Code+ Java Code to add ratings --%>
    
                <%
                                   
                                    
                                    
                                 try
                                 {
                                 Class.forName("com.mysql.jdbc.Driver").newInstance();
                                 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/newlibrarysystem","root","root");
                                 
                                   String Query ="SELECT * FROM rating ";
                                  
                                 Statement stm = con.createStatement();
                                 ResultSet rs=stm.executeQuery(Query);
                                 
                                 while(rs.next())
                                 {%>
                                     
                                 <div class="container2">
                <img src="shah.jpg" alt="Avatar" style="width:90px">
                <p><span><b><%=rs.getString("Member")%>:</b></span> On <b> &emsp;<%=rs.getString("BookName")%></b>.</p>
                <br><hr  style="border: 1px solid black; border-radius: 2px;"><br><br>
                <p>&emsp;&emsp;&emsp;&emsp;&emsp;<%=rs.getString("Comment")%>.</p>
                <br><br><br>
                 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<%=rs.getString("Date")%>          
                </div>
                                     
                                <% }
                                 
                                 
                                 
                                 
                                 }
                
                                
                                
                                 
                                catch(Exception ex)
                                  {
                                    ex.printStackTrace();
                                  }
                                 %>
		</div>
	</div>

               </div>
	
        
</body>
</html>