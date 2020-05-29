<% 
//Getting returned values from Java files and storing in variables to initiate alerts
String err = null;
String signerr = null;
err = request.getParameter("name");
signerr = (String)request.getAttribute("signerr");
%>
<!DOCTYPE html>
<html>
<head>
	<title>Time Capsule</title>
	<link rel = "shortcut icon" href="img/title.png" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/css/mdb.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/styling.css">
</head>
<body>
	
<!-- div class="modal fade" id="alertMsg" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">  
        <div class="modal-body" style="text-align:center;background-color: #42378f;">
        <button type="button" class="close" data-dismiss="modal" style="color:white;">&times;</button>
          <h4>Download app </h4>
        </div>  
      </div>
    </div>
  </div>
  <!-- Button to trigger the above dialog. This button is always triggered during page load>
  <button data-toggle="modal" data-target="#alertMsg" id="alrtMsg" style="display:none;"></button-->
<!--index page time capsule animation using SVG-->
<svg viewBox="0 0 1800 600">

  <symbol id="s-text">
    <text text-anchor="middle"
          x="50%"
          y="45%"
          class="webcoderskull"
          >
      Time Capsule
    </text>
    <text text-anchor="middle"
          x="50%"
          y="78%"
          class="text--line"
          >
    </text>
    
  </symbol>
  
  <g class="g-ants">
    <use xlink:href="#s-text"
      class="webcoderskull-1"></use>     
    <use xlink:href="#s-text"
      class="webcoderskull-1"></use>     
    <use xlink:href="#s-text"
      class="webcoderskull-1"></use>     
    <use xlink:href="#s-text"
      class="webcoderskull-1"></use>     
    <use xlink:href="#s-text"
      class="webcoderskull-1"></use>     
  </g>
  
  
</svg>
<div  style="position:fixed;bottom:5%;width:100%;margin:auto;display: flex; justify-content: center;">
  
   
      <button id="but1" type="button" class="animated bounceInLeft btn btn-dark btn-xl" data-toggle="modal" data-target="#myModal" >Login</button>
 	<div style="width:10%;"></div>
    <!-- Button for triggering signup dialog -->
      <button id="but2" type="button" class="animated bounceInRight btn btn-dark btn-xl" data-toggle="modal" data-target="#signup" >Signup</button>

  </div> 
<div class="container">

<%
if(err!=null)
{ %>
<!-- Showing alert message if direct access to Main page without login -->
    <div class="alert alert-danger alert-dismissible" role="alert" style="text-align:center;">
			<strong><%=err %></strong> 
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true" style="color:black;">&times;</span>
			</button>
		</div>
<%
}
%>
<%
if(signerr!=null)
{ 
	if(signerr == "Signed up successfully")
	{%>
	<!-- Showing blue alert message for successful signup -->
	<div class="alert alert-success alert-dismissible" role="alert" style="text-align:center;">
  <%}
	else
	{%>
	<!-- Showing red alert message for invalid login, invalid data during signup -->
		<div class="alert alert-danger alert-dismissible" role="alert" style="text-align:center;">
  <%}%>
			<strong><%=signerr %></strong> 
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true" style="color:black;">&times;</span>
			</button>
		</div>
<%
}
%>
	<div class="message" id="close_icon" style="display:none;padding:1%;background:#09203F;z-index: 35;position: absolute; top:0; left:0px">
		<a style="font-weight:900;" href="https://timcap-app.herokuapp.com"><b>Download our app </b></a>
		 <i style="margin-left:7px;" class="close icon"></i>
	</div>
  <!-- Dialog popup when user clicks login button -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header" style="padding:15px 15px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;background: -webkit-linear-gradient(-90deg, #A71D31, #3F0D12);">
          
          <!--Form for login-->
          <form class="form-container" action="login" method="POST">
                
              <div class="form-group">
                <label for="uname">Username</label>
                <input type="text" class="form-control"  name="uname" id="usrname" aria-describedby="emailHelp" required>
              </div>
             <div class="form-group">
                <label for="pass">Password</label>
                <input type="password" class="form-control" name="pass" id="passwrrd" required>
              </div>
				<br>
              <button type="submit" class="btn btn-danger btn-block">Login</button>
              
        </form>
        </div>
        
      </div>
      
    </div>
  </div> 


<!-- Dialog popup when user clicks signup button -->
  <div class="modal fade" id="signup" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header" style="padding:15px 15px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Signup</h4>
        </div>
        <div class="modal-body" style="padding:40px 70px;background: -webkit-linear-gradient(-90deg, #A71D31, #3F0D12);">
          <div class="row justify-content-center">
         <!--Form for signup-->
          <form class="form-container" action="signup" method="POST">
            <div class="form-group">
              <label>Username</label>
              <input type="text" class="form-control" id="uname" value="${fetch.name}" name="usname" required>
            </div>
             
            <div class="form-group">
              <label>Password</label>
              <input type="password" class="form-control" id="pass" name="passw" required>
            </div>
            
            <div class="form-group">
              <label>Confirm Password</label> 
              <input type="password" class="form-control" id="cpass" name="cpassw" required>
            </div>
            
            <div class="form-group">
              <label>Email</label> 
              <input type="email" class="form-control" value="${fetch.mail }" id="mail" name="mail" required>
            </div>
            
            <div class="form-group">
              <label>DOB</label> 
              <input type="date" class="form-control" value="${fetch.dob}" id="dob" name="dob" required>
            </div>
            
            <div class="form-group">
              <label>Mobile Number</label> 
              <input type="number" class="form-control" value="${fetch.mob}" id="mob" name="mob" required>
            </div>
           
            <div class="form-group">
              <label for="gen">Gender</label>
              <select class="form-control" id="gen" name="gen" style="background: none;color:black;" required>
                <option value="" selected disabled hidden>Select an Option</option> 
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="others">Others</option>
              </select>
            </div>
          <button type="submit" class="btn btn-danger btn-block">Signup</button>
        </form>
        </div>
        </div>
        
      </div>
      
    </div>
  </div>
</div>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.10.1/js/mdb.min.js"></script>
	<script>
		$("#close_icon").on('click', function() {
			$(".message" ).remove();
			  });
	</script>
</body>
</html>
