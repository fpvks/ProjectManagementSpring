<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
		<fieldset>
			<p>
				<label>프로젝트 이름</label>
				<input type="text" name="project_name" size="40" value="${ProjectVO.project_name }">
			</p>
			<p>
				<label>프로젝트 내용</label>
				<textarea rows="10" cols="50" name="project_content">${ProjectVO.project_content }</textarea>
			</p>
			<p>
				<label>시작 날짜</label>
				<input type="text" name="start_date" size="40" value="<fmt:formatDate value="${ProjectVO.start_date }" pattern="yyyy-MM-dd" />">
			</p>
			<p>
				<label>마감 날짜</label>
				<input type="text" name="end_date" size="40" value="<fmt:formatDate value="${ProjectVO.end_date }" pattern="yyyy-MM-dd" />">
			</p>
			<p>
				<label>상태</label>
				<select name="project_progress">
					<option value="준비" ${ProjectVO.project_progress == '준비' ? 'selected' : '' }>준비</option>
					<option value="진행중" ${ProjectVO.project_progress == '진행중' ? 'selected' : '' }>진행중</option>
					<option value="종료" ${ProjectVO.project_progress == '종료' ? 'selected' : '' }>종료</option>
					<option value="보류" ${ProjectVO.project_progress == '보류' ? 'selected' : '' }>보류</option>
				</select>
			</p>
			<p>
				<a id="modify" href="${pageContext.request.contextPath }/project/modify?serial_number=${ProjectVO.serial_number }">[수정]</a>
				<a id="remove" href="${pageContext.request.contextPath }/project/remove?serial_number=${ProjectVO.serial_number }">[삭제]</a>
				<a href="${pageContext.request.contextPath }/project/list">[돌아가기]</a>
			</p>
		</fieldset>
		
	<form action="remove" method="post" id="f1">
		<input type="hidden" name="serial_number" value="${ProjectVO.serial_number }">
	</form>
	
	<script>
		$(function(){
			$("#remove").click(function(e){
				e.preventDefault();
				$("#f1").submit();
			})
		})
	</script>
<%@ include file="../include/footer.jsp"%>