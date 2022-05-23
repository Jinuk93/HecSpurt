<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board List Page</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          <h3> ${board.bno }번 게시글</h3>
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                                <div class = "form-group">
                                	<label>Title</label><input class = "form-control" name = 'title' value = '<c:out value = "${board.title }"/>'readonly = "readonly">
                                </div>
                                
                                <div class = "form-group">
                                	<label>Content</label><input class = "form-control" rows = "10" name = 'content' value = '<c:out value = "${board.content }"/>' readonly = "readonly"></input>
                                </div>
                                
                                <div class = "form-group">
                                	<label>Writer</label><input class = "form-control" name = 'writer' value = '<c:out value = "${board.writer }"/>' readonly = "readonly">
                                </div>
                                
                                <button class ="btn btn-danger" onclick = 'location.href="/board/modify?bno=<c:out value = "${board.bno }"/>"'>Modify</button>
								<button type = "submit" class ="btn btn-success" id = "toList">List</button>
								
                            <!-- /.table-responsive -->
                          
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
            
<script>
$("#toList").on("click",() => {
	self.location = "/board/list";
});
/* $("#toModify").on("click",() => {
	self.location = "/board/modify";
}); */
</script>
 <%@include file="../includes/footer.jsp" %>       