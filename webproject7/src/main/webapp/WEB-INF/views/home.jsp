<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to 상우's 헤어스튜디오</title>
<script >
<c:if test="${emsg != null}"> alert('${emsg}');</c:if>
function loginCheck(){
	alert("로그인 또는 회원가입을 해주세요.");
}
</script>
<link href="resources/css/homeStyle.css" type="text/css"
		   rel="stylesheet">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.2.1.js"/>">
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<!-- 슬라이드 쇼 움직일 이미지들 -->
	<div class="display-container center mySlides">
		<img src="resources/image/a.jpg" style="width: 100%">
		<div class="display-bottommiddle container text-black padding-32 hide-small">			
		</div>
	</div>
	<div class="display-container center mySlides">
		<img src="resources/image/b.jpg" style="width: 100%">
		<div class="display-bottommiddle container text-black padding-32 hide-small">
			
		</div>
	</div>
	<div class="display-container center mySlides">
		<img src="resources/image/c.jpg" style="width: 100%">
		<div class="display-bottommiddle container text-black padding-32 hide-small">
			
		</div>
	</div>
		
	<!-- 메뉴 바 -->
	<c:choose>
<c:when test="${sessionScope.loginId == null}">
   <div class="top">
      <div class="bar black padding card">
         <a href="/web7" class="bar-item hide-small"
            style="text-decoration: none;">상우's 헤어스튜디오</a>         
         <!-- 우측 메뉴 -->
         <div class="right hide-small">
			<a href="customer/joinForm" class="bar-item button">회원가입</a>            
            <a href="javascript:loginCheck()" class="bar-item button">예약하기</a> 
            <a href="" class="bar-item button">디자이너 소개</a> 
            <a href="board/list" class="bar-item button">이용후기</a>
			<a href="#about" class="bar-item button">가게소개</a>
         <form action="login" method="post">
			ID :<input type="text" style="width: 150px;" name="id" id="id">
			PW:<input type="password" style="width: 150px; name="password" id="password">
			<input type="submit" value="로그인">
		</form>
         </div>
      </div>
   </div>
   </c:when>
   <c:otherwise> 
	 <div class="top">
      <div class="bar black padding card">
         <a href="/web7" class="bar-item hide-small"
            style="text-decoration: none;">상우's 헤어스튜디오</a>         
         
         <!-- 우측 메뉴 -->
         
		<div class="right hide-small">
			<a href="customer/updateForm" class="bar-item button">마이 페이지</a>
            <a href="reserve/reserveForm" class="bar-item button">예약하기</a>
            <a href="reserve/reserveConfirm" class="bar-item button">예약확인</a>
                <a href="" class="bar-item button">디자이너 소개</a>             
            <a href="board/list" class="bar-item button">이용후기</a>
			<a href="#about" class="bar-item button">가게소개</a><br>
		${sessionScope.loginName }(${sessionScope.loginId })님 환영합니다.
		<a href="logout">로그아웃</a>
         </div>
         </div>
      </div>   
	</c:otherwise>
   </c:choose>

	<!-- !PAGE CONTENT! -->
	<div class="main content padding"
		style="max-width: 1200px; margin-top: 100px">

    	
		<!-- First Photo Grid-->
		<div class="row-padding padding-48 center" id="food">
			<div class="quarter">
				<img src="resources/trend/1.jpg" style="width: 100%">
				<h3>브라운 발리아쥬</h3>				
			</div>
			<div class="quarter">
				<img src="resources/trend/2.jpg" style="width: 100%">
				<h3>유니크 투톤 옴브레</h3>				
			</div>
			<div class="quarter">
				<img src="resources/trend/3.jpg" style="width: 100%">
				<h3>레드브라운 투톤염색</h3>				
			</div>
			<div class="quarter">
				<img src="resources/trend/4.jpg" style="width: 100%">
				<h3>네츄럴 믹스펌</h3>				
			</div>
		</div>

		<!-- Second Photo Grid-->
		<div class="row-padding padding-16 center">
			<div class="quarter">
				<img src="resources/trend/5.jpg" style="width: 100%">
				<h3>볼륨펌</h3>				
			</div>
			<div class="quarter">
				<img src="resources/trend/6.jpg" style="width: 100%">
				<h3>볼륨 물결 히피펌</h3>				
			</div>
			<div class="quarter">
				<img src="resources/trend/7.jpg" style="width: 100%">
				<h3>포에틱 리프</h3>				
			</div>
			<div class="quarter">
				<img src="resources/trend/8.jpg" style="width: 100%">
				<h3>우디타운 롱</h3>				
			</div>
		</div>

		<!-- Pagination -->
		<div class="center padding-32">
			<div class="bar">
				<a href="#" class="bar-item button hover-black">≪</a> 
				<a href="#" class="bar-item black button">1</a>
				<a href="#" class="bar-item button hover-black">2</a>
				<a href="#" class="bar-item button hover-black">3</a>
				<a href="#" class="bar-item button hover-black">4</a>
				<a href="#" class="bar-item button hover-black">≫</a>
			</div>
		</div>

		<hr id="about">

		<!-- About Section -->
		<div id="about" class="container padding-32 center">
			<h3>About 상우's 헤어샾</h3>
			<br> <img src="resources/image/e.jpg" alt="Me" class="image"
				style="display: block; margin: auto" width="400" height="300">
			<div class="padding-32">
				<h4>
					<b>30년 전통을 자랑하는 국내 최고의 No.1 미 용 실</b>
				</h4>
				<h6>
					<i>★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★</i><br>
				</h6>
				<p>스타일의 완성은 Hair입니다!!</p>		
				<p>상우's 헤어스튜디오는 타미용실과 차별화된 최신설비와 남다른 실력을 갖춘 전문 헤어디자이너들을 보유하고있습니다.</p>
				<p>상우's 헤어스튜디오는 시술전 1:1 맞춤형 상담을 통해 고객님께 가장 알맞는 헤어 스타일을 찾아서 연출해드립니다.</p>
				<p>상우's 헤어스튜디오를 통해 감추어져있던 매력과 자신감을 되찾으세요^^</p> <br>
				<h7>☞ 연락처 : 070-xxxx-xxxx</h7><br>				
				<h8>☞ 영업시간 : 평일 10:00AM ~ 10:00PM / 주말 9:00AM ~ 9:00PM</h8><br><br>
				<h9>★  온라인 예약을 하시고 저희 가게를 방문하셔서 인증확인 된다면 시술 종류와 상관없이 30% 현장할인을 제공해드립니다^^ ★</h9>				
			</div>
		</div>
		<hr>

		
	<script>
		// 사진 슬라이드 쇼 - 2.5초마다 사진이 변경됩니다.
		var myIndex = 0;
		carousel();

		function carousel() {
			var i;
			var x = document.getElementsByClassName("mySlides");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			myIndex++;
			if (myIndex > x.length) {
				myIndex = 1
			}
			x[myIndex - 1].style.display = "block";
			setTimeout(carousel, 2500);
		}
	</script>
</body>
</html>