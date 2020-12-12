<%-- 
    Document   : Home2
    Created on : Nov 14, 2020, 1:33:52 PM
    Author     : amsaj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member Homepage</title>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="Home2.css">
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
        
        
        <a class = "nav-list" href = "/OnlineLibrary/Logout1" title="Logout">
          <div class = "nav-icon" >
          <i class = "fa fa-lock" ></i>
          </div>
          <div class = "nav-title" >Logout</div>
       </a> 
        
  </div>
            
            
            
  <div class = "main-content">
    <div class = "dashboard">
       <h1>
           W e l c o m e&emsp;t o&emsp;O n l i n e&emsp;L i b r a r y&emsp; 
        <%= session.getAttribute("member_name")%> 
        
       </h1>
    </div>
     
      
      
      
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
        <hr>
        
        
        
        
       
    <div class = "tab-body">
      <a class = "tab-item ongoing" href = "#">
        <div class = "tab-info">
          <button class = "display-info">
            <i class = "fa fa-info-circle"></i>            
          </button>
        </div>
        <div class = "tab-title">
          Fantasy
        </div>
        <div class = "tab-details">
          Taste The Rainbow
        </div>
      </a>
        
        
        
      
      <a class = "tab-item ong" href = "#">
        <div class = "tab-info">
          <button class = "display-info">
            <i class = "fa fa-info-circle"></i>            
          </button>
        </div>
        <div class = "tab-title">
          Mystery
        </div>
        <div class = "tab-details">
          An Unsolved Mystery with the Usual Suspects
        </div>
      </a>
        
        
        
      
      <a class = "tab-item ongoing" href = "#">
        <div class = "tab-info">
          <button class = "display-info">
            <i class = "fa fa-info-circle"></i>            
          </button>
        </div>
        <div class = "tab-title">
          Thriller
        </div>
        <div class = "tab-details">
          An Unusual Ending which bring the Thrill out of heart.
        </div>
      </a>
      
        
        
      <a class = "tab-item ong" href = "#">
        <div class = "tab-info">
          <button class = "display-info">
            <i class = "fa fa-info-circle"></i>            
          </button>
        </div>
        <div class = "tab-title">
          Romance
        </div>
        <div class = "tab-details">
          To Be With You, Thats All I Want
        </div>
      </a>
        
        
        
        
      <a class = "tab-item ongoing" href = "#">
        <div class = "tab-info">
          <button class = "display-info">
            <i class = "fa fa-info-circle"></i>            
          </button>
        </div>
        <div class = "tab-title">
          Sci-Fi
        </div>
        <div class = "tab-details">
          Few Problems Requires Scientific Solutions
        </div>
      </a>
        
        
      <a class = "tab-item ong" href = "#">
        <div class = "tab-info">
          <button class = "display-info">
            <i class = "fa fa-info-circle"></i>            
          </button>
        </div>
        <div class = "tab-title">
          Comics
        </div>
        <div class = "tab-details">
          The Rise of Heros
        </div>
      </a>
        
        
    </div>
        
        
    
  </div>
</div>
     
    </body>
</html>
