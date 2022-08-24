<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <link rel="stylesheet" href="../resources/initialize.css">
    <link rel="stylesheet" href="../resources/shopStyle.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no,  maximum-scale=1.0, minimum-scale=1.0">
    <title>가게 등록</title>
  </head>
  <body>
    <div id="wrap">
      <header id="header"><h1>메뉴 등록</h1></header>
      <hr>
      <div id="content">
        <div class="inner">
          <form action="addMenu" method="post" id="addForm" enctype="multipart/form-data">
            <p>메뉴는 최대 10개까지만 등록가능합니다.</p>
            <div class="file_upload_wrap">
              <table>
                <tr>
                  <td>
                    <img class="preview img" style="min-width: 150px; height: 150px;" />
                  </td>
                  <td>
                    <input type="text" name="menu_name" class="menu_inputBox" placeholder="메뉴 이름을 입력해주세요">
                    <input type="text" name="menu_price" class="menu_inputBox" placeholder="메뉴 가격을 입력해주세요">
                    <input type="text" name="menu_intro" class="menu_inputBox" placeholder="메뉴 소개를 입력해주세요">                  
                  </td>
                </tr>
              </table>
              <div class="btn_wrap">
                <label for="upload_file" class="upload_label">메뉴 사진 등록</label>
                <input id="upload_file" type="file" name="menu_img" onchange="readURL(this)" accept="image/jpg">
              </div>
            </div>
            <hr class="hr">
            현재 메뉴는 ${menuListSize }개 등록 되어있습니다.
            <div class="btn_wrap">
              <input type="button" value="취소하기" onclick="location.href='viewMyShop'" class="prev_btn">
              <input type="submit" value="등록완료" class="next_btn">
            </div>
          </form>
        </div>
      </div>
      <hr>
      <footer id="footer">Copyright (c) 2022 Copyright Holder All Rights Reserved.</footer>
    </div>
    <script type="text/javascript">
	  	function readURL(input) {
			const type = input.files[0].name.split('.');
			if(type[1] != "jpg"){
				alert("이미지 파일은 jpg 형식만 등록 가능합니다.");
				document.querySelector('.preview').src = "";
				document.querySelector('.img').value = null;
				return false;
			}
			  if (input.files && input.files[0]) {
			    var reader = new FileReader();
			    reader.onload = function(e) {
			      document.querySelector('.preview').src = e.target.result;
			    };
			    reader.readAsDataURL(input.files[0]);
			  } else {
			    document.querySelector('.preview').src = "";
			  }
			}
    </script>
  </body>
</html>
