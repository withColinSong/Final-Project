<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일</title>

<!-- bootstrap CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">


<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 이메일 CSS -->
<link rel="stylesheet" href="/css/email/email_result.css">

<!-- js -->
<script src="js/email/email_commons.js"></script>

</head>
<body>
	<!-- 그룹웨어 GNB 헤더-->

	<header>
		<jsp:include page="/WEB-INF/jsp/MainPage/header.jsp"></jsp:include>
	 </header>
	 <!-- 그룹웨어 GNB code 끝 -->
	 
	<section class="e-approval-container">
		
		<!-- e-approval-lnb code -->
			<nav class="e-approval-lnb"> 
				<div class="e-approval-lnb-content">
					<h3>메일</h3>
					<div class="e-approval-form-btn">
						<input type="button" class="btn btn-primary btn-lg" value="메일쓰기" onclick="location.href='email_write.jsp'">
					</div>
					<div class="e-approval-approval-list">
						<span>메일함</span>
					<!-- 사이드바 링크 jsp page -->
					<jsp:include page="commonsCode/emailSidebarLink.jsp"></jsp:include>
					</div>
					<div class="e-approval-approval-list">
						<span class="sendmail-align">
						<span>내 메일함</span>
						<button type="button" style="font-size: 5px; line-height: 13px;" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#moveEmailContents">+</button>
						</span>
						
					<!-- 사이드바 링크 jsp page -->
					<jsp:include page="commonsCode/emailSideBarLinkMy.jsp"></jsp:include>
					</div>
				</div>
			</nav>
	<!-- lnb code 끝 -->
	
	<!-- 모달창 모음 -->
		<!-- 1. 내 메일함 추가 모달창 -->
	                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" id="moveEmailContents" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content modalEmail">
	                        <div class="modalNewEmailFolder">
	                            <h4>새 메일함 만들기</h4>
	                            <input type="text" placeholder="메일함 이름">
	                            <div class="modalNewEmailFolderBtn">
	                                <button class="btn btn-primary btn-lg btn-primary btn-sm" role="button">만들기</button>
	                                <button class="btn btn-primary btn-lg btn-primary btn-sm" role="button">취소하기</button>
	                            </div>
	                        </div>
	                        
	                    </div>
	                </div>  
	                </div>
	                
     <!-- 모달창 모음 끝 -->           
                
		<main class="e-approval-article">

		
			<!-- 메일 검색바 code -->
			<div class="e-approval-search-bar">
				<h2>메일이 정상적으로 전송되었습니다.</h2>
				<form>
				  <div class="form-group row">
				    <label for="staticEmail" class="col-sm-2 col-form-label">보낸 사람</label>
				    <div class="col-sm-10">
				      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${EmailMainVo.emailName }">
				    </div>
				  
				  	<label for="staticEmail" class="col-sm-2 col-form-label">제목</label>
				    <div class="col-sm-10">
				      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${EmailMainVo.emailTitle }">
				    </div>
				  </div>
				  
		 		 <div class="form-group btnAlign">
				    <button type="button" id="goRevMailBtn" class="btn btn-primary result-check-Btn">확인</button>
				    <button type="submit" class="btn btn-primary result-check-Btn">메일보기</button>
				  </div>
				</form>
	      </div>	
					  
					  
				
			
			<!-- ========== -->

		</main>
	</section>
	

<!-- bootstrap script, Jquery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
<!-- ****************************** -->
<script>
goRevMainBtn();
</script>

</body>
</html>