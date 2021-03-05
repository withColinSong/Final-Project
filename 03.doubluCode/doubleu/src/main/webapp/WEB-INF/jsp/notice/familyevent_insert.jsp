<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전사게시판-경조사 insert</title>

<!-- awesome font CDN(W icon) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

<!-- favicon -->
<link rel="shortcut icon" href="../images/w_icon.ico">
<link rel="icon" href="w_icon.ico">

<!-- bootstrap CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<!-- bootstrap script, Jquery CDN -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<!-- ****************************** -->	

<!-- main page CSS -->
<link rel="stylesheet" href="/css/MainIndex.css">
<!-- 게시판 CSS -->
<link rel="stylesheet" href="/css/notice/notice.css">
<!-- 게시판 JS -->
<script src='/js/notice/notice.js'></script>

</head>
<body>

	<!-- 그룹웨어 GNB -->
	<header class="container-fluid main-gnb">
		<jsp:include page="../MainPage/header.jsp"/>
	 </header>
	<!-- 그룹웨어 GNB code 끝 -->

	<section class="e-approval-container">
	
		<!-- e-approval-lnb code -->
		<jsp:include page="side_menu.jsp"/>
		<!-- lnb code 끝 -->

		<main class="e-approval-article">

				<!-- 게시판 검색바 code -->
				<div class="e-approval-search-bar">
					<form class="e-approval-search-form" action="" name="noticeForm" method="post">
						<div class="e-approval-form-box">
							<span>경조사</span>
						</div>
					</form>
				</div>

			
			<!-- 경조사 글쓰기 code -->
<% Date nowTime = new Date();
   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); %>
   			
			<form action="/familyeventInsertR" method="post" id="familyeventInsertForm" enctype="multipart/form-data">
				<div class="row">
			    <div class="col-xs-1 col-md-1"></div>
			    <div class="col-xs-8 col-md-10">
				    <div class="table table-responsive">
				        <table class="table">
				        <tr>
				        	<th class="success"><label for="exampleFormControlSelect1">제목</label></th>
			    			<td colspan="3"><input type="text" class="form-control" id="exampleFormControlSelect1" placeholder="제목을 입력하세요." name="familyeventSubject"></td>
				        </tr>
				        <tr>
				        	<div class="form-group">
				            <th class="success">작성자</th>
				            <td><input type="text" id="mid" name="familyeventMid" value="관리자" readonly></td>
				            <th class="success">작성일</th>
				            <td><input type="date" id="mdate" name="familyeventReportingDate" value="<%= format.format(nowTime) %>" readonly></td>
				            </div>
				        </tr>
				        <tr>
				            <th class="success"><label for="exampleFormControlSelect4">분류</label></th>
				            <td>
					            <select class="form-control" id="exampleFormControlSelect4" name="familyeventType">
							      <option id="결혼"> 결혼</option>
							      <option> 부고</option>
				   				</select>
				            </td>
				            <th></th>
				            <td></td>
<!-- 				            <th class="success">조회수</th>
				            <td><input type="number" id="hit" name="familyeventHit" value="1" readonly></td> -->
				        </tr>
<!-- 				        <tr>
				        	<th><label for="exampleFormControlSelect5"></label>게시기간</th>
				        	<td colspan="3" style="padding-left:8px;">
							    <div class="dropdown-align">
									<label for="familyeventPostType"></label>
										<input type="radio" name="familyeventPostType" value="영구" id="r1" checked><label for="r1">영구 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<input type="radio" name="familyeventPostType" value="설정" id="r2"><label for="r2">설정  &nbsp;&nbsp;</label>
										
											(시작일자 &nbsp;<input type="date" id="searchDateOne" name="familyeventPostStartDate" readOnly>
											&nbsp;~ &nbsp;
											종료일자 &nbsp;<input type="date" id="searchDateTwo" name="familyeventPostEndDate" readOnly> )

								</div>
							</td>
				        </tr>  -->
				        <tr>
				        	<div class="form-group">
					            <th class="success"><label for="exampleFormControlTextarea1">내용</label></th>
					            <td colspan="3">
					            <textarea class="form-control" id="exampleFormControlTextarea1" rows="15" placeholder="내용을 입력하세요." name="familyeventDoc"></textarea>
					            </td>
						  	</div>
				        </tr>
				        <tr style="border-color: #ffffff;">
				        	<th class="success">첨부파일</th>
				        	<td colspan="3">
				        		<div class="custom-file mb-3">
									<input type="file" class="custom-file-input" id="validatedCustomFile" name="familyeventFile" multiple="multiple">
				    				<label class="custom-file-label" for="validatedCustomFile">파일을 선택하세요.</label>
			    					<div class="invalid-feedback">Example invalid custom file feedback</div>
			  					</div>
				        	</td>
				        </tr>
				        <tr>
				        	<td style="border:none"></td>
				        	<td colspan="3" style="border:none">
							
				        	</td>
				        </tr>
				        <tr>
				            <td colspan="4" class="text-center">
								<!-- <input type="button" class="btn btn-primary" id="temporaryStorage" value="임시저장"> -->
								<input type="button" class="btn btn-primary" id="familyevnetSubmit1" value="저장"/>
								<input type="button" class="btn btn-primary" value="취소" onclick="location.href=''">
				            </td>
				        </tr>
				        </table>
				    </div>
			    </div>
			</div>
			</form>
			
			<!-- 저장하기 모달창 -->
			<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	       		<jsp:include page="./modal/save_modal.jsp"/>
			</div>   

 			<!-- 공지사항 댓글창 -->
 			<jsp:include page="notice_repl.jsp"/>
 			
		</main>
	</section>
	
</body>
</html>