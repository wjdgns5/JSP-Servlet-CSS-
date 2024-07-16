<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기 화면</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/view.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f8f8;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        margin: auto;
        background-color: white;
        border: 1px solid #ddd;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
    }
    h2 {
        margin-top: 0;
        color: #333;
    }
    .content {
        margin-top: 20px;
        border-top: 1px solid #ddd;
        padding-top: 20px;
    }
    .content p {
        margin: 10px 0;
    }
    .meta-info {
        color: #777;
        font-size: 0.9em;
    }
    .btn {
        display: inline-block;
        padding: 10px 15px;
        margin-top: 10px;
        color: white;
        background-color: #007bff;
        text-decoration: none;
        border-radius: 5px;
    }
    .btn-edit {
        background-color: #28a745;
    }
    .btn-delete {
        background-color: #dc3545;
    }
    .comments-section {
        margin-top: 40px;
    }
    .comments-section h3 {
        margin-top: 0;
    }
    .comment-form {
        margin-top: 20px;
    }
    .comment {
        border-top: 1px solid #ddd;
        padding-top: 10px;
        padding-bottom: 10px;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>${board.title}</h2>
        <div class="meta-info">
            <fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
        </div>
        <div class="content">
            <p>${board.content}</p>
        </div>
        <c:if test="${board.userId == principal.id}">
            <a href="${pageContext.request.contextPath}/board/edit?id=${board.id}" class="btn btn-edit">수정</a>
            <a href="${pageContext.request.contextPath}/board/delete?id=${board.id}" class="btn btn-delete">삭제</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/board/list?page=1" class="btn">목록으로 돌아가기</a>
        
        <div class="comments-section">
            <h3>댓글</h3>
            <!-- 댓글 리스트 작성 -->
            <c:forEach var="comment" items="${comments}">
                <div class="comment">
                    <p><strong>${comment.userName}</strong> (${comment.userId}) | <fmt:formatDate value="${comment.createdAt}" pattern="yyyy-MM-dd HH:mm"/></p>
                    <p>${comment.content}</p>
                </div>
            </c:forEach>

            <!-- 댓글 작성 폼  -->
            <div class="comment-form">
                <form action="${pageContext.request.contextPath}/comment/add" method="post">
                    <input type="hidden" name="boardId" value="${board.id}">
                    <textarea name="content" rows="4" style="width: 100%;" placeholder="댓글을 작성하세요"></textarea>
                    <button type="submit" class="btn">댓글 작성</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
