<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
<html>
<head>
	<meta content="동행복권, 로또6/45, 로또6/45판매점, 연금복권520, 즉석복권, 즉석복권 판매점 조회, 연금복권 판매점 조회, 전자복권, 이벤트고객센터, 복권기금, 복권판매점 모집 문의 안내, 복권 통합포털, 추첨, 당첨정보, 회차별 번호 제공 ">
	<meta id="desc" name="description" charset="EUC-KR" content="">
	<title>동행복권</title>
	
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title> 동행복권</title>
<link href="${path}/resources/css/layout.css" rel="stylesheet"/>
<link href="${path}/resources/css/default.css" rel="stylesheet"/> 
<link href="${path}/resources/css/al720.css" rel="stylesheet"/> 
<link href="${path}/resources/css/common.css" rel="stylesheet"/>
<link href="${path}/resources/css/main.css" rel="stylesheet"/>  
<link href="${path}/resources/css/contents.css" rel="stylesheet"/>  
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %> 
<body>

<div class="containerWrap"><!-- pc일 경우 컨텐츠 영역 감싸는 마크업 추가  -->
	
<section class="contentSection">
	<!--왼쪽-->
	<nav class="lnbNav">
		<!-- left menu include -------------->
		<div id="snb" class="lnb">
	<h2 id="09" class="lnb_title">회원서비스</h2>
	<ul id="lnb" class="lnb_dep1">
		<li id="09-01"><a href="/user.do?method=login" class="menuLnb"><span>로그인</span></a>
		<li id="09-02"><a href="/customer.do?method=findIdPw" class="menuLnb"><span>아이디/비밀번호 찾기</span></a>
		<li id="09-03"><a href="/loginJoin.do?method=joinFormAgree" class="menuLnb"><span>회원가입</span></a></li>
	</ul>
</div>

		<!-- ----------------------------- -->
	</nav>

	<!-- 컨텐츠 영역 -->
	<div id="article" class="contentsArticle">
		<div class="header_article">
			<h3 class="sub_title">로그인</h3>
			<p class="location"></p>
		</div>
		<div>
			
			<div class="content_wrap">
			<!-- -------------------------------------------------------------------------------------- -->
			
			<!-- <div class="middleHeader mt20">
				<h3 class="middle_title">희망은 나눔이 되고, 나눔은 행복이 됩니다. 건전한 복권 즐기기를 생활화 하세요.</h3>
			</div> -->

<script type="text/javascript">
		//window.document.jform.userId.focus();
	function check_if_Valid3() {
		checkCookieSaveAdminId();
		var f = window.document.jform;
		
	
		if (f.userId.value == "") {
			alert("아이디를 입력해 주십시오");
			f.userId.focus();
			return;
		}
		if (f.password.value == "") {
			alert("비밀번호를 입력해 주세요");
			f.password.focus();
			return;
		}
		if (f.userId.value.length >= 15) {
			alert("아이디가 자릿수가 초과되었습니다.");
			return;
		}
		if (f.password.value.length >= 101) {
			alert("비밀번호가 자릿수가 초과되었습니다.");
			return;
		}

		loginpage();
	}
	
	function loginpage(){
		var f = window.document.jform;
		f.action = "main"; 		
		f.submit();
	}
	
	//엔터만 치면 로그인
	function enter_check3(eventValue) {
		if (eventValue == 13) {
			check_if_Valid3();
			return;
		}
	}

	function setCookie(name, value, expire) {
		document.cookie = name + "=" + escape(value)
				+ ((expire) ? "; expires=" + expire.toGMTString() : "");
	}

	function getCookie(uName) {
		var flag = document.cookie.indexOf(uName + '=');
		if (flag != -1) {
			flag += uName.length + 1;
			end = document.cookie.indexOf(';', flag);
			if (end == -1)
				end = document.cookie.length;
			return unescape(document.cookie.substring(flag, end));
		} 
	}

	function register(uName) {
		var today = new Date();
		var expire = new Date(today.getTime() + 60 * 60 * 24 * 31 * 1000);
		setCookie("userId", uName, expire);
	}

	function checkCookieSaveAdminId() {
		var chk = document.jform.checkSave.checked;
		if (chk == true) {
			register(document.jform.userId.value);
		} else {
			register("");
		}
	}
	
	$(document).ready(function() {
		if(getCookie("userId") != undefined) {
			document.jform.userId.value = getCookie("userId");
		}
	});
	
</script> 
			<form name="jform" method="get">
			<input type="hidden" name="returnUrl" value="">
			<input type="hidden" name="newsEventYn" value="">
			<div class="box_login">
				<div class="inner">
					<fieldset>
						<legend><strong>LOGIN</strong></legend>
						<div class="form">
							<input type="text" maxlength="15" name="userId" id="userId" onkeydown="javascript: if (event.keyCode == 13) {enter_check3(event.keyCode);}" autocomplete="off" title="아이디" placeholder="아이디">
							<input type="password" maxLength="100" name="password" onkeydown="enter_check3(event.keyCode);" title="비밀번호" placeholder="비밀번호">
							<a class="btn_common lrg blu" href="javascript:check_if_Valid3();">로그인</a> 
						</div>
						<input id="checkSave" name="checkSave" type="checkbox" checked	onClick="checkCookieSaveAdminId();"><label for="checkSave">ID저장</label>
						<div class="links">
							<a class="btn_common lrg" href="javascript:join();">회원가입</a>
							<a class="btn_common lrg" href="/customer.do?method=findIdPw">아이디/비밀번호찾기</a>
						</div>
					</fieldset>
				</div>
				<div class="inFootTxt">
				    <p>본 사이트는 Internet Explorer 11, Edge, Chrome, Safari 브라우저에 최적화되어 있습니다.</p>
				</div>
			</div>
			</form>
			</div>
		</div>
	</div>
	
	
 
	<aside id="asideQuick" class="quic_aside">
		<a href="#" class="toggle">퀵메뉴열기</a>
		<div class="inner">
			<ul class="prog">
				<li class="p0"><a href="/gameResult.do?method=notReceiveInfo">미수령<br>당첨금</a></li>
				<li class="p1"><a href="/myPage.do?method=enjoyEval">나의복권<br>건전지수</a></li>
				<li class="p2"><a href="/happy.do?method=healthCultureProc">건전구매<br>캠페인</a></li>
				<li class="p3"><a href="/user.do?method=campainVow">건전구매<br>서약</a></li>
				<li class="p4"><a href="/myPage.do?method=campainTest">자기관리<br>프로그램</a></li>
				<li class="p5"><a href="https://clean.dhlottery.co.kr/" target="_blank" title="새창 열림">동행<br>클린센터</a></li>
			</ul>
		</div>
		<div class="top"><a href="#skipnavigation">위로가기</a></div>
	</aside>
	<script type="text/javascript">
		$(document).ready(function(){
			var spread;
			var min4quick = 1420;
			var bodyw = $("body").prop("clientWidth");
			var aside = $("#asideQuick");
			var btn = aside.find(".toggle");
			$(window).resize(function(){
				bodyw = $("body").prop("clientWidth");
				if(bodyw < min4quick){
					aside.css("right","-86px");
					aside.addClass("fold");
					spread = false;
				}else{
					aside.css("right","0");
					aside.removeClass("fold");
					spread = true;
				}
			}).resize();
			btn.click(function(e){
				e.preventDefault();
				if(spread == true){
					aside.animate({right:-86},300);
					btn.removeClass("opened");					
					spread = false;
				}else{
					aside.animate({right:0},300);
					btn.addClass("opened");
					spread = true;
				}
				
			});
		});
	</script>

</section>
 


	
	
		

<!--모달팝업레이어 추가-->
<div class="layer">  
	<div class="bg"></div>  
	<div class="layer_area" id="layer1">
    	<div class="layer_top">아래 QR 코드를 휴대폰으로 촬영해주세요.<br>케이뱅크 계좌 개설 페이지로 이동합니다.</div>
		<div class="layer_img"><img src="images/event/kbank.jpg"></div>
		<div class="layer_btn"><a href="#" id="layer_close">닫기</a></div>
	</div>  
</div>
  
<script type="text/javascript">  
jQuery(function($){  
	function layer_open(el){  		
		$('.layer').fadeIn();
		var temp = $('#' + el);  
		if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');  
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');  
		else temp.css('left', '0px');
	}

	$('#layer_open').click(function(){  
		layer_open('layer1');  
		return false;  
	});  
	
	$('#layer_close').click(function(){  
		$('.layer').fadeOut();  
		return false;  
	});
});  
</script>
<!--//모달팝업레이어 추가-->

</div><!-- //pc일 경우 컨텐츠 영역 감싸는 마크업 추가  -->

<!-- 접속대기 레이어 -->
<div id="popWaitConnect" class="wrap_pop_layer" style="display:none">
	<div class="popup_layer popup_waiting">
		<div class="header_layer">
			<h2>접속대기 안내</h2>
			<a class="close" href="#">닫기</a>
		</div>
		<div class="status">
			<p class="m1"><strong>서비스연결 대기중</strong>입니다. <span>대기 순서에 따라 자동 접속됩니다.</span></p>
			<div class="circle"><span>접속 대기중</span></div>
			<p class="m2">현재 대기 인원 : <strong id="popWaitCount">총 1,200명</strong><br>예상 대기 시간 : <strong id="popWaitTime">약 5분 30초</strong></p>
		</div>
		<div class="noti">
			<h3>유의사항</h3>
			<ul class="list_text_common">
				<li>새로고침 또는 뒤로가기를 하면 다시 대기시간이 부여됩니다.</li>
			</ul>
		</div>
		<div class="btns_bottom">
		    <a class="btn_common mid close" href="#">대기종료</a>
		</div>
	</div>
</div>
<!-- //접속대기 레이어 -->


</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
</html>