<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*, java.text.*, java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no,  maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="../resources/board/mypage.css">
<link rel="stylesheet" type="text/css"
	href="../resources/board/home.css">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">

<title>마이페이지</title>
</head>
<body>

	<header class="headerContainer">
		<!--상단 탭 만들기 뼈대구조-->
		<form action="home" method="post">
			<div class="headerContents">
				<!--상단 탭 내용물 감싼구조-->
				<div class="WestagramTag">
					<!--상단 좌측 내용물-->
					<a href="home"><i class="fab fa-instagram"></i> | <span>Wgt</span>agram</a>
				</div>
				<div class="headerSearchBar" style="border-radius: 5px;">
					<!--상단 중앙 내용물-->
					<i class="fas fa-search"></i> <input name="title" type="text"
						placeholder=" 게시글 검색" style="border: none; outline: none;">
					<input type="submit" value="검색" style="display: none;">
				</div>
			</div>
		</form>
	</header>

	<div class="mypage">
		<a href="mypage"><img id="user"
			src="../resources/board/img/user.png" width="30px" height="30px"
			style="cursor: pointer;"></a>
	</div>
	<c:forEach var="user" items="${userList}">
 		${user.userId}
 		${user.name}
  		${user.phone}
	</c:forEach>

	<div class="body1">
		<div class="feedReactionButton">
			<!-- <button class="heartbtn" onclick="addLike()"><i class="far fa-heart"></i></button> -->
			<div class="boardarea">
				<c:forEach var="item" items="${board}">
					<h5
						style="text-align: center; position: relative; margin-bottom: -25px; left: 1%;">
						[No.${item.number}]
					</h5>
					<div class="write" style="margin-top: 30px; margin-bottom: 10px;">
						<img src="../resources/board/img/upload/${item.imgname}.jpg"
							style="width: 370px; height: 330px"><br>
						<div class="emptyheart">
							<a class="likebtn"
								style="display: flex; padding-left: 1px; margin-top: 1px;"></a>
							<div class="feedReaction">
								<span class="liketext">좋아요 <span class="likesresult">0</span>개
								</span>
							</div>
							<%-- <p><%= sf.format(nowTime) %></p> --%>
							<%-- <p>${item.regDate}</p> --%>
						</div>
						<p>
							<fmt:formatDate pattern="yy년MM월dd일 a hh:mm"
								value="${item.regDate}" />
						</p>
						<h4>${item.title}</h4>
						<br> ${item.content}<br>
					</div>
					<div class="update_delete_area"
						style="display: flex; justify-content: space-evenly; height: 30px; border-bottom: 2px solid #f1f1f1;">
						<div class="updateearea">
							<form action="update" method="post"
								style="text-align: center; width: 60px;">
								<button class="updatebtn" type="button" value="수정"
									style="position: relative; left: 1%; margin: 0 auto; cursor: pointer;">수정</button>
							</form>
						</div>
						<div class="deletearea">
							<form action="delete" method="post"
								style="text-align: center; width: 60px;">
								<button class="deletebtn" type="button" value="삭제"
									style="position: relative; left: 1%; margin: 0 auto; cursor: pointer;">삭제</button>
							</form>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<script>
	let like = document.querySelectorAll(".likebtn")
	
	for(let i = 0; i < like.length; i++){
		like[i].addEventListener('click', ()=> {
			like[i].classList.toggle('open')
		})
	}

</script>
</body>
</html>