<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
 <div class="modal fade bs-example-modal-lg"  id="spamEmailRev" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	   <div class="modal-dialog modal-lg">
	       <div class="modal-content modalSpamEmail">
	           <div class="modalSpamEmailFolder">
	               <h4>스팸 차단</h4>
	               <p>선택한 메일의 정보를 차단 정보로 등록하고, 해당 정보로 오는 메일은 앞으로 받지 않고 자동 반송합니다.</p>
	               <br>
	               <div class="modalSpamEmailFolderBtn">
	                   <button onclick="spamSelect()" class="btn btn-primary btn-lg btn-primary btn-sm" role="button">차단하기</button>
	                   <button class="btn btn-primary btn-lg btn-primary btn-sm" role="button">취소하기</button>
	               </div>
	           </div>
	       </div>
	   </div>  
  </div>
  <script>
  var spamSelect = function() {

		var valueArr = new Array();
		var list = $('input:checkbox[name=chkBox]')
		
		for(var i=0; i<list.length; i++) {
			if(list[i].checked) {
				valueArr.push(list[i].value)
			};
			
		}
		
		var frm = document.emailForm;
		var deleteList = frm.deleteBtnList;
		deleteList.value = valueArr;
		
		frm.action = "/emailSpamSelect"
		frm.submit();
		
	}
  </script>