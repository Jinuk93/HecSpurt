<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   var request;
   function sendInfo(){
      var v = document.vinform.t1.value;
      var url = "vinform_e.jsp?val=" + v;
      //console.log(v);
      if(window.XMLHttpRequest){
         request = new XMLHttpRequest();
      }else if(window.ActiveXObject){
         request = new ActiveXObject("Microsoft.XMLHTTP");
      }
      console.log(request);
      try {
         request.onreadystatechange = getInfo;
         request.open("GET", url, true); // true -> async
         request.send();
      }catch (e){
         alert("Unable to connect to server");
      }
   }
   function getInfo(){
      if(request.readyState == 4){
         var val = request.responseText;
         document.getElementById('info').innerHTML = val;
      }
   }
</script>

</head>
<body>
   <marquee>
      <h1>This is an example of ajax</h1>
   </marquee>
   <form name="vinform">
      <input type="text" name="t1" onkeyup="sendInfo()"/>
      <!-- <input type="button" value="ShowTable" onClick="sendInfo()" /> -->
   </form>
   <span id="info"></span>
</body>
</html>