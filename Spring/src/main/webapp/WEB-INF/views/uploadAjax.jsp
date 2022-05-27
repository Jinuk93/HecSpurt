<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	
	<button id="uploadBtn">Upload</button>
	
	<div class="uploadResult">
		showUploadedFile
		<ul></ul>
	</div>
	
	<div class="bigPictureWrapper">
		<div class="bigPicture"></div>
	</div>
	
	
	
	<script type="text/javascript"> 
	
		//이미지를 클릭하면 크게 보여주도록 이벤트처리
		function showImage(fileCallPath){
			//alert(fileCallPath)
			$(".bigPictureWrapper").css("display","flex").show();
			$(".bigPicture")
			.html("<img src='/display?fileName="+encodeURI(fileCallPath)+"'>")
			.animate({width:'100%',height:'100%'}, 1000);
		}//end showImage
		
		
		//이미지를 다시 클릭하면 사라지도록 이벤트 처리
		$(".bigPictureWrapper").on("click", function(e){
			$(".bigPicture").animate({sidth: '0%', height:'0%'}, 1000);
			setTimeout(function(){
				$('.bigPictureWrapper').hide();
			},1000);
		}); //end bigPictureWrapper click

		
		$(document).ready(function(){
			
			//파일의 확장자나 크기 사전처리
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880;
			function checkExtension(fileName, fileSize){
				if(fileSize>=maxSize){
					alert("파일 크기 초과");
					return false;
				}
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드 할 수 없음");
					return false;
				}
				return true;
			}//end checkExtension
			
			
			//업로드된 이미지 처리
			function showUploadedFile(uploadResultArr){
				var uploadResult = $(".uploadResult ul");
				var str="";
				$(uploadResultArr).each(function(i, obj){
					if(!obj.fileType){
						//1.이미지가 아닌 경우
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
						str += "<li><a href='/download?fileName="+fileCallPath+"'>"
						+"<img src='/resources/images/attach.png'>"+obj.fileName+"</a>"
						+"<span data-file=\'"+fileCallPath+"\'data-type='file'>x</span></div></li>";
					}else{
						//2.이미지인 경우
						//str +="<li>"+obj.fileName+"</li>";\
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
						console.log("fileCallPath"+fileCallPath);
						var originPath = obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName;
						originPath = originPath.replace(new RegExp(/\\/g),"/"); //폴더 구분자인 경우 "/"로 통일
						str += "<li><a href=\"javascript:showImage(\'" + originPath + "\')\"><img src='/display?fileName=" + fileCallPath + "'></a>"
								+"<span data-file=\'"+fileCallPath+"\'data-type='image'>x</span></div></li>";
					}
				});
				uploadResult.append(str);
			}//end showUploadedFile
			
			//업로든 버트 클릭 시
			$("#uploadBtn").on("click", function(e){
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				var cloneObj=$(".uploadDiv").clone();
				console.log(files);
				
				for(var i=0; i<files.length; i++){ 
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					formData.append("uploadFile", files[i])
				}
				console.log("files.length : " + files.length);
				$.ajax({
					url : '/uploadAjaxAction',
					processData : false, //전달할 데이터를 query string으로 만들지 말것
					contentType : false,
					data : formData, //전달할 데이터
					type : 'POST',
					success: function(result) {
						alert('Uploaded');
						console.log("result" + result);
						showUploadedFile(result);
						$(".uploadDiv").html(cloneObj.html());
					}
				}); //end $ajax
			}); //end $("#uploadBtn")
			
			
			//화면에서 삭제 기능
			$(".uploadResult").on("click","span", function(e){
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				console.log(targetFile);
				$.ajax({
					url : '/deleteFile',
					data : {fileName:targetFile, type:type},
					dataType : 'text',
					type : 'post',
					success : function(result){alert(result);}
				}); //end $ajax
			})//end $(".uploadResult")
			
			
		});//end document
	</script>
</body>
</html>