<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Register</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Register
                        </div><!-- /.panel-heading -->
                        <div class="panel-body">
                           	<form role="form" action="/board/register" method="post">
                           		<div class="form-group">
                           			<label>Title</label><input class="form-control" name="title">
                           		</div>
                           		<div class="form-group">
                           			<label>Content</label><input class="form-control" name="content" rows="3">
                           		</div>
                        			<div class="form-group">
                           			<label>Writer</label><input class="form-control" name="writer">
                           		</div>
                           		<button type="submit" class = "btn btn-default">Submit</button>
                           		<button type="reset" class = "btn btn-default">Reset</button>
                           	</form>                         
                        </div> <!-- /.panel-body -->
                    </div><!-- /.panel -->
				<div class="panel panel-info">
					<div class="panel-heading">File Attach</div>
						<div class="panel-body">
							<div class="form-group uploadDiv">
								<input type="file" name='uploadFile' multiple>
							</div>
						
							<div class="form-group uploadResult">
								<ul></ul>
							</div>
							
							<div class="bigPictureWrapper">
								<div class="bigPicture"></div>
							</div>
						</div>
					</div>	
                </div><!-- /.col-lg-12 -->
            </div><!-- /.row -->
            
            
	<script>
		var formObj=$("form[role='form']");
		
		$("button[type='submit']").on("click", function(e){
			e.preventDefault();
			console.log("submit clicked");
		});//sumbit button event;
		

		
		
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
			/* 		if(!obj.fileType){
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
					} */
       			   if(!obj.fileType){
       				   var fileCallPath  = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
       				   str +="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";
       				   str +="<span>"+obj.fileName+"</span>";
       				   str +="<button type='button' data-file=\'"+fileCallPath+"\' data-type='file'  class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
       				   str +="<img src='/resources/images/attach.png'></a>"
       				   str +="</div></li>";
       				}else{
       				   var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
       				   str +="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";
       				   str +="<span>"+obj.fileName+"</span>";
       				   str +="<button type='button' data-file=\'"+fileCallPath+"\' data-type='image'  class='btn btn-warning btn-circle'> <i class='fa fa-times'></i></button><br>";
       				   str +="<img src='/display?fileName="+fileCallPath+"'>"; 
       				   str +="</div></li>";
       				}
				});
				uploadResult.append(str);
			}//end showUploadedFile
		
			
			//화면에서 삭제 기능
			$(".uploadResult").on("click","button", function(e){
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				var targetLi = $(this).closest("li")
				//console.log(targetFile);
				$.ajax({
					url : '/deleteFile',
					data : {fileName:targetFile, type:type},
					dataType : 'text',
					type : 'post',
					success : function(result){
						alert(result);
						targetLi.remove();
					}
				}); //end $ajax
			})//end $(".uploadResult")
			
			$("input[type='file']").change(function(e){
				//파일 업로드 코드
				//업로든 버트 클릭 시
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
			});//end change
			
			$("button[type='submit']").on("click",function(e){
				e.preventDefault();
				console.log("submit clicked");
				var str=""
				$(".uploadResult ul li").each(function(i, obj){ //제이쿼리 반복
					var jobj = $(obj);
					console.dir(jobj);
					str +="<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					str +="<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					str +="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					str +="<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
				});
				formObj.append(str).submit();
			});//submit button event
	</script>
	
	
            
 <%@include file="../includes/footer.jsp" %>       