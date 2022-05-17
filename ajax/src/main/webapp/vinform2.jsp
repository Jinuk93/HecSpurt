<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

window.onload = function() {
  var request = new XMLHttpRequest();
  request.onreadystatechange = function() {
	  if(request.readyState == 4 && request.status ==200) {
		  var json = JSON.parse(request.responseText); //구 버전의 익스플로러인 경우 사용불가
		  var output = '';
		  for(var i = 0; i<json.data.length; i++) {
			  output += '<p>'+i+':';
			  
			  for(var key in json.data[i]) {
				  console.log(json.data[i]["continent_nm"]);
				  
					
				  //output += json.data[i][key] + '&nbsp&nbsp';
			  }
			  output += '</p>'
		  }
		  	  document.body.innerHTML += output;
	  }
  }
  		  request.open("get", "https://apis.data.go.kr/1262000/TravelAlarmService2/getTravelAlarmList2?serviceKey=lFAoMQmxZFZcYvnzr%2BbSADu%2F1FINMPszY6dLnapouBt8NMIc%2FqUmeGqHJz8qMK1nHZDcYDzu9Ieqy4l0H15E7g%3D%3D&returnType=JSON&numOfRows=10&pageNo=1", true);
  		  request.send();
  };
 </script>

</head>
<body>
   
</body>
</html>