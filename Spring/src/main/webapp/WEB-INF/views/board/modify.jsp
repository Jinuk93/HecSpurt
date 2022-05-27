<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Read Page</h1>
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
	                    <form role="form" action="/board/modify" method="post">
                        <div class="panel-body">
							<div class="form group">
								<label>Bno</label>
								<input class="form-control" name="bno" 
								value='<c:out value="${board.bno}"/>'  readonly="readonly">
								<label>Title</label>
								<input class="form-control" name="title" 
								value='<c:out value="${board.title}"/>'  >
								<label>Content</label>
								<input class="form-control" name="content" 
								value='<c:out value="${board.content}"/>'  >
								<label>Writer</label>
								<input class="form-control" name="writer" 
								value='<c:out value="${board.writer}"/>'  > 
								<label>RegDate</label>
								<input class="form-control" name="regData" 
								value='<fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/>' readonly="readonly"  > 
								<label>UpdateDate</label>
								<input class="form-control" name="updataData" 
								value='<fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd"/>' readonly="readonly"  > 
							</div> 
                        </div><!-- /.panel-body -->
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
				<button type="submit" data-oper="modify" class="btn btn-info">Modify</button>
							<button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
							<button type="submit" data-oper="list" class="btn btn-success">List</button>
						</form>                       
                    </div><!-- /.panel -->
                </div><!-- /.col-lg-6 -->
            </div><!-- /.row -->
            
            
            
            
            
            
            
            
            
            
            
<script>


	$(document).ready(function(){
		
		
		//게시물 조회 할 때 파일 관련 자료를 json으로 만들어서 회신 
		var bno = '<c:out value="${board.bno}"/>';
		$.getJSON("/board/getAttachList",{bno:bno}, 
		function(arr){
			console.log(arr);
			showUploadedFile(arr);
		});//end getJSON
		
		var formObj = $("form");
		$('button').on("click", function(e){
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			if(operation === 'remove'){
				formObj.attr("action","/board/remove");
			}else if(operation === 'list') {
				//move to list
				self.location = "/board/list";
				return;
			}else{
				//첨부 파일 수정 로직 
				var str="";
				$(".uploadResult ul li").each(function(i, obj){ //제이쿼리 반복
						var jobj = $(obj);
						console.dir("job////:"+jobj);
						str +="<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
						str +="<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
						str +="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
						str +="<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
						console.dir("/////str"+str);	
				});
					formObj.append(str).submit();
			}//end else
		});//end button on click
	});//end document
		
		/*첨부 파일 관련 로직*/
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
		
		
</script>
 <%@include file="../includes/footer.jsp" %>       