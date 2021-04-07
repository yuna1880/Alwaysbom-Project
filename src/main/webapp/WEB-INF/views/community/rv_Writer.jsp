<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>새늘봄
        || 리뷰 작성</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file="../main/import.jspf" %>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div id="container" class="mx-auto">
    <h2>리뷰 게시판</h2>
    <div>
        <form class="row g-3" method="post">
            <div class="form-floating">
                <select class="form-select" id="floatingSelect" name="category"
                        aria-label="Floating label select example">
                    <option disabled>카테고리</option>
                            <option value="클래스" selected>클래스</option>
                            <option value="꽃다발">꽃다발</option>
                            <option value="정기구독">정기구독</option>
                            <option value="소품샵">소품샵</option>
                </select>
                <label for="floatingSelect">카테고리</label>
            </div>
            <div class="md-3">
                <label for="question" class="form-label">Question</label>
                <input type="text" class="form-control" name="question" id="question" value="${vo.question}"
                       placeholder="제목">
            </div>
            <div class="md-3">
                <label for="question" class="form-label">Question</label>
                <input type="text" class="form-control" name="question" id="question" value="${vo.question}"
                       placeholder="내용">
            </div>
            <div class="md-3">
                <label for="question" class="form-label">Question</label>
                <input type="text" class="form-control" name="question" id="question" value="${vo.question}"
                       placeholder="이미지">
            </div>
            <div class="md-3">
                <label for="question" class="form-label">Question</label>
                <input type="text" class="form-control" name="question" id="question" value="${vo.question}"
                       placeholder="질문입력">
            </div>
            <div class="form-floating">
                <textarea class="form-control" placeholder="내용을 입력하세요" id="answer" name="answer"
                          style="height: 200px">${vo.answer}</textarea>
                <label for="answer">Answer</label>
            </div>
            <div class="md-3">
                <label for="question" class="form-label">Question</label>
                <input type="text" class="form-control" name="question" id="question" value="${vo.question}"
                       placeholder="별점">
            </div>
            <c:if test="${empty vo.idx}">
                <div class="file-wrap">
                    <button type="button" class="btn btn-secondary" onclick="faqUpload(this.form)">추가</button>
                </div>
            </c:if>
            <c:if test="${not empty vo.idx}">
                <div class="file-wrap">
                    <input type="hidden" name="idx" id="idx" value="${vo.idx}">
                    <button type="button" class="btn btn-secondary" onclick="faqUpdate(this.form)">수정</button>
                </div>
            </c:if>
        </form>
    </div>
</div>
<%@ include file="../main/b_footer.jspf" %>
</body>
</html>
