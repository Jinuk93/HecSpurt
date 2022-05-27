<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<script src="../../resources/js/reply.js"></script>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Read Page</h1>
	</div><!-- /.col-lg-12 -->
</div><!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<!--조회 -->
				<div class="form group">
					<label>Bno</label> 
					<input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
					<label>Title</label> 
					<input class="form-control" name="title" value='<c:out value="${board.title}"/>' readonly="readonly">
					<label>Content</label> 
					<input class="form-control" name="content" value='<c:out value="${board.content}"/>' readonly="readonly">
					<label>Writer</label> 
					<input class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly">
				</div>
			</div>
			<!-- /.panel-body -->
			<button data-oper='modify' class='btn btn-default'
				onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'">Modify</button>
			<button id="listBtn" type="button" data-oper="list"
				class="btn btn-info">List</button>
		</div>
		<!-- /.panel -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Reply
				<button id="addReplyBtn" type="button">NewReply</button>
			</div>
			<div class="panel-body">
				<ul class="chat">
					<li class="left clearfix" data-rno="12">
						<div>
							<div class="header">
								<strong class="primary-font">user00</strong> <small
									class="pull-right text-muted">2021-05-18 13:13</small>
							</div>
							<p>Good job</p>
						</div>
					</li>
				</ul>
			</div>
		</div><!-- /.reply panel -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModallabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">REPLY title</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Reply</label> <input class="form-control" name='reply'
								value='New Reply!!!'>
						</div>
						<div class="form-group">
							<label>Replyer</label> <input class="form-control" name='replyer'
								value='New Replyer!!!'>
						</div>
						<div class="form-group">
							<label> ReplyDate</label> <input class="form-control"
								name='replyDate' value='New ReplyDate!!!'>
						</div>
					</div>
					<div class="modal-footer">
						<button id='modalModBtn' type="button" class="btn btn-info">Modify</button>
						<button id='modalRemoveBtn' type="button" class="btn btn-info">Remove</button>
						<button id='modalRegisterBtn' type="button" class="btn btn-info">Register</button>
						<button id='modalCloseBtn' type="button" class="btn btn-info">Close</button>
					</div>
				</div>
			</div>
			</div><!-- moadl content -->
				<div class="panel panel-info">
					<div class="panel-heading">Attached File List</div>
					<div class="panel-body">
						<div class="form-group uploadResult">
							<ul></ul>
						</div>
						<div class="bigPictureWrapper">
							<div class="bigPicture"></div>
						</div>
					</div>
				</div>
			</div><!-- /.col-lg-6 -->
		</div><!-- /.row -->



<script type="text/javascript">

	//리스트 버튼 처리
	$("#listBtn").on("click",() => {
		self.location = "/board/list";
	});
	
	var bnoValue = '<c:out value="${board.bno}"/>';

	//댓글 목록의 이벤트 처리
	var replyUL = $(".chat");
	showList(1);
	function showList(page){
		replyService.getList(
			{bno:bnoValue, page:page||1},
			function(list){
				var str="";
				if(list == null || list.length==0){
					replyUL.html("");
					return;
				}
				for(var i=0, len=list.length || 0; i<len; i++){
					str +="<li class='left clearfix' data-rno='" +list[i].rno+"'>";
					str +="<div><div class='header'><strong class='primary-font'>"
					+list[i].replyer+"</strong>";
					str +="<small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate)+"</small><div>";
					str +="<p>" + list[i].reply + "</p><div></li>";
				}
			replyUL.html(str);
			}//function call
		);
	}//showList
	
	
	//모달창 출
	var modal = $(".modal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	$("#addReplyBtn").on("click", function (e) {
		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id!='modalCloseBtn']").hide();
		modalRegisterBtn.show();
		$(".modal").modal("show");
	});
	
	//새로운 댓글 처리
	modalRegisterBtn.on("click", function(e){
		var reply={
				reply:modalInputReply.val(),
				replyer:modalInputReplyer.val(),
				bno:bnoValue
		}; 
		replyService.add(reply, function(result){
			alert(result);//댓글 등록이 정상임을 팝업으로 알림
			modal.find("input").val(""); //댓글 등록이 정상적으로 이뤄지면, 내용을 지움
			$(".modal").modal("hide"); //모달창 닫음
		});
	});
	
	//특정 댓글의 클릭 이벤트 
	$(".chat").on("click", "li", function(e){
		var rno = $(this).data("rno");
		console.log(rno, function(reply){
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
			modal.data("rno", reply.rno);
		});
		
		$(".modal").fild("button[id!='modalCloseBtn']").hide();
		modalModBtn.show();
		modalRemoveBtn.show();
		$(".modal").modal("show");
	})
	
	//댓글의 수정//삭제 처리 이벤트
	modalModBtn.on("click", function(e){
		var reply = {rno:modal.data("rno"), reply:modalInputReply.val()};
		replyService.update(reply, function(result){
			modal.modal("hide");
			showList(1);
		});
	});
	modalRemoveBtn.on("click", function(e){
		var rno = modal.data("rno");
		replyService.remove(rno, function(result){
			modal.modal("hide");
			kshowList(1)
		});
	});
	
	//게시물 조회 할 때 파일 관련 자료를 json으로 만들어서 회신 
	var bno = '<c:out value="${board.bno}"/>';
	$.getJSON("/board/getAttachList",{bno:bno}, 
	function(arr){
		console.log(arr);
		showUploadedFile(arr);
	});//end getJSON
	
	
	//Attached File List 띄우기 
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
	
	
	//이미지를 클릭하면 크게 보여주도록 이벤트처리
	function showImage(fileCallPath){
		//alert(fileCallPath)
		$(".bigPictureWrapper").css("display","flex").show();
		$(".bigPicture")
		.html("<img src='/display?fileName="+encodeURI(fileCallPath)+"'>")
		.animate({width:'100%',height:'100%'}, 1000);
		
		//이미지를 다시 클릭하면 사라지도록 이벤트 처리
		$(".bigPictureWrapper").on("click", function(e){
			$(".bigPicture").animate({sidth: '0%', height:'0%'}, 1000);
			setTimeout(function(){
				$('.bigPictureWrapper').hide();
			},1000);
		});  //end bigPictureWrapper click
		
	}//end showImage
	
	

	
	
	
	
	//reply module
/* 	console.log(replyService);
	
	replyService.add(
		{reply: "JS TEST", replyer:"js tester", bno:bnoValue }, //댓글 데이터
		function(result) {
			alert("RESULT : " + result);
		}
	); */
	
	
/*  	replyService.getList(
		{bno: bnoValue, page:1},
		function(list){
			list.forEach(function(item){
				console.log(item);
			});
		}
	); */
	
	
/*  	replyService.remove(
		6,
		function(count){
			console.log(count);
			if(count ==="success"){
				alert("REMOVED");
			}
		},
		function(err){
			alert('error occurred...');
		}
	); */
	
/* 	replyService.update({
		rno:3,
		bno:bnoValue,
		reply:"modified reply...",
		replyer:"modified repler..."
		},
		function(result){
			alert("수정완료");
	});
	
	replyService.get(4,function(data){
		console.log(data);
	}) */

</script>


<%@include file="../includes/footer.jsp"%>
