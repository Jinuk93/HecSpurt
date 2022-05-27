

	console.log("ReplyModule....")
	var replyService=(function(){
		//return{name:"AAA"};//replyService라는 변수에 name이라는 속성, 'AAA'라는 값을 가진 객체 할당
		
		function add(reply, callback, error){
			console.log("reply...");
			$.ajax({
				type:'post',
				url:'/replies/new',
				data : JSON.stringify(reply),
				contentType : "application/json;charset=urt-8",
				success: function(result, status, xhr){
					if(callback){
						callback(result);
					}
				},
				errodr:function(xhr, status ,er){
					if(error){
						error(er); 
					}
				}
			})
		}//add
		
		
		//특정댓글 조회 
		function get(rno, callback, error) {
			$.get("/replies/" + rno + ".json", function(result){
				if(callback){ callback(result);}
			}).fail(function(xhr,status,err){
				if(error){error();}
			});
		}//get

		//전체댓글 조회
		function getList(param, callback, error) {
			var bno = param.bno;
			var page = param.page||1;
			$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
				function(data){
					if(callback){ 
						callback(data);
					}
				}
			).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}//getList
		
		
		function update(reply, callback, error) {
			$.ajax({
				type:'put',
				url: '/replies/' + reply.rno,
				data: JSON.stringify(reply),
				contentType: "application/json; charset=utf-8",
				success:function(result, status, xhr){
					if(callback) {
						callback(result);
					}
				},
				error:function(xhr, status, er){
					if(error) {error(er);}
				}
			});
		}//update
				
		function remove(rno, callback, error) {
			$.ajax({
				type:'delete',
				url:'/replies/' + rno,
				success:function(deleteResult, status, xhr) {
					if(callback) {
						callback(deleteResult);
					}
				},
				error:function(xhr, status, er){
					if(error){ 
						error(er);
					}
				}
			});
		}//remove
		
		//시간 처리
		function displayTime(timeValue) {
			var today = new Date();
			var gap = today.getTime() - timeValue;
			var dateObj = new Date(timeValue);
			var str ="";
			if(gap<(1000*60*60*24)){
				var hh = dateObj.getHours(); 
				var mi = dateObj.getMinutes();
				var ss = dateObj.getSeconds();
				return [ (hh>9?'':'0')+hh,':',(mi>9?'':'0')+mi,':',(ss>9?'':'0')+ss].join('');
			}else{
				var yy = dateObj.getFullYear(); 
				var mm = dateObj.getMonth()+1;
				var dd = dateObj.getDate();
				return [yy,'/',(mm>9?'':'0')+mm,'/',(dd>9?'':'0')+dd].join('');
			}
		}//displayTime
		
		return{
			add:add,
			get:get,
			getList:getList,
			remove:remove,
			update:update,
			displayTime:displayTime
		}
	})();
