<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function deleteBoard() {
		if (confirm("정말 삭제하시겠습니까?")) {
			location.href = "${pageContext.request.contextPath}/delete.do?boardNo=${board.boardNo}";// 중복 ??
		}
	}

	function updateBoard() {
		if (confirm("정말 수정 하시겠습니까?")) {
			location.href = "${pageContext.request.contextPath}/update.do?boardNo=${board.boardNo}";
		}
	}

</script>
</head>
<body>
	<table cellpadding="5">
		<tr>
			<td>
				<table width="550">
					<tr>
						<td><b>글번호 : ${requestScope.board.boardNo} | 타이틀 : ${requestScope.board.boardTitle}</b>			
							<hr style="color: #6691BC; border-style: dotted; margin: 0">
						</td>
					</tr>
					<tr>
						<td>작성자 : ${requestScope.board.memberNo} | 작성일시 : ${requestScope.board.boardWriteDate}
							 조회수 : ${requestScope.board.boardHits}</td>
					</tr>
 
					<td>
						<hr style="color: #6691BC; margin: 20"> <pre> 내용 : ${requestScope.board.boardContent}</pre>
					</td>
					
				
					<tr>
						<td valign="middle"><a href="boardlist.do"><img alt="전체글목록"
								src="./img/list_btn.jpg"></a> <!-- 로그인한 사람과 글쓴사람의 id가 같은 경우에만 보여지도록 조건 -->
							<%-- <c:if test="${requestScope.board.memberVO.id==sessionScope.mvo.id}"> --%>
								<img alt="삭제" src="./img/delete_btn.jpg" onclick="deleteBoard()">
								<img alt="수정" src="./img/modify_btn.jpg" onclick="updateBoard()">
							<%-- </c:if> --%>
							</td>
					</tr>
					
				</table>
			</td>
		</tr>
	</table>
	<div style="width:650px; text-align: center;">
						<br> 
						<!-- 로그인 한 놈만 댓글작성보이게 -->
						<%-- <c:if test="${requestScope.memberNo !=null}"> --%>
						<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성해라"></textarea>
						<br>
						<!-- 비밀댓글??? -->
						<!-- <input type="checkbox" id="secretReply">비밀 댓글 -->
						<button type="button" id="btnReply" onclick="">댓글 작성</button>
						<%-- </c:if> --%>
						<hr>
						</div>
						<div id="listReply"></div>
						
</body>
</html>






