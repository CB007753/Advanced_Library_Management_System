<%-- 
    Document   : Rating
    Created on : Dec 2, 2020, 9:33:05 PM
    Author     : CRIMINAL
--%>


<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Star rating</title>
	<link rel="stylesheet" href="Rating.css">
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
           R A T E   B O O K&emsp;
        
       </h1>

    </div>
                
           <br><br> 
           
           <div class = "tabs">
      <div class = "tab-header">
        Rate Book
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
        
            </div>
                
		<div class="rating-wrap">
                    <form action="" class="AForm" method="POST" name="ratingform">
			<h2>Rate <%=session.getAttribute("book_name")%></h2>
			<div class="center">
                            
				<fieldset class="rating">
					<input type="radio" id="star5" name="rating"   value="5"><label for="star5" class="full" title="Awesome"></label>
					<input type="radio" id="star4.5" name="rating"  value="4.5"><label for="star4.5" class="half"></label>
					<input type="radio" id="star4" name="rating"  value="4"><label for="star4" class="full"></label>
                                        <input type="radio" id="star3.5" name="rating"  value="3.5"><label for="star3.5" class="half"></label>
					<input type="radio" id="star3" name="rating"   value="3"><label for="star3" class="full"></label>
					<input type="radio" id="star2.5" name="rating"  value="2.5"><label for="star2.5" class="half"></label>
					<input type="radio" id="star2" name="rating"  value="2"><label for="star2" class="full"></label>
					<input type="radio" id="star1.5" name="rating"  value="1.5"><label for="star1.5" class="half"></label>
					<input type="radio" id="star1" name="rating"  value="1"><label for="star1" class="full"></label>
					<input type="radio" id="star0.5" name="rating"  value="0.5"><label for="star0.5" class="half"></label>
                                        
                                        
                                         
				</fieldset>
                           
			</div>

			<h4 id="rating-value"></h4>
                        
                
                        <br>
                        <textarea style="margin-top:5px; width: 300px;" class="form-control" rows="3"  id="comment" placeholder="Enter your review" name="comment" title="comment" ></textarea>
                        <br>
                        <button type="submit" value="Submit" onclick="validate()" style="width: 15%;" >Submit</button>
                        </form>
                           </div>
                    
                    
                
                <%-- SQL Code+ Java Code to add ratings --%>
    
                <%
                                   
                                    
                                    
                                 try
                                 {
                                 Class.forName("com.mysql.jdbc.Driver").newInstance();
                                 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/newlibrarysystem","root","root");
                                 
                                     
                                  PreparedStatement ps = con.prepareStatement("INSERT INTO rating VALUES('"+session.getAttribute("member_name")+"','"+session.getAttribute("book_name")+"','"+request.getParameter("rating").toString()+"','"+request.getParameter("comment")+"','"+LocalDate.now()+"')");
                                 
                                    ps.executeUpdate();
                                
                                }
                                 
                                catch(Exception ex)
                                  {
                                    ex.printStackTrace();
                                  }
                                 %>
		
	</div>

               </div>
	
        <script>
            
            let star = document.querySelectorAll('input');
let showValue = document.querySelector('#rating-value');

for (let i = 0; i < star.length; i++)
{
	star[i].addEventListener('click', function()
        {
		i = this.value;

		showValue.innerHTML = i + " out of 5";
	}
                );
        
        
}

            
            
            
            
        function validate() {
            
                alert('You Have Successfully Rated The Book \nPress The Back Button To Go Back');
               ratingform.submit();
            
        }
         </script>
        
</body>
</html>