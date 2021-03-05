<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date nowTime = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		
		String formName = "";
		if(request.getParameter("formName") != null) {
			formName = request.getParameter("formName");
		}
	 %>
	
	
	<div class="e-approval-form-container">
		<form name="frmApproval" action="" method="post">
		<jsp:include page="/WEB-INF/jsp/ElectronicApproval/view/approval_view_btns.jsp"></jsp:include>
		<hr style="margin-right: -3em; margin-left: -3em;">
		
		<main>
			<div class="e-approval-form-workType-container">
				<div class="e-approval-form-workType-title">
					<h4 style="font-weight: bold">${vo.formType}</h4>
				</div>
				
				<div class="e-approval-form-workType-top">
					<div class="e-approval-form-workType-top-1">
						<table class="table table-sm table-bordered">
								<tr>
									<th> 기안자 </th>
									<td> ${vo.drafterName} </td>
								</tr>
								<tr>
									<th>소속 </th>
									<td>${vo.drafterDepartment } </td>
								</tr>
								<tr>
									<th>기안일 </th>
									<td>${vo.formDate }</td>
								</tr>
								<tr>
									<th>문서번호</th>
									<td>${vo.formNo }</td>
								</tr>
						</table>
					</div>
					<div class="e-approval-form-decision-box">
						<div class="e-approval-form-decision-box-1 table-bordered">
							<p style="margin: 0;"> 결재란 </p>
						</div>
						<div id="makersZone" class="approval-amkers-zone">
							<c:forEach var="makerVo" items="${vo.decisionMakersList }">
							<table class="table table-sm table-bordered e-approval-form-decision-box-2 makerBox" id="makerBox">
								<tr>
									<td id="makerPositionContent">
										<input name="makerPosition" id="makerContent" value="${makerVo.makerPosition }" readonly="readonly">
									</td>
								</tr>
								<tr>
									<td height="80px;" style="padding-top: 28px;">
										<c:choose>
											<c:when test="${makerVo.decisionState == '1' }">
													<h6 class="text-primary" style="font-weight: bold; font-size: 1em;">결재승인</h6>
											</c:when>
											<c:when test="${makerVo.decisionState == '0' }">
												<h6 class="text-muted" style="font-weight: bold; font-size: 1em;">결재대기</h6>
											</c:when>
											<c:when test="${makerVo.decisionState == '-1' }">
												<h6 class="text-warning" style="font-weight: bold; font-size: 1em;">결재반려</h6>
											</c:when>
										</c:choose>
										<input type="hidden" value="${makerVo.memberNo }">
										<input type="hidden" value="${makerVo.makerOrder }">
									</td>
								</tr>
								<tr>
									<td id="makerNameContent" height="16.5px">
										<input name="makerName" id="makerContent" value="${makerVo.makerName }" readonly="readonly">
									</td>
								</tr>
							</table>
							</c:forEach>
						</div>
					</div>
				</div>
				<table class="table table-sm e-approval-form-table-3 table-bordered">
					<tr>
					 <th> 휴가 종류 </th>
					 <td colspan="3"> 
						<input type="text" value="${vo.formVacationVo.vacationType }" class="form-control form-control-sm approval-select-view" readonly="readonly" >
					 </td>
					</tr>
					<tr>
						<th> 기간 및 일시 </th>
						<c:choose>
							<c:when test="${vo.formVacationVo.vacationType == '반차' }">
								<td>
								<input type="text" value="${vo.formVacationVo.startDate}" class="form-control form-control-sm approval-select-view" style="display: inline-block; width: 150px;" readonly="readonly" >
								</td>
							</c:when>
							<c:otherwise>
								<td>
								<input type="text" value="${vo.formVacationVo.startDate}" class="form-control form-control-sm approval-select-view" style="display: inline-block; width: 150px;" readonly="readonly" >
								~
								<input type="text" value="${vo.formVacationVo.endDate}" class="form-control form-control-sm approval-select-view" style="display: inline-block; width: 150px;" readonly="readonly">
								</td>
							</c:otherwise>
						</c:choose>
						<th> 일 수 </th>
						<td> <input type="text" class="form-control form-control-sm approval-select-view" style="width: 30px; font-size: 1em; margin: 0 auto; display: inline-block; border: none; text-align: right; padding: 0;" readonly="readonly" value="${vo.formVacationVo.vacationCnt }">  <span>일</span>  </td>
					</tr>
					<c:choose>
						<c:when test="${vo.formVacationVo.vacationType == '반차' }">
							<tr>
								<th> 오전/오후 </th>
								<td colspan="3">
									<input type="text" value="${vo.formVacationVo.halfDayType}" class="form-control form-control-sm approval-select-view" style="display: inline-block; width: 150px;" readonly="readonly">
								</td>
							</tr>
						</c:when>
					</c:choose>
					
					<tr>
						<th style="line-height: 200px; padding: 0;"> 사유 </th>
						<td colspan="3" height="200px" style="padding: 0.5em;">
							<textarea class="form-control" style="font-size:1em; height: 100%; overflow: auto ; background-color: #ffffff" readonly="readonly">${vo.formDoc }</textarea>
						</td>
					</tr>		
					<tr>
						<th colspan="4"  style="padding: 0.5em; ">파일 첨부</th>
					</tr>		
					<tr>
						<td colspan="4">
							<div class="e-approval-file-zone">
								<c:forEach var="att" items="${vo.attFileList }">
								<div class="fileContent">
									<div class="fileContent-first">
										<a href="/FileDownload?file=${att.sysFile }">
											<span>${att.oriFile}</span>
											<input type="button" id="delBtnFile" value="다운로드">
										</a>
									</div>
								</div>
								</c:forEach>
							</div>
						</td>
					</tr>
				</table>
				<hr>
				<div class="e-approval-reason">
					<h6 style="font-size: 1.2em; font-weight: bold">결재 사유</h6>
					<c:forEach var="makerVo" items="${vo.decisionMakersList }">
						<c:choose>
							<c:when test="${makerVo.decisionState == '1'}">
								<span style="font-size: 1em; font-weight: bold;">&nbsp; ${makerVo.makerName}</span>
								<span style="color: #007bff; font-weight: bold">(승인)</span>
								<textarea rows="4" style="width: 100%; border: 1px solid #dee2e6; border-radius: 5px; margin-top: 0.6em; padding: 0.3em;">${makerVo.makerComment}</textarea>
							</c:when>
							<c:when test="${makerVo.decisionState == '-1'}">
								<span style="font-size: 1em; font-weight: bold;">&nbsp; ${makerVo.makerName}</span>
								<span style="color: #ffc107; font-weight: bold">(반려)</span>
								<textarea rows="4" style="width: 100%; border: 1px solid #dee2e6; border-radius: 5px; margin-top: 0.6em; padding: 0.3em;">${makerVo.makerComment}</textarea>
							</c:when>
						</c:choose>					
					</c:forEach>
				</div>
				<hr>
			</div>
			<hr style="margin-right: -3em; margin-left: -3em;">
			<div class="e-approval-work-btns">
				<div class="e-approval-work-form-btns" style="padding-bottom: 10em;">
					<input type="button" name="btnApprovalSelect" class="btn btn-outline-secondary btn-sm" value="목록으로">
				</div>
			</div>
			</main>
		</form>
	</div>
</body>
</html>