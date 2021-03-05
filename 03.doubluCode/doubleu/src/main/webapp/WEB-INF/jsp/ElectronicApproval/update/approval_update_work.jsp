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
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		String formName = "";
		if(request.getParameter("formName") != null) {
			formName = request.getParameter("formName");
		}
	 %>
	
	
	<div class="e-approval-form-container">
		<form action="/approvalUpdateR" name="frmApproval" id="frmApproval" method="post">
			<div class="e-approval-work-btns">
				<div class="e-approval-work-form-btns">
					<input type="button" name="btnApprovalSelect" class="btn btn-outline-secondary btn-sm" value="목록으로">
				</div>
			</div>
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
									<td> <input type="text" name="drafterName" value="${vo.drafterName }" class="form-control form-control-sm" style="font-size: 1em; padding: 0; border: none; height: 100%; text-align: center;"> </td>
								</tr>
								<tr>
									<th>소속 </th>
									<td> <input type="text" name="drafterDepartment" value="${vo.drafterDepartment }" class="form-control form-control-sm"  style="font-size: 1em; padding: 0; border: none; height: 100%; text-align: center"> </td>
								</tr>
								<tr>
									<th>기안일 </th>
									<td><%= format.format(nowTime) %></td>
								</tr>
								<tr>
									<th>문서번호</th>
									<td> ${vo.formNo } </td>
								</tr>
						</table>						
					</div>
					<div class="e-approval-form-decision-box">
						<div class="e-approval-form-decision-box-1 table-bordered">
							<p style="margin: 0;"> 결재란 </p>
						</div>
						<c:forEach var="makerVo" items="${vo.decisionMakersList }">
						<table class="table table-sm table-bordered e-approval-form-decision-box-2 makerBox" id="makerBox">
							<tr>
								<td id="makerPositionContent">
									<input name="makerPosition"  id="makerContent" value="${makerVo.makerPosition }" readonly="readonly">
								</td>
							</tr>
							<tr>
			                     <td height="80px;">
			                        <input id="makerSignBtn" name="makerSignBtn1"  type="button" value="직원조회" onclick="updateChooseMaker()">
			                        <input id="makerDelBtn" type="button" value="x" onclick="deleteChooseMaker()">
			                        <input type="hidden" name="makerOrder" value="1">
			                        <input type="hidden" name="makerNo" value="${makerVo.memberNo }">
			                     </td>
							</tr>
							<tr>
								<td id="makerNameContent" height="16.5px">
									<input name="makerName" id="makerContent" value="${makerVo.makerName }" readonly="readonly">
								</td>
							</tr>
						</table>
						</c:forEach>
						<div id="makersZone" class="approval-amkers-zone">
						</div>
					</div>
				</div>
				<table class="table table-sm e-approval-form-table-3 table-bordered">
					<tr>
						<th> 일시 </th>
						<td> <input type="date" name="eventDate" value="${vo.eventDate }" class="form-control form-control-sm" style="font-size: 1em;" > </td>
						<th> 협조부서 </th>
						<td> <input type="text" name="cooperationDepartment" value="${vo.cooperationDepartment }" class="form-control form-control-sm" style="font-size: 1em;" required> </td>
					</tr>
					<tr>
						<th> 제목 </th>
						<td colspan="3" align="left" >
						<input type="text" name="formTitle" value="${vo.formTitle }" class="form-control form-control-sm" style="font-size: 1em;" placeholder="제목을 입력해주세요." required>
						</td>
					</tr>
					<tr>
						<th style="line-height: 400px; padding: 0;"> 상세 내용 </th>
						<td colspan="3" height="200px" style="padding: 0.5em;">
							<textarea class="form-control"  name="formDoc" style="font-size:1em; height: 100%; overflow: auto;" >${vo.formDoc }</textarea>
						</td>
					</tr>	
						
					<tr>
						<th colspan="4"  style="padding: 0.5em; ">기존 첨부 파일</th>
					</tr>		
					<tr>
							<td colspan="4" class="approval-delFile">
							<c:set var="no" value="0"></c:set>
								 <c:forEach var="att" items="${vo.attFileList }">
										<div class="delFile-content">
											<div>
												<span>${att.oriFile}</span>
												<input type="button" name="btnDeleteAtt"  value="x" onclick="delFile('${att.sysFile}', ${no } )">
											</div>
											<input type="hidden" name="delSysFile" value=""> 
										</div>
										<c:set var="no" value="${no+1 }"></c:set>
						  		</c:forEach> 
							 </td>
					</tr>		
					<tr>
						<th colspan="4"  style="padding: 0.5em; ">새 파일 첨부</th>
					</tr>		
					<tr>
						<td colspan="4">
							<div class="e-approval-file-zone">
								<div class="input-group mb-3">
									<div class="custom-file" id="fileZone">
								  	</div>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<hr style="margin-right: -3em; margin-left: -3em;">
			<div class="e-approval-work-btns">
				<div class="e-approval-work-form-btns" style="padding-bottom: 10em;">
					<jsp:include page="/WEB-INF/jsp/ElectronicApproval/update/approval_update_btns.jsp"></jsp:include>
				</div>
			</div>
			</main>
			<!-- 공통 -->
		</form>
	</div>
	
<script type="text/javascript">
createMakerBox('makersZone');
createFile('fileZone')
</script>
</body>
</html>