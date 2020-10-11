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
</head>



<%@ include file="/WEB-INF/views/header.jsp" %> 


<body >
<div>


	
		
			
<script type="text/javascript">
	$(document).ready(function(){
		var curPage = document.location.href;
		var mainBannerUrl = "/common.do?method=getMainBannerList";
		
		if(curPage.indexOf("https") > -1){
			mainBannerUrl = "/userSsl.do?method=getMainBannerList";
		}

		$.ajax({
			type: 'POST',
		    url: mainBannerUrl,
		    data : "",
		    dataType    :'json',
		    async:false,
			success : function(data) { // 성공했을때 콜백함수
				var mainBanner = "";
				
				if(data.returnValue == "fail"){
					//alert("사용중인 배너가 없습니다.");
					return;
				}
				
				if (data.mainBannerList == null || data.mainBannerList == "") {
					mainBanner = "";
				} else {
					mainBanner += "<div id='band_banner' class='band_banner'>";

					for(var i=0; i<data.mainBannerList.length ; i++) {
						mainBanner += "<a href='"+data.mainBannerList[i].link+"' target='"+data.mainBannerList[i].target+"' class='img_banner'><img src='/img/event/main_banner/"+data.mainBannerList[i].physclFileNm+"'></a>";
						mainBanner += "<a class='btn_close' href='javascript:today_close_popup();'>배너닫기</a>";
					}
					
					mainBanner += "</div>";				
				}

				$("#band_banner").html(mainBanner);
			},
			error : function(data) {
				//alert("사용중인 배너가 없습니다.");
			}
		});
		
		var banner = $(".slider > li"),
			bannerLength = banner.length,
			targetNum = 0, //보여질 숫자
			currentNum = 0, //보여지고있는 숫자
			speed = 400, //애니메이트 속도
			delay = 5000, //재생타임
			isPlay = true, //자동재생중일때 true
			isTween = false; //false일때만 이동가능

		function initBanner(){
			if(bannerLength > 1){//배너가 두개 이상일때만 슬라이드실행
				bnrSlide();
			}
			todayCookie();//쿠키실행
		}

		function bnrSlide(){
			banner.not(":first").hide();
			timer = setInterval(nextMove, delay); //인터벌

			//아이콘 클릭
			$(".icon_count a").on("click", function(e){
				e.preventDefault();
				clearInterval(timer);
				var iconIdx = $(this).index();
				if(iconIdx == currentNum){
					if(isPlay == true){
						timer = setInterval(nextMove, delay);
					} else {
						return;
					}

				} else {
					bannerMove(iconIdx);
				}
			});

			//stop 클릭
			$(".play_stop .stop").on("click", function(e){
				e.preventDefault();
				clearInterval(timer);
				$(this).hide();
				$(".play_stop .play").show();
				isPlay = false;
			});

			//play 클릭
			$(".play_stop .play").on("click", function(e){
				e.preventDefault();
				timer = setInterval(nextMove, delay);
				$(this).hide();
				$(".play_stop .stop").show();
				isPlay = true;
			});

			function nextMove(){
				targetNum = currentNum +1;
				if(targetNum >= bannerLength){
					targetNum = 0;
				}
				bannerMove(targetNum);
			}

			function bannerMove(idx){
				if(isTween){return;}
				isTween = true; //이동불가
				iconReplace(idx);

				banner.eq(currentNum).css("z-index", 0);
				banner.eq(idx).css("z-index", 1).fadeIn(speed, function(){
					banner.eq(currentNum).hide();
					tweenComplete(idx);
				});
			}

			//아이콘 리플레이스
			function iconReplace(idx){
				$(".icon_count a").removeClass("on");
				$(".icon_count a").eq(idx).addClass("on");
			}

			//애니메이트 완료
			function tweenComplete(idx){
				currentNum = idx;
				isTween = false;
				if(isPlay){
					if(timer)clearInterval(timer);
					timer = setInterval(nextMove, delay);
				}
			}
		}

		function todayCookie(){
			var banner_cookie = $.cookie('cookie');

			if(banner_cookie == undefined){//쿠키가없으면
				$(".top_banner_wrap").show();//팝업 열기

				$(".btn_top_bnr_close").on("click", function(e){//팝업 닫기 클릭
					e.preventDefault();

					if($("#today").is(":checked")){
						$.cookie('cookie', 'today', {expires: 1, page:'/'});//메인만 쿠키 1일 설정
						$(".top_banner_wrap").slideUp(400);
					} else {
						$(".top_banner_wrap").slideUp(400);
					}
				});
			}
		}

		initBanner();
		
		if( $.cookie("show_popup") == "false" ) {
			close_popup();
		} else {
			$("#band_banner").show();
		}
	});
	
	function close_popup() {
		$("#band_banner").hide();
	}
	
	function today_close_popup() {
		today = new Date();
		$.cookie( "show_popup", "false", { path: "/", expires : 1 } );
		close_popup();
	}
</script>

<script type="text/javascript">
	function goWiseLogMain(wiselog){
		if(wiselog != undefined && wiselog != 'undefined' && wiselog != ''){
			var f = document.wisefrm;
			f.target="wiseForm";
			f.action = "/common.do?method=wiselog"+wiselog;
			f.submit();
			f.target = "_self";	
		}
	}
</script>
				<div class="nav_wrap" style="z-index:999;">
			<nav class="gnbNav">
	<div id="gnb" class="gnb">
        <ul>
            <!-- <li class="gnb1"><a href="/gameBuy.do?method=gameBuyHome"></a></li> -->
            <li class="gnb1"><a href="javascript:void(0)">복권구매</a>
            	<div class="group">
	            	<ul>
	            		<li class="gnb1_1"><a href="javascript:goLottoBuy(2);" title="새창 열림" onclick="javascript:goWiseLogMain('&wiselog=H_A_1_1');"><strong>로또 6/45</strong><span>매주 토요일 추첨<br>6개 숫자 직접 선택</span></a></li>
	            		<li class="gnb1_2"><a href="javascript:goGame('LD14',2);" title="새창 열림" onclick="javascript:goWiseLogMain('&wiselog=H_A_1_2');"><strong>파워볼</strong><span>5분마다 추첨<br>최고당첨금 3억원</span></a></li>
	            		<li class="gnb1_3"><a href="javascript:goGame('LD10',2);" title="새창 열림" onclick="javascript:goWiseLogMain('&wiselog=H_A_1_3');"><strong>스피드키노</strong><span>5분마다 추첨<br>숫자 10개 일치시 1등</span></a></li>
	            		<li class="gnb1_4"><a href="javascript:goGame('LD11',2);" title="새창 열림" onclick="javascript:goWiseLogMain('&wiselog=H_A_1_4');"><strong>메가빙고</strong><span>7분마다 추첨<br>가장 높은 당첨확률</span></a></li>
	            		<li class="gnb1_5"><a href="javascript:goGame('LI21',2);" title="새창 열림" onclick="javascript:goWiseLogMain('&wiselog=H_A_1_5');"><strong>트리플럭</strong><span>한번에 3게임! 1등 5억원<br>즉석식 긁는 복권</span></a></li>
	            		<li class="gnb1_6"><a href="javascript:goGame('LP72',2);" title="새창 열림" onclick="javascript:goWiseLogMain('&wiselog=H_A_1_6');"><strong>연금복권720+</strong><span>매주 목요일 추첨<br>700만원씩 20년 지급</span></a></li>
	            		<li class="gnb1_7"><a href="javascript:goGame('LI22',2);" title="새창 열림" onclick="javascript:goWiseLogMain('&wiselog=H_A_1_7');"><strong>트레져헌터</strong><span>왕관이 5개 나오면 1등<br>심볼매치형 즉석복권</span></a></li>
	            		<li class="gnb1_8"><a href="javascript:goGame('LI23',2);" title="새창 열림" onclick="javascript:goWiseLogMain('&wiselog=H_A_1_8');"><strong>캐치미</strong><span>당첨금 x 5배 선택가능<br>보너스 게임 기회도~</span></a></li>
	            		<li class="gnb1_9"><a href="javascript:goGame('LD20',2);" title="새창 열림" onclick="javascript:goWiseLogMain('&wiselog=H_A_1_9');"><strong>더블잭마이더스</strong><span>같은 그림이 나오면 당첨<br>구매즉시 당첨확인</span></a></li>
	            		<li class="gnb1_10"><a href="javascript:sample_random_pop('');" title="새창 열림" onclick="javascript:goWiseLogMain('&wiselog=H_A_1_10');"><span>샘플게임 <br>해보기</span></a></li>
	            	</ul>
            	</div>
            </li>
            <li class="basic gnb2"><a href="/gameInfo.do?method=gameMethod&wiselog=H_B_1_1">복권정보</a>
            	<div class="group">
	            	<ul>
	            		<li><a href="/gameInfo.do?method=gameMethod&wiselog=H_B_1_1">로또6/45</a>
		               		<ul class="snb_dep3">
		               			<li><a href="/gameInfo.do?method=gameMethod&wiselog=H_B_1_1">로또 6/45 소개</a></li>
		               		 	<li><a href="/gameInfo.do?method=buyLotto&wiselog=H_B_1_2">구매하기</a></li>
		                   		<li><a href="/gameInfo.do?method=buyInfo&wiselog=H_B_1_3">구매방법</a></li>
		                   		<li><a href="/gameInfo.do?method=lotMethod&wiselog=H_B_1_4">추첨안내</a></li>
		                   		<li><a href="/gameInfo.do?method=statHistory&wiselog=H_B_1_5">로또 히스토리</a></li>
	                		</ul>
	                	</li>
	                	
	                	<li><a href="/gameInfo.do?method=game720Guide&wiselog=H_B_5_1">연금복권720+</a>
	                  		<ul class="snb_dep3">
	                  			<li><a href="/gameInfo.do?method=game720Guide&wiselog=H_B_5_1">연금복권720+ 소개</a></li>
	                      		<li><a href="/gameInfo.do?method=game720Method&wiselog=H_B_5_2">구매하기</a></li>
	                      		<li><a href="/gameInfo.do?method=game720Info&wiselog=H_B_5_3">구매방법</a></li>
	                      		<li><a href="/gameInfo.do?method=game720lotInfo&wiselog=H_B_5_4">추첨안내</a></li>
	                   		</ul>
	                	</li>
	                	<li><a href="/gameInfo.do?method=inetbokBuyInfo&wiselog=H_B_3_1">전자복권</a>
	               			<ul class="snb_dep3">
								<li><a href="/gameInfo.do?method=inetbokBuyInfo&wiselog=H_B_3_1">게임안내</a></li>
								<li><a href="/gameInfo.do?method=lottoMainView&lottoId=LD14&wiselog=H_B_3_2">파워볼</a></li>
								<li><a href="/gameInfo.do?method=lottoMainView&lottoId=LD10&wiselog=H_B_3_3">스피드키노</a></li>
								<li><a href="/gameInfo.do?method=lottoMainView&lottoId=LD11&wiselog=H_B_3_6">메가빙고</a></li>
								<li><a href="/gameInfo.do?method=lottoMainView&lottoId=LI21&wiselog=H_B_3_5">트리플럭</a></li>
								<li><a href="/gameInfo.do?method=lottoMainView&lottoId=LI22&wiselog=H_B_3_4">트레져헌터</a></li>
								<li><a href="/gameInfo.do?method=lottoMainView&lottoId=LD20&wiselog=H_B_3_7">더블잭마이더스</a></li>
								<li><a href="/gameInfo.do?method=lottoMainView&lottoId=LI23&wiselog=H_B_3_8">캐치미</a></li>
							</ul>
	                	</li>
	                	<li><a href="/gameInfo.do?method=speettoGameMethod&wiselog=H_B_4_1">즉석식인쇄복권</a>
							<ul class="snb_dep3">
								<li><a href="/gameInfo.do?method=speettoGameMethod&wiselog=H_B_4_1">즉석식인쇄복권 소개</a></li>
								<li><a href="/gameInfo.do?method=speetto500&wiselog=H_B_4_2">스피또 500</a></li>
								<li><a href="/gameInfo.do?method=speetto1000&wiselog=H_B_4_3">스피또 1000</a></li>
								<li><a href="/gameInfo.do?method=speetto2000&wiselog=H_B_4_4">스피또 2000</a></li>
							</ul>
	                	</li>
	            	</ul>
            	</div>
            </li>
            <li class="basic gnb3"><a href="/gameResult.do?method=byWin&wiselog=H_C_1_1">당첨결과</a>
            	<div class="group">
	            	<ul>
	            		<li><a href="/gameResult.do?method=byWin&wiselog=H_C_1_1">로또6/45</a>
							<ul class="snb_dep3">
								<li><a href="/gameResult.do?method=byWin&wiselog=H_C_1_1">회차별 당첨번호</a></li>
								<li><a href="/gameResult.do?method=myWin&wiselog=H_C_1_2">내번호 당첨확인</a></li>
								<li><a href="/gameResult.do?method=allWin&wiselog=H_C_1_3">당첨내역</a></li>
								<li><a href="/gameResult.do?method=locInfo645&wiselog=H_C_1_4">당첨금 지급안내</a></li>
								<li><a href="/gameResult.do?method=lotTv&wiselog=H_C_1_5">추첨방송 다시보기</a></li>
								<li><a href="/gameResult.do?method=visitWinList&wiselog=H_C_1_6">추첨방송 참관신청</a></li>
							</ul>
	            		</li>
	            		
	            		<li><a href="/gameResult.do?method=win720&wiselog=H_C_9_1">연금복권720+</a>
							<ul class="snb_dep3">
								<li><a href="/gameResult.do?method=win720&wiselog=H_C_9_1">회차별 당첨번호</a></li>
								<li><a href="/gameResult.do?method=myWin720&wiselog=H_C_9_2">내번호 당첨확인</a></li>
								<li><a href="/gameResult.do?method=winResult720&wiselog=H_C_9_3">당첨내역</a></li>
								<li><a href="/gameResult.do?method=locInfo720&wiselog=H_C_9_4">당첨금 지급안내</a></li>
								<li><a href="/gameResult.do?method=lotInfo720&wiselog=H_C_9_5">추첨방송 다시보기</a></li>
								<li><a href="/gameResult.do?method=visitWinList&tabGbn=2&wiselog=H_C_9_6">추첨방송 참관신청</a></li>
							</ul>
	            		</li>
	            		<li><a href="/gameResult.do?method=winList&wiselog=H_C_3_1">전자복권</a></li>
	            		<li><a href="/gameResult.do?method=speettoWin&wiselog=H_C_4_1">즉석식인쇄복권</a>
							<ul class="snb_dep3">
								<li><a href="/gameResult.do?method=speettoWin&wiselog=H_C_4_1">당첨내역</a></li>
								<li><a href="/gameResult.do?method=speettoLotInfo&wiselog=H_C_4_2">당첨금 지급안내</a></li>
							</ul>
	            		</li>
	            		<li><a href="/gameResult.do?method=statIndex&wiselog=H_C_5_1">로또6/45 당첨통계</a>
							<ul class="snb_dep3">
								<li><a href="/gameResult.do?method=statIndex&wiselog=H_C_5_1">당첨통계</a></li>
								<li><a href="/gameResult.do?method=statByNumber&wiselog=H_C_5_2">번호별 통계</a></li>
								<li><a href="/gameResult.do?method=statByColor&wiselog=H_C_5_3">색상 통계</a></li>
								<li><a href="/gameResult.do?method=statGroupNum&wiselog=H_C_5_4">구간별 출현횟수</a></li>
								<li><a href="/gameResult.do?method=noViewNumber&wiselog=H_C_5_5">기간별 미출현 번호</a></li>
								<li><a href="/gameResult.do?method=statOddEven&wiselog=H_C_5_6">홀짝통계</a></li>
								<li><a href="/gameResult.do?method=statConsNumber&wiselog=H_C_5_7">연속번호 출현</a></li>
								<li><a href="/gameResult.do?method=statPattern&wiselog=H_C_5_8">패턴분석표</a></li>
							</ul>
	            		</li>
	            	</ul>
	            	<ul>
	            		
	            		<li><a href="/gameResult.do?method=index720&wiselog=H_C_10_1" class="show_font1">연금복권720+ 당첨통계</a></li>
	            		<li><a href="/gameResult.do?method=highWin&wiselog=H_C_7_1">당첨소식</a>
							<ul class="snb_dep3">
								<li><a href="/gameResult.do?method=highWin&wiselog=H_C_7_1">당첨자 인터뷰</a></li>
								<li><a href="/gameResult.do?method=winTalkList&boardType=T&wiselog=H_C_7_2">당첨 소감 게시판</a></li>
							</ul>
	            		</li>
	            		<li><a href="/gameResult.do?method=notReceiveInfo&wiselog=H_C_8_1">미수령 당첨금</a>
							<ul class="snb_dep3">
								<li><a href="/gameResult.do?method=notReceiveInfo&wiselog=H_C_8_1">로또6/45</a></li>
								
								<li><a href="/gameResult.do?method=noRecieveInfo720">연금복권720+</a></li>
								<li><a href="/gameResult.do?method=notReceiveInfoElec&wiselog=H_C_8_3">전자복권</a></li>
								<li><a href="/gameResult.do?method=speetoNoGetList&wiselog=H_C_8_4">즉석식 인쇄복권</a></li>
							</ul>
	            		</li>
	            	</ul>
            	</div>
            </li>
            <li class="basic gnb4"><a href="/store.do?method=sellerInfo645&wiselog=H_D_1_1">판매점</a>
            	<div class="group">
	            	<ul>
	            		<li><a href="/store.do?method=sellerInfo645&wiselog=H_D_1_1">구입처 안내</a>
							<ul class="snb_dep3">
								<li><a href="/store.do?method=sellerInfo645&wiselog=H_D_1_1">로또6/45판매점 조회</a></li>
								<li><a href="/store.do?method=sellerInfoPrint&wiselog=H_D_1_2">즉석 및 연금복권 판매점 조회</a></li>
							</ul>
	            		</li>
	            		<li><a href="/store.do?method=topStore&pageGubun=L645&wiselog=H_D_2_1">당첨 판매점</a>
							<ul class="snb_dep3">
								<li><a href="/store.do?method=topStore&pageGubun=L645&wiselog=H_D_2_1">회차별</a></li>
								<!-- 
								<li><a href="/store.do?method=topStoreRank&rank=1&pageGubun=L645&wiselog=H_D_2_2">1등 배출점</a></li>
								<li><a href="/store.do?method=topStoreRank&rank=2&pageGubun=L645&wiselog=H_D_2_3">2등 배출점</a></li>
								-->
							</ul>
	            		</li>
	            	</ul>
	            </div>
            </li>
            <li class="basic gnb5"><a href="/event.do?method=Eventend&wiselog=H_E_1_1">이벤트</a>
            	<div class="group">
	            	<ul>
	            		<li><a href="/event.do?method=Eventend&wiselog=H_E_1_1">이벤트</a></li>
	            	</ul>
	            </div>
            </li>
			<li class="basic gnb6"><a href="/counsel.do?method=knowledge&wiselog=H_F_1_1">행복공감</a>
				<div class="group">
					<ul>
						<li><a href="/counsel.do?method=knowledge&wiselog=H_F_1_1">건전한 복권문화</a>
							<ul class="snb_dep3">
								<li><a href="/counsel.do?method=knowledge&wiselog=H_F_1_1">복권바로알기</a></li>
								<li><a href="/happy.do?method=healthCultureProc&wiselog=H_F_1_2">건전구매 프로그램</a></li>
								<li><a href="/user.do?method=campainVow&wiselog=H_F_1_3">건전화 캠페인</a></li>
								<li><a href="/happy.do?method=healthCultureRule&wiselog=H_F_1_4">건전화 책임규정</a></li>
								<li><a href="/happy.do?method=healthCulturePrevent&wiselog=H_F_1_5">복권 과몰입 예방법</a></li>
								<li><a href="/happy.do?method=counselInfo&wiselog=H_F_1_6">중독예방 및 상담안내</a></li>
							</ul>
						</li>
						<li><a href="/happy.do?method=fundInfo&wiselog=H_F_2_1">복권기금</a>
							<ul class="snb_dep3">
								<li><a href="/happy.do?method=fundInfo&wiselog=H_F_2_1">복권기금소개</a></li>
								<li><a href="/happy.do?method=fundAdvance&wiselog=H_F_2_2">기금사업활동</a></li>
							</ul>
						</li>
						<li><a href="/happy.do?method=happySympathyService&wiselog=H_F_3_1">행복공감봉사단</a></li>
						<li><a href="/happy.do?method=fundArchiveList&wiselog=H_F_4_1">홍보센터</a>
							<ul class="snb_dep3">
								<li><a href="/happy.do?method=fundArchiveList&wiselog=H_F_4_1">광고</a></li>
								<li><a href="/happy.do?method=fundPressPrList&wiselog=H_F_4_1">보도자료</a></li>
								<li><a href="/service.do?method=noticeList&wiselog=H_F_4_1">공지사항</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</li>
		</ul>
	</div>
</nav>
</div>

</div>	




<div>

<div id="article" class="contentSection main_section ver2">
	<div class="wrap_box wrap1">
		<section class="box win win645">
			<header>
				<h2>로또 6/45</h2>
				
			</header>
			<div class="content">
				<h3><a id="goByWin1" href="/gameResult.do?method=byWin&wiselog=C_A_1_1"><strong id="lottoDrwNo">932</strong>회 <span class="txt">당첨결과</span> <span class="date" id="drwNoDate">2020-10-10</span></a></h3>
				<p class="num"><a id="numView" href="/gameResult.do?method=byWin&wiselog=C_A_1_1">
					<span class="accessibility">당첨번호</span>
					<span id="drwtNo1" class="ball_645 ball1">1</span>
					<span id="drwtNo2" class="ball_645 ball1">6</span>
					<span id="drwtNo3" class="ball_645 ball2">15</span>
					<span id="drwtNo4" class="ball_645 ball4">36</span>
					<span id="drwtNo5" class="ball_645 ball4">37</span>
					<span id="drwtNo6" class="ball_645 ball4">38</span>
					<span class="bonus">보너스번호</span>
					<span id="bnusNo" class="ball_645 ball1">5</span>
				</a></p>
				
				<div id="winnerId">
				
					
						
						
						
						
						
				
				<dl class="result">
					<dt>1등 총 당첨금</dt>
					<dd><strong>237억원</strong>(7명 / 34억)</dd>
				</dl>
				
				
				
				</div>
				<a class="go prev" href="javascript:getLottoNumber('before');">이전 회차 당첨정보 보기</a>
                <a class="go next" href="javascript:getLottoNumber('');">다음 회차 당첨정보 보기</a>
				<div class="btn">
					<span class="area"><a class="btn_common smid" href="/gameResult.do?method=byWin&wiselog=C_A_1_2">회차별 당첨결과</a></span>
					<span class="area"><a class="btn_common smid gblu" href="/gameInfo.do?method=buyLotto&wiselog=C_A_1_3">구매하기</a></span>
				</div>
				
			</div>
		</section>
		<!-- 190225 신규 마크업 시작 -->
		<section class="box win win520" style="display:none" id="win520">
			<header>
				<h2>연금복권 520</h2>
				<ul class="sns">
					<li class="s1"><a href="javascript:openSNS520(1);" title="새 창">연금복권 520 461회 당첨결과 페이스북으로 공유하기</a></li>
					<li class="s2"><a href="javascript:openSNS520(2);" title="새 창">연금복권 520 461회 당첨결과 트위터로 공유하기</a></li>
				</ul>
			</header>
			<div class="content">
				<h3><a href="/gameResult.do?method=win520&wiselog=C_A_2_1"><span id="drwNo520">461</span>회 당첨결과</a></h3>
				<span id="drawDate" class="date"></span>
				<div id="number520" class="nums">
					                       
                    <p class="num"><a href="/gameResult.do?method=win520&wiselog=C_A_2_1">
						<span class="accessibility">1등 첫번째 번호</span>
						<span class="s">4조</span>
						<span class="n">2</span>
						<span class="n">4</span>
						<span class="n">5</span>
						<span class="n">5</span>
						<span class="n">8</span>
						<span class="n">6</span>
                    </a></p>
                                           
                    <p class="num"><a href="/gameResult.do?method=win520&wiselog=C_A_2_1">
						<span class="accessibility">1등 첫번째 번호</span>
						<span class="s">5조</span>
						<span class="n">5</span>
						<span class="n">5</span>
						<span class="n">4</span>
						<span class="n">7</span>
						<span class="n">1</span>
						<span class="n">1</span>
                    </a></p>
                    
                </div>
				<div class="info-rank">
					<span><strong>1등</strong>매달 500만원씩 20년 지급</span>
				</div>
				<a class="go prev" href="javascript:get520Number('before')">이전 회차 당첨정보 보기</a>
				<a class="go next" href="javascript:get520Number('')">다음 회차 당첨정보 보기</a>
				<img src="/images/main/img_lottery_win520.png" alt="월 500만원 * 20년 / 2매" />
				<div class="btn">
					<a class="btn_common smid" href="/gameResult.do?method=win520&wiselog=C_A_2_2">회차별 당첨결과</a>
					<a class="btn_common smid gblu" href="/gameInfo.do?method=game520Method&wiselog=C_A_2_3">구매하기</a>
				</div>
			</div>
		</section>
		
		<!-- 연금복권 720 Start-->
		<section class="box win win720" id="win720">
			<header>
				<h2>연금복권720+</h2>
			</header>
			
			<div id="tipRolling">	
				<dl class="rolling_tip">
					<dt>구매팁!</dt>
					<dd>
						<div id="tip_list">
							<ul>
								
									<li>24회차 판매마감까지 앞으로 4일!</li>		
										
								<li>모든 조 구매 시 1, 2등 동시 당첨 가능(총 당첨금 21.6억원)</li>
								<li>판매점, 인터넷 동일한 세트 구매 시 총 당첨금 43.2억원</li>
								<li>원하는 번호가 있다면 지금 바로 구매하기!</li>
								<li>세트구매란? 동일한 6자리 번호를 1조~5조까지 모두 구입</li>
								<li>로또6/45보다 1.6배 높은 당첨 기회</li>	
                                <li>안정적인 생활을 위한 연금복권720+</li>
								<li>모든 조 구매 시 매월 1,100만원 x 10년 + 700만원 10년</li>
							</ul>
						</div>
					</dd>
				</dl>
			</div>
			
			<div class="content">
				<h3><a href="/gameResult.do?method=win720&wiselog=C_A_4_1"><strong id="drwNo720">23</strong>회 <span class="txt">당첨결과</span>
				<span id="drawDate720" class="date"></span></a>
				</h3>
				<!-- 1등 -->
				<div id="number720add">
				 
				
				<div class="win_num_wrap" id="">
					
					<dl class="win_money">
						<dt>1등</dt>
						<dd>월 <span class="num">700</span>만원 x <span class="num">20</span>년</dd>
					</dl>
					
					
					<div class="win720_num">
						
						<div class="group">
							<span class="num"><span>4</span></span>
							<em>조</em>
						</div>
						
						<span class="num al720_color1"><span>1</span></span>
						<span class="num al720_color2"><span>5</span></span>
						<span class="num al720_color3"><span>8</span></span>
						<span class="num al720_color4"><span>0</span></span>
						<span class="num al720_color5"><span>7</span></span>
						<span class="num al720_color6"><span>1</span></span>
					</div>
					
					
				</div>
				
				
				 
				
				<div class="win_num_wrap" id="">
					
					
					<dl class="win_money">
						<dt>2등</dt>
						<dd>월 <span class="num">100</span>만원 x <span class="num">10</span>년</dd>
					</dl>
					
					<div class="win720_num">
						
						<span class="num al720_color1"><span>1</span></span>
						<span class="num al720_color2"><span>5</span></span>
						<span class="num al720_color3"><span>8</span></span>
						<span class="num al720_color4"><span>0</span></span>
						<span class="num al720_color5"><span>7</span></span>
						<span class="num al720_color6"><span>1</span></span>
					</div>
					
					
				</div>
				
				
				 
				
				
				 
				
				
				 
				
				
				 
				
				
				 
				
				
				 
				
				
				<div class="win_num_wrap tb_line">
					<dl class="win_money">
						<dt>보너스</dt>
						<dd>월 <span class="num">100</span>만원 x <span class="num">10</span>년</dd>
					</dl>
					<div class="win720_num">
						<div class="group bonus">
							<span class="num"><span>각</span></span>
							<em>조</em>
						</div>
						<span class="num al720_color1"><span>7</span></span>
						<span class="num al720_color2"><span>2</span></span>
						<span class="num al720_color3"><span>6</span></span>
						<span class="num al720_color4"><span>9</span></span>
						<span class="num al720_color5"><span>9</span></span>
						<span class="num al720_color6"><span>0</span></span>
					</div>
				</div>
				
				
				</div>
				<!-- 버튼 -->
				<a class="go prev" href="javascript:get720Number('before')">이전 회차 당첨정보 보기</a>
				<a class="go next" href="javascript:get720Number('')">다음 회차 당첨정보 보기</a>
				<div class="btn">
				
					<span class="area"><a class="btn_common smid navy" href="/gameResult.do?method=highWin&wiselog=C_D_3_8">당첨자 인터뷰 보기</a></span>
					<span class="area"><a class="btn_common smid" href="/gameResult.do?method=win720&wiselog=C_A_4_2">회차별 당첨결과</a></span>
					<span class="area"><a class="btn_common smid gblu" href="/gameInfo.do?method=game720Method&wiselog=C_A_4_3">구매하기</a></span>
				</div>
			</div>
		</section>
		<!-- 연금복권 720 END -->
		<!-- 연금복권 720 Start-->
		<section class="box win win720" style="background-image:url(/images/main/main.png); no-repeat; display:none;" id="win720_img">
			
			<header>
				<h2 style="color:#000;">연금복권720+</h2>
			</header> 
			<div class="content">
				<div class="btn" style="margin-left: 350px; margin-top:323px;">
					<span class="area"><a class="btn_common smid gblu" href="/gameInfo.do?method=game720Method&wiselog=C_A_4_3">구매하기</a></span>
				</div>
			</div>
			<!-- </a> -->
		</section>
		<!-- 연금복권 720 END -->
		<section class="box speetto-new win">
			<header>
				<h2>즉석식 인쇄복권</h2>
			</header>
			<div class="content">
				<!-- 190318 slide영역으로 변경 -->
				<div class="slick_slide spt_group">
					<div class="slide_inner">
						
							<div class="slide_item">
								<h3><a href="#">판매/당첨 현황</a></h3>
								
								<span class="date">[2020-10-08]</span>
								<div id="speetto2000" class="speetto-result">
									<strong class="tit">스피또 2000 <span>35</span>회</strong>
									<!-- 190313 스피또 복권이미지영역 마크업 추가 -->
									<div class="img_area">
										
										<img src="${path}/resources/img/1601877506133.png" alt="스피또 복권 이미지" />
									</div>
									<!-- //190313 스피또 복권이미지영역 마크업 추가 -->
									<div class="quantity">
										<strong class="tit">남은 수량</strong>
										<a href="/gameResult.do?method=speettoWin&lottoId=SP2000&wiselog=C_A_3_1">
											<ul>
												<li class="li1"><strong>1등 10억</strong><span><em class="num">6</em> 매</span></li>
												<li class="li2"><strong>2등 1억</strong><span><em class="num">18</em> 매</span></li>
												<li class="li3"><strong>3등 천백</strong><span><em class="num">150</em> 매</span></li>
												<li class="li4"><strong>출고율</strong><span><em class="num">24.0</em> %</span></li>
											</ul>
										</a>
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
		</section>
		<script type="text/javascript">
$(".spt_group .slide_inner").slick({
	slidesToShow: 1,
    infinite: true,
    arrows: true
});
</script>
		</div>
		</div>
		
</div>
</body>
<br><br><br><br>
<%@ include file="/WEB-INF/views/footer.jsp" %>



</html>
