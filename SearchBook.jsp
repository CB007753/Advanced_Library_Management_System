<%-- 
    Document   : SearchBook
    Created on : Nov 16, 2020, 11:53:53 AM
    Author     : Shifny
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <link rel="stylesheet" type="text/css" href="SearchResult.css">
    </head>
    <body>
        <%
      
      response.setHeader("Cache-Control", "no-cache, no-store, must-revaliadte");//this will work on http 1.1
     
      response.setHeader("Pragma","no-cache");//if http 1.0, then this line should be added to prevent back button after logout
      
      response.setHeader("Expires", "0");//Proxies

      %>
  
        <div class = "container">
            
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
           S E A R C H&emsp;B O O K&emsp;
        
       </h1>
    </div>
          
          
          
       <!-- The form -->
<form action="" class="example" method="POST">
    
   
    <input type="text" placeholder="Search.." name="search" value="" required="true">
  
   <button type="submit" style="width: 10%"><i class="fa fa-search"></i></button>
   
   <button onclick="window.location.href='AdvancedSearch.jsp'" type="button"><i class="fa fa-search-plus" aria-hidden="true"></i> Advanced Search</button>
   <br>
   <br>
   <hr>
   </form>
   </div>
       
          <div class="result">   <%-- SQL Code+ Java Code to Search Books With Advanced Search --%>
    
                <% 
                    String bookname= request.getParameter("search");
                                 try
                                 {
                                 Class.forName("com.mysql.jdbc.Driver").newInstance();
                                 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/newlibrarysystem","root","root");
                                 String Query = "select * from book where Title like'%"+request.getParameter("search").toUpperCase()+"%'";
                                 
                               
                                
                                 Statement stm = con.createStatement();
                                 ResultSet rs=stm.executeQuery(Query);
                                 
                                 %>
                                 <b>Search Result :</b>
                                <%
                                 while(rs.next())
                                 {
                                 %>
                              
                             <ul>
             
                <div class="box"> 
                    <li> 
                        
                        <table class="table table-bordered table-striped" style="width: 70%" >  
                            <tr>
                            
                                <div class="title">
                                    
                                    <div class="dropdown">
                                        <span><b><%=rs.getString("Title")%> </b>
                                                
                                               
                                            </span>
                                                <div class="dropdown-content">
                                                    <p><b>Author:</b><%=rs.getString("Author")%></p>
                                                    <p><b>Category:</b><%=rs.getString("Category")%></p>
                                                    <p><b>Language:</b><%=rs.getString("Language")%></p>
                                                    
                                                 </div>
                                    </div>
                                    
                                    
                                </div>
                            
                            
                            
                            </tr>
                            
                            <tr>
                            <a onclick="window.location.href='Rating.jsp'">
                                <img src="<%=rs.getString("Image")%>" width="217.5px" height="249px" onclick=<%session.setAttribute("book_name",bookname);%> > 
                               
                                </a>
                            </tr>
                          
  
                   </table> 
   
                    </li> 
                    
                </div>
                   
            </ul>
                             <%
                             while(rs.next())
                             {%>
                             
                             <ul>
             
                <div class="box"> <li> 
                        
                        <table class="table table-bordered table-striped" style="width: 70%" >  
                            <tr>
                            
                            <div class="title">
                                     <div class="dropdown">
                                         <span><b><%=rs.getString("Title")%></b>
                                             
                                             
                                            </span>
                                                <div class="dropdown-content">
                                                    <p><b>Author:</b><%=rs.getString("Author")%></p>
                                                    <p><b>Category:</b><%=rs.getString("Category")%></p>
                                                    <p><b>Language:</b><%=rs.getString("Language")%></p>
                                                    
                                                 </div>
                                    </div>
                            </div>
                            
                            </tr>
                            
                            <tr>
                                <a onclick="window.location.href='Rating.jsp'">
                                <img src="<%=rs.getString("Image")%>" width="217.5px" height="249px" onclick=<%session.setAttribute("book_name",bookname);%>> 
                                
                                </a>
                            </tr>

                   </table> 
   
                    </li> 
                    
                </div>
                   
            </ul>
 
                                <%}%>
                                
                                
                             <%
                                   
       
                                 }
                                    
                             %>
                             <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                             <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><hr>
                             <%
   
                                 rs.close();}
     
                                 catch(Exception ex)
                                 {
                                 ex.printStackTrace();
                                 }
                    
                                 %>
                                 <%--
                                 This Part Is To View All The Available Books To The Member
                                 --%>
                                 <b>All Books</b>
                                 <%
                                     try{
                                 Class.forName("com.mysql.jdbc.Driver").newInstance();
                                 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/newlibrarysystem","root","root");
                                 String Query = "select * from book";
                                 
                                
                                
                                 Statement stm = con.createStatement();
                                 ResultSet rs=stm.executeQuery(Query);
                                 
                                 while(rs.next())
                                 {
                                 %>
                                         
                             <ul>
             
                <div class="box"> 
                    <li> 
                        
                        <table class="table table-bordered table-striped" style="width: 70%" >  
                            <tr>
                            
                            <div class="title">
                            
                                    <div class="dropdown">
                                        <span><b><%=rs.getString("Title")%> </b>
                                             
                                            </span>
                                                <div class="dropdown-content">
                                                    <p><b>Author:</b><%=rs.getString("Author")%></p>
                                                    <p><b>Category:</b><%=rs.getString("Category")%></p>
                                                    <p><b>Language:</b><%=rs.getString("Language")%></p>
                                                    <p><a href="<%=rs.getString("PDF")%>"><b>Read</b></a></p>
                                                 </div>
                                    </div>
                                
                            </div>
                            
                            </tr>
                            
                            <tr>
                                <a onclick="window.location.href='Rating.jsp'">
                                    <img src="<%=rs.getString("Image")%>" width="217.5px" height="249px" onclick=<%session.setAttribute("book_name",bookname);%>> 
                                
                                </a>
                            </tr>

                        </table> 
   
                    </li> 
                    
                     </div>
                   
                    </ul>
                                
                                 <%
                                 }
                                rs.close();}
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
