<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link href="${path}/resources/css/layout.css" rel="stylesheet"/>
<link href="${path}/resources/css/default.css" rel="stylesheet"/> 
<link href="${path}/resources/css/al720.css" rel="stylesheet"/> 
<link href="${path}/resources/css/common.css" rel="stylesheet"/>
<link href="${path}/resources/css/main.css" rel="stylesheet"/>
<link href="${path}/resources/css/reset.css" rel="stylesheet"/>
<link href="${path}/resources/css/style.css" rel="stylesheet"/>
<link href="${path}/resources/css/SpoqaHanSans-kr.css" rel="stylesheet"/>    
<link href="${path}/resources/css/jecss.css" rel="stylesheet"/>
<script type="text/javascript" src="${path}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="${path}/resources/js/common.js" charset="utf-8"></script>            
</head>
<body>

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
<header class="topHeader">
	<!-- 배너 -->
	<div id="band_banner"></div>

	<div class="header_con">
	   	<div class="logo">
			<h1><a href="index">동행복권</a></h1>
	    </div>
		<div class="top_menu">
			
<script type="text/javascript" src="/js/link.js" charset="utf-8"></script>
<form name="frmLogin">
	<div class="topAccount">
	
		
		
			<ul class="account">
				<li class="log"><a class="btn_common sml" href="login">로그인</a></li>
				<li class="devide"><a class="btn_common sml blu" href="/loginJoin.do?method=joinFormAgree">회원가입</a></li>
				<li><a class="btn_common sml gblu" href="/userSsl.do?method=myPage">마이페이지</a></li>
				<li><a class="btn_common sml gblu" href="/counsel.do?method=callCenter">고객센터</a></li>
			</ul>
		
	
</div>
</form>






		</div>
	</div>
	<div>


	
		

				<div class="nav_wrap" style="z-index:999;">
			<nav class="gnbNav">
	<div id="gnb" class="gnb">
        <ul>
            <!-- <li class="gnb1"><a href="/gameBuy.do?method=gameBuyHome"></a></li> -->
            <li class="gnb1"><a href="process">복권구매</a>
            	<div class="group" style="display:block;">
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
</header>
</body>
</html>