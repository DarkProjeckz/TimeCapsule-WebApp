<%
//Getting session variables from java files, redirecting to login page if direct access to this page without login
String alertmsg = null;
if(session.getAttribute("uid") == null){
	response.sendRedirect("index.jsp?name=Please login first");
}
alertmsg =(String)request.getAttribute("alert"); 

%>
<!DOCTYPE html>
<html>
<head>
	<title>Time Capsule</title>
	<link rel = "shortcut icon" href="img/title.png" />
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/scroll.css">
    <link rel="stylesheet" type="text/css" href="css/mainstyle.css">
<% String text = (String)request.getAttribute("tareaData");%>
    
    <style style="text/css">
    .center {
  margin: auto;
  
}
.sbutton{
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
.scroll-left {
 height: 50px;	
 overflow: hidden;
 position: relative;
}
.scroll-left p {
 position: absolute;
 width: 100%;
 height: 100%;
 margin: 0;
 line-height: 50px;
 text-align: center;
 /* Starting position */
 -moz-transform:translateX(100%);
 -webkit-transform:translateX(100%);	
 transform:translateX(100%);
 /* Apply animation to this element */	
 -moz-animation: scroll-left 10s linear infinite;
 -webkit-animation: scroll-left 10s linear infinite;
 animation: scroll-left 10s linear infinite;
}
/* Move it (define the animation) */
@-moz-keyframes scroll-left {
 0%   { -moz-transform: translateX(100%); }
 100% { -moz-transform: translateX(-100%); }
}
@-webkit-keyframes scroll-left {
 0%   { -webkit-transform: translateX(100%); }
 100% { -webkit-transform: translateX(-100%); }
}
@keyframes scroll-left {
 0%   { 
 -moz-transform: translateX(100%); /* Browser bug fix */
 -webkit-transform: translateX(100%); /* Browser bug fix */
 transform: translateX(100%); 		
 }
 100% { 
 -moz-transform: translateX(-100%); /* Browser bug fix */
 -webkit-transform: translateX(-100%); /* Browser bug fix */
 transform: translateX(-100%); 
 }
}
</style>

</head>

<body id="theme" class="fd scrollbar scrollbar-morpheus-den" style="border:0px inset red">
	<div class="force-overflow"></div>
<!-- Header Section -->
<div class="header" style="border:8px outset #00008B;">
  <div class="rb" style="overflow-x:none;">
  <h1 class="log bul">Time Capsule</h1>
  <p>With <b>longtime</b> memories...</p>
  </div>
</div>

<!-- Body Section -->
<div class="container-fluid">


<div class="row" style="border:8px inset #C71585;padding: 30px;background-color: #6b0f1a;
background-image: linear-gradient(315deg, #6b0f1a 0%, #b91372 74%);
">
	<!-- Left side section to display user information, data obtained from java file-->
  <div class="col-md-3">
    <h3 style="text-align:center;">Welcome <span>${data.name}</span> !!</h3>
    <hr>
    <br>
    <div class="fakeimg" style="height:60px;"><h6>Name: <span class="pl">${data.name}</span></h6></div><br>
    <div class="fakeimg" style="height:60px;"><h6>Email: <span class="pl">${data.mail}</span></h6></div><br>
    <div class="fakeimg" style="height:60px;"><h6>DOB: <span class="pl">${data.dobs}</span></h6></div><br>
    <div class="fakeimg" style="height:60px;"><h6>Contact: <span class="pl">${data.phnos}</span></h6></div><br>
    
    <div class="fakeimg" style="height:60px;"><h6>Capsuled Memories :<span class="pl">${count}</span></h6></div>
  </div>
  <div class="col-md-7">    
<!-- ------------------------------------------------------------------------------------------------------------- -->
 
 <!-- Dialog popup when unfilled fields are present. Triggered by using a button -->
 <div class="modal fade" id="giveDataAll" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">  
        <div class="modal-body" style="text-align:center;background-color: #42378f;">
          <h4>Give data to all fields <button type="button" class="close" data-dismiss="modal" style="color:white;">&times;</button></h4>
        </div>  
      </div>
    </div>
  </div>
  <!-- Button to trigger above dialog. The button is not displayed in the screen. When Add or Modify or Display button is pressed, this button os triggered using javascript given at the bottom -->
  <button data-toggle="modal" data-target="#giveDataAll" id="giveAll" style="display:none;"></button>
 
  <!-- ------------------------------------------------------------------------------------------------------------------- --> 
    <%
if(alertmsg != null)
{

%>	
<!-- Alert dialog to show message responses from java files during addition, modificationa and displaying of data -->
 
 <div class="modal fade" id="alertMsg" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">  
        <div class="modal-body" style="text-align:center;background-color: #42378f;">
        <button type="button" class="close" data-dismiss="modal" style="color:white;">&times;</button>
          <h4><%=alertmsg %> </h4>
        </div>  
      </div>
    </div>
  </div>
  <!-- Button to trigger the above dialog. This button is always triggered during page load -->
  <button data-toggle="modal" data-target="#alertMsg" id="alrtMsg" style="display:none;"></button>
 
  <!-- ------------------------------------------------------------------------------------------------------------------- --> 
<%		
}
    alertmsg = null;
%>
<!-- Middle body section to display user prompts and data display section -->
    <div class="row">
          <div class="row" style="margin: auto;margin-top: 20px;">
            <div class="col-md-3">
            <div class="form-group">
              <label>Title</label>
              <input oninput="d()" name="title" id="titl" form="form1" type="text" class="form-control" placeholder="Title" style="background: none;color:#50D8D7;border:5px outset #00008B;" required>
          </div>
          </div>
          <div class="col-md-5">
            <h1 style="color:transparent;">Magic Text</h1>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <label>Date</label>
              <input name="date" form="form1" type="date" class="form-control" placeholder="title" id="dat" style="background: none;color:#50D8D7;border:5px outset #00008B;" required>
          </div>
          </div>
          </div>         
            <div class="col-md-12" style="padding: 0px;">
              <div class="form-group">
                  <textarea oninput="d()" id="mem" name="tarea" form="form1" class="form-control scrollbar scrollbar-mean-fruit" rows="8" placeholder="Your memories.." style="background: none;resize: none;color:#50D8D7;font-size: 30px;border:5px outset #00008B;" required><%if(text!=null){%><%=text%><%}else {%><%=""%><%}%></textarea>
              </div>
          </div>   
          <form id="form1">
          
          </form>  
    </div>
  </div>
 
  
  <!-- Dialog to show credits page if info button is pressed -->
  <div class="modal fade" id="credits" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:15px 15px;background:#a9001f;">
        <h4><span class="glyphicon glyphicon-lock"></span> Info</h4>
          <button type="button" class="close" data-dismiss="modal" style="color:white;">&times;</button>
          
        </div>
        <div class="modal-body" style="padding:40px 50px;background-color: #040131;">
          <!--marquee behavior="scroll" direction="left">Usually many people have the art of maintaining Personal Diary. A personal diary is a very deep hearted self talk, expressed in words , so that the person could have their own thoughts or feelings overview , anytime in future. It is like a personal journal where you can also record your personal things like your favourite thing, food, color, transaction details or favourite country that you are yearning to visit, or the first time you did something audacious. But you should not let anyone read your diary since they can use it against you.</marquee-->
          <div class="scroll-up">
				<h4 style="text-align:justify">Usually many people have the art of maintaining Personal Diary. A personal diary is a very deep hearted self talk, expressed in words , so that the person could have their own thoughts or feelings overview , anytime in future. It is like a personal journal where you can also record your personal things like your favourite thing, food, color, transaction details or favourite country that you are yearning to visit, or the first time you did something audacious. But you should not let anyone read your diary since they can use it against you.</h4>
		</div>
        </div>
        <div style="background:#a9001f;">
        <table style="margin:auto;">
        <tr><td></td><td style="text-align:center;"><h3>Capsule Makers</h3></td><td></td></tr>
        <tr><td style="text-align:center;"><h4>Abishek</h4></td><td style="text-align:center;"><h4>Ashif</h4></td><td style="text-align:center;"><h4>Premkumar</h4></td></tr>
        </table>
      </div>
      </div>
    </div>
  </div>
 <!-- Buttons section on the right side panel for wider width screens--> 
  <div class="col-md-2">
    <div id="b">
       <div><button id="them" class="btn btn-block pl" onclick="change1(this);" data-toggle="tooltip" data-placement="top" title="Magic!"><img src="img/theme.png" style="width: 25%;"></button></div>
<hr>
      <div><button onclick="add();" class="btn btn-block pl" data-toggle="tooltip" data-placement="top" title="Add Event" ><img src="img/plus.png" style="width: 25%;"></button></div>
      
      <div><button onclick="modify();" class="btn btn-block pl" data-toggle="tooltip" data-placement="top" title="Modify"><img src="img/pencil.png" style="width: 25%;"></button></div>
  
      <div><button onclick="display();" class="btn btn-block pl" data-toggle="tooltip" data-placement="top" title="Display"><img src="img/book.png" style="width: 25%;"></button></div>
    
      <div><button data-toggle="modal" data-target="#credits" class="btn btn-block pl" data-toggle="tooltip" data-placement="top" title="Info"><img src="img/i.png" style="width: 25%;"></button></div>

      <div><button onclick="signout();" class="btn btn-block pl" data-toggle="tooltip" data-placement="top" title="Signout"><img src="img/exit.png" style="width: 20%;"></button></div>
    
    </div> 
   <!-- --------------------------------------------------------------------------------------------------- --> 
   
    
    
  </div>
<!-- Buttons section on the right side panel for smaller width screens. They are by default not displayed. If width is reduced to certain pixels, they are displayed and above button section is made invisible-->
		<input id="them1" type="image" onclick="change1(this);" src="img/theme.png" width="38" height="38" class="imgbut pl" style="margin-left:3%;"/>
		<input type="image" onclick="add();" src="img/plus.png" width="38" height="38" class="imgbut pl"/>
		<input type="image" onclick="modify();" src="img/pencil.png" width="38" height="38" class="imgbut pl"/>
		<input type="image" onclick="display();" src="img/book.png" width="38" height="38" class="imgbut pl"/>
		<input type="image" data-toggle="modal" data-target="#credits" src="img/i.png" width="38" height="38" class="imgbut pl"/>
		<input type="image" onclick="signout();" src="img/exit.png" width="38" height="38" class="imgbut pl"/>

</div>

</div>
<!-- Footer -->
<div class="footer">
  <h4>TC Team &copy;</h4>
</div>
<script type="text/javascript">
	var title = document.getElementById("titl");
	var date = document.getElementById("dat");
	var memory = document.getElementById("mem");
	//Function to fill the date in the date box near title
	function getDate() {
  var today = new Date();
  var dd = today.getDate();
  var mm = today.getMonth()+1;
  var yyyy = today.getFullYear();
  if(dd<10) { dd = '0'+dd } 
  if(mm<10) { mm = '0'+mm } 

  today = yyyy + '-' + mm + '-' + dd;
  document.getElementById("dat").value = today;
}


window.onload = function() {
  getDate();
  document.getElementById('alrtMsg').click();
  document.getElementById("mem").focus();
};
//Below 4 functions are used to change the theme of the page
  	  function change1(magicButton)
      {
        var obj = document.getElementById("theme");
        obj.classList.add("blackclass");
       // console.log(magicButton.id,magicButton);
        
        magicButton.setAttribute('onclick', 'change2(this)' );
        //document.getElementById(ev.target.id).onclick = change2;   
      }
      function change2(magicButton)
      {
        var obj = document.getElementById("theme");
        obj.classList.remove("blackclass");
        obj.classList.add("redclass");
        magicButton.setAttribute('onclick', 'change3(this)' );
    //    document.getElementById("them").onclick = change3;
      }
      function change3(magicButton)
      {
        var obj = document.getElementById("theme");
        obj.classList.remove("redclass");
        obj.classList.add("brightclass");
        magicButton.setAttribute('onclick', 'change4(this)' );
     //   document.getElementById("them").onclick = change4;
      }
      function change4(magicButton)
      {
        var obj = document.getElementById("theme");
        obj.classList.remove("brightclass");
        magicButton.setAttribute('onclick', 'change1(this)' );
      //  document.getElementById("them").onclick = change1; 
      }
      //Below function definitions are triggered during button clicks in button section
      function add(){
    	  if(title.value =="" || date.value =="" || memory.value =="")
    	  {
    		  document.getElementById('giveAll').click();
    		  return false;
    	  }
    	  else
    	  {
    		  var form1 = document.getElementById("form1");
              form1.action="main";
              form1.method="post";
              form1.target="_self";
              form1.submit();  
    	  }
      }
      function display(){
    	  if(title.value =="" || date.value =="")
    	  {
    		  document.getElementById('giveAll').click();
    		  return false;
    	  }
    	  else
    		  {
    		  var form1 = document.getElementById("form1");
              form1.action="main2";
              form1.method="post";
              form1.target="_self";
              form1.submit();
    		  }
          
      }
      function modify(){
    	  if(title.value =="" || date.value =="" || memory.value =="")
    	  {
    		  document.getElementById('giveAll').click();
    		  return false;
    	  }
    	  else
    		  {
    		  var form1 = document.getElementById("form1");
              form1.action="main3";
              form1.method="post";
              form1.target="_self";
              form1.submit();
    		  }
          
      }
      function signout()
      {
    	document.location.href="logout.jsp";  
      }
</script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>