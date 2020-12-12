<%-- 
    Document   : AdvancedSearch
    Created on : Nov 21, 2020, 4:47:55 PM
    Author     : Shifny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advanced Search</title>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="AdvancedSearch.css">
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
        
        <a class = "nav-list" href ="SearchBook.jsp" title="Go Back">
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
           A D V A N C E D&emsp;S E A R C H&emsp;
        
       </h1>
    </div>

      
       <!-- form -->
       <form action="" class="AForm" method="POST" required="true" name="advancedForm">
    
    <input type="text" placeholder="Title.." name="title"  >
    
       <div class="form-group" >
  
           <select class="form-control" id="sel1" name="category" style="width: 309px">
      <option value="">Category</option>
      <option>Horror</option>
    <option>Romance</option>
    <option value="Litreture">Literature</option>
    <option>Fiction</option>
    <option>NonFiction</option>
    <option>Sci-Fi</option>
  </select>
       </div>
        
    <input type="text" placeholder="Author.." name="author"  >

       

       
       
       <div class="form-group" >
    <select class="form-control" id="sel1" name="language" style="width: 309px">
        
        <option value="">Language</option>
      <option>English</option>
    <option>Spanish</option>
    </select>
       </div>
  
    <button type="button" value="Submit" style="width: 10%" onclick="validate()"><i class="fa fa-search"></i></button>
   
        </form>
      
       <%-- Script code to prevent user from searching null values--%>
        <script>
        function validate() {
            if (advancedForm.title.value === '' && advancedForm.author.value === '' && advancedForm.category.value === '' && advancedForm.language.value === '') 
            {
                alert('You Have To Enter Atleast One Value');
                return false;
            }
            else {
                advancedForm.submit();
            }
        }
         </script>
       
       
       <br> <br> <hr> <br style="line-height: 0.1">
       
            </div>
       
       
       
                                 <%-- SQL Code+ Java Code to Search Books With Advanced Search --%>
          <div class="result">
                <% 
                    String bookname2= request.getParameter("title");
                                 try
                                 {
                                 Class.forName("com.mysql.jdbc.Driver").newInstance();
                                 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/newlibrarysystem","root","root");
                                 String Query = "select * from book where (Title like'%"+request.getParameter("title").toUpperCase()+"%')"
                                         + "AND (Author like'%"+request.getParameter("author").toUpperCase()+"%')"
                                         + "AND (Category like'%"+request.getParameter("category").toUpperCase()+"%')"
                                         + "AND (Language like'%"+request.getParameter("language").toUpperCase()+"%')";
                                 
                                
                                
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
                                            <span><%=rs.getString("Title")%></span>
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
                                <img src="<%=rs.getString("Image")%>" width="213px" height="249px" onclick=<%session.setAttribute("book_name",bookname2);%>> 
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
                                            <span><%=rs.getString("Title")%></span>
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
                                <img src="<%=rs.getString("Image")%>" width="213px" height="249px" onclick=<%session.setAttribute("book_name",bookname2);%>> 
                                </a>
                            </tr>

                   </table> 
   
                    </li> 
                    
                </div>
                   
            </ul>
                             
                                
                                <% }
                                   

                                 }
                                    
                                       
                                    
                             %>
                             <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                             <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><hr>
                             <%
   
                                 }
                                 
                                 catch(Exception ex)
                                 {
                                 ex.printStackTrace();
                                 
                                 }
                                 
                    
                                 %>
                                 
         
                                 
                                    <%--
                                 This Part Is To View All The Available Books To The Member
                                 --%>
                                 <b>All Books </b>
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
                                            <span><%=rs.getString("Title")%></span>
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
                                <img src="<%=rs.getString("Image")%>" width="213px" height="249px" onclick=<%session.setAttribute("book_name",bookname2);%> > 
                                </a>
                                
                                
                            </tr>

                        </table> 
   
                    </li> 
                    
                     </div>
                   
                    </ul>
                                
                                 <%
                                 }
                                }
                                catch(Exception ex)
                                  {
                                  
                                  out.println("     -Something Went Wrong, Please Restart the Server to Solve this Problem");
                                    ex.printStackTrace();
                                  }
                                 %>
     </div>
        
                                 
                                 
         
                          
                               
     
  </div>
</div>
     
    </body>
</html>