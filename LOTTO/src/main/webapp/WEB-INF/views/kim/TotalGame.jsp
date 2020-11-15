<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>로또645</title>
    <meta name="viewport" content="width=1164,initial-scale=1,user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="google" value="notranslate" />
	<meta name="google" content="notranslate" />
    <meta http-equiv="pics-label" content='(PICS-1.1 "http://www.safenet.ne.kr/rating.do" l gen false for " http://el.dhlottery.co.kr " r  (n  0  s  0  v  0  l  0  i  1  h  0 ))'>    
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" >
	<meta http-equiv="Expires" content="-1">	
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cash-Control" content="no-cache">
	
	<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
	<link rel="icon" href="./img/favicon.ico" type="image/x-icon"> 

	<script type="text/javascript" src="./js/jquery-1.7.1.min.js"></script>
	
    <link rel="stylesheet" type="text/css" href="./game_res/fonts.css">
    <link rel="stylesheet" type="text/css" href="./game_res/style.css?v=1.1">
    
    <script type="text/javascript">

	var filter = 'win16|win32|win64|macintel';
	var currentLottoId = 'LO40';
	var leftOverId = "";
	
	//고액당첨 미수령 건
	var highPrizeFlag = false;
	var unloadchk = false;
	  
	//게임창 과몰입 방지 레이어용 카운트 스크립트 샘플 추가 180921
	var limit = 3600;
	var counter;
	var videoCheck = true; 
	
	var youTubePlayer;
	
	//const videoUrl = "//www.youtube.com/embed/zGDcyXFW1NA";
	
	if (navigator.platform && !(filter.indexOf(navigator.platform.toLowerCase()) >= 0)) {
		location.href = 'https://m.dhlottery.co.kr/';
	}

	//window.onbeforeunload = function (evt) {
    	//opener.document.location.href = opener.document.URL; 
    //}

	if (sessionStorage.getItem("limitTime") != null) {
		limit = sessionStorage.getItem("limitTime")*1;
	}
	
	function changeView(lottoId, pop){
			
		if(!document.getElementById("checkAgr").checked){
			alert("약관에 동의해주세요    ");
			return;
		}

		if(document.getElementById("newPop").checked ==  true){
			var url = "/game/TotalGame.jsp?LottoId="+lottoId+"&kind=1";
			positionNewWin(url, "UNIFYGAME_" + lottoId, 1010, 752, window.screenLeft-30, window.screenTop);
			document.getElementById("newPop").checked = false;
		}else{
			document.location.href="TotalGame.jsp?LottoId="+lottoId;	
		}
	}

	function tabview(lottoId){
	
		var sessionId = 'showtan89';
		var vGameTitle = "";
	
		//로그인 실패
		if(sessionId == null || sessionId == "null" || sessionId == "" ){
			// ifrm_tab.document.location.href = "/game/login.jsp?lottoId="+lottoId; 2013.11.13 이은상
			//alert("로그인 세션이 해제 되었습니다.\n다시 한번 로그인해 주시기 바랍니다.");
			alert("로그인 후 30분 이상 게임을 이용하지 않으셨습니다. \n 고객님의 보안을 위해서 게임 세션을 종료하였으니 \n 포털에서 다시 로그인 후 이용하여 주시기 바랍니다.");
			self.close();
			// return; 2013.11.13 이은상
		}
	
		$("#leftOverId").val(lottoId);

		if($("#newPop").attr("checked")){	
			//새창 check 처리
			var url = "/game/TotalGame.jsp?LottoId="+lottoId+"&kind=1";
			positionNewWin(url, "UNIFYGAME_" + lottoId, 1164, 646, window.screenLeft-30, window.screenTop);
			$("#newPop").attr("checked", false);
			return;
		}else{
			if(currentLottoId == 'LO40') {
				location.href = '/game/TotalGame.jsp?LottoId='+lottoId;
			} else {
				//TLUCK
				if(lottoId == 'LI21'){
					if('true' == 'true'){
						//ifrm_tab.document.location.href = "/game/tluck/game.jsp";
						$('#ifrm_tab').attr('src', "/game/tluck/game.jsp");
					}else{
						ifrm_tab.document.location.href = "/game/non.jsp";
	//					baseUrl = "/game/pension/non.jsp";
					}
					/* $("ifrm_tab").attr("src","/game/tluck/game.jsp"); */
					$(document).attr("title","트리플럭");
				//DJACK
				}else if(lottoId == 'LD20'){
					if('true' == 'true'){
						//ifrm_tab.document.location.href = "/game/double2/game.jsp";
						$('#ifrm_tab').attr('src', "/game/double2/game.jsp");
					}else{
						ifrm_tab.document.location.href = "/game/non.jsp";
	//					baseUrl = "/game/pension/non.jsp";
					}
					$(document).attr("title","더블잭마이더스");
				//THUNT
				}else if(lottoId == 'LI22'){
					if('true' == 'true'){
						//ifrm_tab.document.location.href = "/game/thunt/game.jsp";
						$('#ifrm_tab').attr('src', "/game/thunt/game.jsp");
					}else{
						ifrm_tab.document.location.href = "/game/non.jsp";
	//					baseUrl = "/game/pension/non.jsp";
					}
					$(document).attr("title","트레져헌터");
				//KENO
				}else if(lottoId == 'LD10'){
					if('true' == 'true'){
						//ifrm_tab.document.location.href = "/game/keno/game.jsp";
						$('#ifrm_tab').attr('src', "/game/keno/game.jsp");
					}else{
						ifrm_tab.document.location.href = "/game/non.jsp";
	//					baseUrl = "/game/pension/non.jsp";
					}
					$(document).attr("title","스피드키노");
				//BINGO
				}else if(lottoId == 'LD11'){
					if('true' == 'true'){
						//ifrm_tab.document.location.href = "/game/bingo/game.jsp";
						$('#ifrm_tab').attr('src', "/game/bingo/game.jsp");
					}else{
						ifrm_tab.document.location.href = "/game/non.jsp";
	//					baseUrl = "/game/pension/non.jsp";
					}
					$(document).attr("title","메가빙고");
				//POWER
				}else if(lottoId == 'LD14'){
					if('true' == 'true'){
						//ifrm_tab.document.location.href = "/game/powerball/game.jsp";
						$('#ifrm_tab').attr('src', "/game/powerball/game.jsp");
					}else{
						ifrm_tab.document.location.href = "/game/non.jsp";
	//					baseUrl = "/game/pension/non.jsp";
					}
					$(document).attr("title","파워볼");
				//PENSION520
				/* 
				}else if(lottoId == 'LP32'){
					//ifrm_tab.document.location.href = "/lotto520.do?method=redirectPage";
					$('#ifrm_tab').attr('src', "/lotto520.do?method=redirectPage");
	//				baseUrl = "/lotto520.do?method=redirectPage";
					$(document).attr("title","연금복권520"); */
				//PENSION720
				}else if(lottoId == 'LP72'){
					//ifrm_tab.document.location.href = "/lotto520.do?method=redirectPage";
					$('#ifrm_tab').attr('src', "/game/pension720/game.jsp");
	//				baseUrl = "/lotto520.do?method=redirectPage";
					$(document).attr("title","연금복권720");
				//CATCH 
				}else if(lottoId == 'LI23'){
					if('true' == 'true'){
						//ifrm_tab.document.location.href = "/game/catch/game.jsp";
						$('#ifrm_tab').attr('src', "/game/catch/game.jsp");
					}else{
						ifrm_tab.document.location.href = "/game/non.jsp";
	//					baseUrl = "/game/pension/non.jsp";
					}
					$(document).attr("title","캐치미");
				//온라인복권 
				}else if(lottoId == 'LO40'){
					//ifrm_tab.document.location.href = "https://ol.dhlottery.co.kr/olotto/game/game645.do";
					$('#ifrm_tab').attr('src', "https://ol.dhlottery.co.kr/olotto/game/game645.do");
					$(document).attr("title","온라인복권");
				}
			
				currentLottoId = lottoId;
			
				tabRollover();	//Tab Image rollover
				
				if(lottoId != 'LO40' && lottoId != 'LP72'){
					highPrizeChk();	
				}

				if(currentLottoId == 'LO40' || currentLottoId == 'LP72'){
					closeHighPrize();	
				}			
			}
			return;
		}
	}

	//새창 팝업 설정
	function positionNewWin(url, winName, width, height, left, top) {
  		var info = 'left=' + left + ',top=' + top + ',width='  + width + ',height=' + height + ',resizable=no,scrollbars=no,menubars=no,status=no';
  		var newwin = window.open(url, winName, info);
  			newwin.focus();
  		return newwin;
	}

	/**Left Menu rollOver*/
	function tabRollover(){
	
		leftOverId = "tab_" + $("#leftOverId").val();
	
		//$('#tab_LP32').attr("src", $('#tab_LP32').attr("src").replace("_on", "_off"));
		$('#tab_LP72').attr("src", $('#tab_LP72').attr("src").replace("_on", "_off"));
		$('#tab_LD10').attr("src", $('#tab_LD10').attr("src").replace("_on", "_off"));
		$('#tab_LI22').attr("src", $('#tab_LI22').attr("src").replace("_on", "_off"));
		$('#tab_LD14').attr("src", $('#tab_LD14').attr("src").replace("_on", "_off"));
		$('#tab_LD11').attr("src", $('#tab_LD11').attr("src").replace("_on", "_off"));
		$('#tab_LI21').attr("src", $('#tab_LI21').attr("src").replace("_on", "_off"));
		$('#tab_LD20').attr("src", $('#tab_LD20').attr("src").replace("_on", "_off"));
		$('#tab_LI23').attr("src", $('#tab_LI23').attr("src").replace("_on", "_off"));
	//	$('#tab_LO40').attr("src", $('#tab_LO40').attr("src").replace("_on", "_off"));
	
		$("#"+leftOverId).attr("src", $("#" + leftOverId).attr("src").replace("_off", "_on"));
	
	// 	if($("#leftOverId").val() != "LI21"){
	// 		$(".game_btn").html("<a href='javascript:statPop();'><img src='/lotto/images/game/menu/buy_btn_"+$("#leftOverId").val()+".jpg' order='0' /></a>");
	// 	}else{
	// 		$(".game_btn").html("");
	// 	}
	
		//오늘의 구매액 새로고침
		buyLimitMoney();
		
		$('#container nav ul li img').hover(		
			function(){
				this.src = this.src.replace("_off", "_on"); 
				$("#"+leftOverId).attr("src", $("#" + leftOverId).attr("src").replace("_off", "_on"));
			},
			function(){
				this.src = this.src.replace("_on", "_off");
				$("#"+leftOverId).attr("src", $("#" + leftOverId).attr("src").replace("_off", "_on"));
			}
		);
	}

	//팝업
	function commonPop(pageName, url, width, height, scrollYN){
		var windowW = width;
		var windowH = height;
		var left = Math.ceil((window.screen.width - windowW) / 2);
		var top = Math.ceil((window.screen.height - windowH) / 2);
	
		window.open(url, pageName,'left='+left+',top='+top+',width='+windowW+',height='+windowH+',scrollbars='+scrollYN);
	}

	//구매가능금액 ajax 통신
	function buyLimitMoney(){
		$.ajax({
			url: "/customer.do?method=buyLimitMoney",
			dataType: 'json',
			type:'POST',
			cashe:false,
			contentType:"application/json; charset=euc-kr",
			success: function(data){        		// 성공했을때 콜백함수
				$(".display").html(data.dayBuyAmt + "원");
			},
			error : function(data){
				$(".display").html("조회실패");
			}
		});
	}

	//게임접속시간 초기화
	function timerLoad() {	
		sessionStorage.setItem("limitTime", limit);
		counter = setInterval(timer, 1000);
	}
	
	//게임접속시간
	function timer() {	
		
	    limit = limit - 1;
	    sessionStorage.setItem("limitTime", limit);

	    if (limit == -1) {
	        clearInterval(counter);
	        //건전화 (게임 1시간 이상 이용정보 등록)
	        $.ajax({
    			url: "/customer.do?method=gameBreakTime&regLoad=HOUR",
    			dataType: 'json',
    			type:'POST',
    			cashe:false,
    			contentType:"application/json; charset=euc-kr",
    			success: function(data){
    			},
    			error : function(data){
    			}
    		});	
	        //구매페이지 진입시 동영상 팝업 제공하는 것으로 ..
	        videoCheck = true; 
	        $("#popAlert").show(); 
	        return;
	    } 
	    else {
	    	//타이아웃 버그 수정
	    	if(limit < -1){
	    		clearInterval(counter);
	    		$("#timer").html("00 : 00");
	    	} 
	    	else {
	    		var seconds = limit % 60;
			    var minutes = Math.floor(limit / 60);
			    minutes %= 60;
			    if (seconds < 10) {seconds = "0" + seconds};
			    if (minutes < 10) {minutes = "0" + minutes};
			    $("#timer").html(minutes + " : " + seconds);		
	    	}	    	
	    }
	}
	
    //Youtube API 로드
	function setYouTubeApi(){
    	var tag = document.createElement('script');
    		tag.src = "https://www.youtube.com/iframe_api";
    		
    	var firstScriptTag = document.getElementsByTagName('script')[0];
    		firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
    }

    /**
     * onYouTubeIframeAPIReady 함수는 필수로 구현해야 한다.
     * 플레이어 API에 대한 JavaScript 다운로드 완료 시 API가 이 함수 호출한다.
     * 페이지 로드 시 표시할 플레이어 개체를 만들어야 한다.
     */
    function onYouTubeIframeAPIReady() {
    	youTubePlayer = new YT.Player('videoBreakTime', {
//            height: '315',            // <iframe> 태그 지정시 필요없음
//            width: '560',             // <iframe> 태그 지정시 필요없음
//			videoId : 'zGDcyXFW1NA',
		   	playerVars: {           
			  	controls:'2'			//재생컨트롤 노출여부
            }
          , events: {
                'onReady': onPlayerReady,               // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
            }
        });
    }
    
 	//플레이어 자동실행 (주의: 모바일에서는 자동실행되지 않음)
    function onPlayerReady(event) {        
        //event.target.playVideo();
    }
    
    //var playerState;
    function onPlayerStateChange(event) {
        //event.data == YT.PlayerState.ENDED ? '종료됨' :
        //event.data == YT.PlayerState.PLAYING ? '재생 중' :
        //event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
        //event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
        //event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
        //event.data == -1 ? '시작되지 않음' : '예외';
        
		//건전화 이용내역 ajax 통신 영상 시청 완료
      	if(event.data == YT.PlayerState.ENDED){
      		endBreakTime();	
      	} 	
    	//console.log("youTubePlayer.getCurrentTime : "+ youTubePlayer.getCurrentTime());
    	//console.log("youTubePlayer.getDuration : "+ youTubePlayer.getDuration());
    }
	
    //건전화 영상 교육 완료
    function endBreakTime(){
    	videoCheck = false;
	    $.ajax({
			url: "/customer.do?method=gameBreakTime&regLoad=ENDED",
			dataType: 'json',
			type:'POST',
			cashe:false,
			contentType:"application/json; charset=euc-kr",
			success: function(data){
			},
			error : function(data){
			}
		});	
    }
    
	//건전화 이용내역 ajax 통신
	function gameBreakTime(){
		$.ajax({
			url: "/customer.do?method=gameBreakTime",
			dataType: 'json',
			type:'POST',
			cashe:false,
			contentType:"application/json; charset=euc-kr",
			success: function(data){
				if(data.breakTime > 0){									
					$("#popAlert").show();	//과몰입고객
				} else {
					videoCheck = false;			
				}
			},
			error : function(data){
				//조회실패
			}
		});		
	}	
  
	function gameBreakClose(){
		if(videoCheck){
			//동영상 33초 이상 교육인정 처리
			if(youTubePlayer.getCurrentTime() > 33){
				endBreakTime();
				$("#popAlert").hide();
			} else {
				alert("건전화 컨텐츠 영상을 재생 완료 후에 계속 이용 가능합니다.");		
			}			
		} 
		else {
			$("#popAlert").hide();
		}		
	}
	
	//고액당첨 미수령 건이 있는지 확인 후 팝업 
	function highPrizeChk(){
		var bool = false;  	
	  	$.ajax({
	  		type:"post",
	  		url:"/game/noReceiveCount.jsp",
	  		contentType: "application/x-www-form-urlencoded; charset=euc-kr",   //파라미터 넘길때 한글깨짐방지
	  		dataType:"json",
	  	    timeout : 3000, //제한시간 지정
	  	    cache : false,  //true, false
	  		success: function(data){
	  			if(parseInt(data.cnt) > 0){	
	  				// 레이어 생성
	  				highPrizeFlag = true;
	  				$("#popAlertHighPrizeDeposit").show();
	  			}else if(parseInt(data.cnt) == 0){
	  				highPrizeFlag = false;
	  				$("#popAlertHighPrizeDeposit").hide();
	  			}else {
	  				alert("미수령당첨금 조회가 되지 않습니다.");
	  			  	self.close();	
	  			}
	  		},
	  		error: function() {
	  		}
	  	});
	  	return bool;
	}
	
	function goHighPrize(){	
		opener.location.href = "https://www.dhlottery.co.kr//myPage.do?method=highPrizeWinnerListView";
	  	unloadchk = true;
	  	self.close();	
	}
	  
	function closeHighPrize(){	
		$("#popAlertHighPrizeDeposit").hide();
	}	

	/*
	$(window).on("beforeunload", function() { 
	    var confirmMsg = "미수령 당첨금이 있습니다.\n미수령 당첨금 안내를 확인해 주세요."; 
	    if(highPrizeFlag){
	    	$("#popAlertHighPrizeDeposit").show();
	   		if(!unloadchk) {
	   			//(e || window.event).returnValue = confirmMsg;
	   			return confirmMsg;
	   		}
	    }
	})
	*/

	function pageMove(url) {
		var userAgent = window.navigator.userAgent.toLowerCase();
		var browser;		
		if(userAgent.indexOf("chrome") > -1) {
			browser = "chrome";			
			if(userAgent.indexOf("edge") > -1) {
				browser = "edge";
			}
		}		
		if(browser == "chrome" || browser == "edge") {
			window.open(url);
			return false;
		}		
		window.opener.focus();
		window.opener.location.href = url;		
	}

	function jsCampainTest(){
		alert("복권 과몰입 자가진단테스트 화면으로 이동합니다.");	
		window.open("https://www.dhlottery.co.kr//myPage.do?method=campainTestPlay1");
	}
	
	$(document).ready(function(){
		
		$('#tab_' + currentLottoId ).attr("src", $('#tab_'+currentLottoId).attr("src").replace("_off", "_on"));
		
		buyLimitMoney();	//구입가능 금액 표시
		
		setYouTubeApi();	//과몰입 예방 교육 영상
		
		gameBreakTime();	//과몰입고객 여부(1시간 이용) 구매페이지 접속시 노출
		
		//고액당첨 미수령 건
		if(currentLottoId != 'LO40' && currentLottoId != 'LP72'){
			highPrizeChk();	
		}
		
		//오늘의 구매액 새로고침 btn
		$("#buy_limit_reload").bind("click", function(){
			buyLimitMoney();
		});		
		
		timerLoad();
	});	
	
	
	$(document).on("contextmenu dragstart selectstart",function(e){
        return false;
    });	
</script>
</head>
<body>
<input type="hidden" name="leftOverId" id="leftOverId" value="LO40"/>
<input type="hidden" name="userId" id="userId" value="showtan89"/>
<div id="container">
	<nav>
		<ul>
			<li>
                <a href='javascript:tabview("LP72");'>
                    <img src='/game_res/web/menu/game720_off.png?v=1.0' id="tab_LP72" alt='연금복권720' />
                </a>
            </li><li>
                <a href='javascript:tabview("LD14");'>
                    <img src='/game_res/web/menu/powerBall_off.png?v=1.0' id="tab_LD14" alt='파워볼' />
                </a>
            </li><li>
                <a href='javascript:tabview("LD10");'>
                    <img src='/game_res/web/menu/speedKeno_off.png?v=1.0' id="tab_LD10" alt='스피드키노' />
                </a>
            </li><li>
                <a href='javascript:tabview("LI21");'>
                    <img src='/game_res/web/menu/tripleLuck_off.png?v=1.0' id="tab_LI21" alt='트리플럭' />
                </a>
            </li><li>
                <a href='javascript:tabview("LI22");'>
                    <img src='/game_res/web/menu/tHunter_off.png?v=1.0' id="tab_LI22" alt='트레저헌터' />
                </a>
            </li><li>
                <a href='javascript:tabview("LD11");'>
                    <img src='/game_res/web/menu/megaBingo_off.png?v=1.0' id="tab_LD11" alt='메가빙고' />
                </a>
            </li><li>
                <a href='javascript:tabview("LI23");'>
                    <img src='/game_res/web/menu/catchMe_off.png?v=1.0' id="tab_LI23" alt='캐치미' />
                </a>
            </li><li>
                <a href='javascript:tabview("LD20");'>
                    <img src='/game_res/web/menu/doubleJack_off.png?v=1.0' id="tab_LD20" alt='더블잭마이더스' />
                </a>
            </li><li>
                <a href='javascript:tabview("LO40");'>
                    <img src='/game_res/web/menu/lotto645_off.png?v=1.0' id="tab_LO40" alt='로또645' />
                </a>
            </li>
            <!-- <li>
                <a href='javascript:tabview("LP32");'>
                    <img src='/game_res/web/menu/game520_off.png?v=1.0' id="tab_LP32" alt='연금복권520' />
                </a>
            </li> -->
			<li class="check_text">
				<input name="newPop" id="newPop" type="checkbox" value="" />
				<label for="newPop"><span>새창으로</span></label>
			</li>
        </ul>
        <!-- 게임접속시간 추가 180921-->
        <div class="connect_time">
        	<strong>게임접속시간</strong>
        	<span id="timer" class="timer"></span>
        </div>
        <!-- //게임접속시간 추가 180921 -->
        <div class='purchase'>
            <img src='/game_res/web/menu/purchase.png' alt='오늘의 구매액 (전자복권)' />
            <p>
                <span class='display'>0원</span>
                <a href='#'><img src='/game_res/web/menu/refresh.png' id="buy_limit_reload" alt='새로고침' /></a>
            </p>
        </div>
	</nav><iframe id="ifrm_tab" name="ifrm_tab" scrolling="no" frameborder="no" src="https://ol.dhlottery.co.kr/olotto/game/game645.do" width="900" height="645" bgcolor="#1C003A"></iframe>
	<!-- 레이어팝업  추가 180921 -->
	<div id="popAlert" class="popup_wrap" style="display:none">
		<div class="popup_section">
			<div class="inner">
				<div class="head">
					<strong class="tit">Break time 안내</strong>
					<a class="close" href="javascript:gameBreakClose();"><span>닫기</span></a>
				</div>
				<div class="content">
					<div class="pop_desc">
						<p>
						장시간의 복권 구입은 복권 과몰입 위험에 빠질 수 있습니다.<br>
						<strong>과몰입 예방 영상 시청 완료 후, 계속 이용 가능합니다.</strong><br>
						지나친 복권 구매로 일상생활이 어려운 경우,<strong>동행클린센타</strong>를 통해 도움 받으시길 바랍니다. 
						</p>
						<a href="https://clean.dhlottery.co.kr/" class="btn_counsel" target="_blank" title="새창 열림"><span>동행클린센터<br>과몰입 상담하기<br><strong>(080-800-0501)</strong></span></a>
						<br><br><a href="javascript:jsCampainTest();" class="btn_counsel" title="새창 열림"><span>복권 과몰입<br>자가진단테스트</span></a>    
					</div>
					<div class="video_container">
				 		<iframe id="videoBreakTime" title="복권 건전영상 기초편(과몰입예방편) 동영상" width="440" height="245" src="//www.youtube.com/embed/zGDcyXFW1NA?enablejsapi=1" frameborder="0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture"></iframe>
					</div>
					<div class="btns_submit">
						<a class="btn_cancel close" href="javascript:gameBreakClose();">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //레이어팝업  추가 180921 -->
	<!-- 레이어팝업  추가 191127 미수령 당첨금 -->
	<div id="popAlertHighPrizeDeposit" class="popup_wrap" style="display:none">
		<div class="popup_section">
			<div class="inner">
				<div class="head">
					<strong class="tit">미수령 당첨금 안내</strong>
<!-- 				<a class="close" href="#" onclick="javascript:closeHighPrize()"><span>닫기</span></a> -->
				</div>
				<div class="content">
					<div class="pop_desc">
						<p>
						미수령 당첨금을 모두 지급 받으셔야만<br>
						복권 구매가 가능합니다.<br><br>
						고액당첨금은 인증처리(주민번호 입력) 후,<br>
						예치금으로 지급(충전)됩니다. 
						</p>
						<a href="#" class="btn_highPrize" onclick="javascript:goHighPrize()"><span>당첨금 수령하기</span></a> 
					</div>
<!-- 				<div class="btns_submit"> -->
<!-- 					<a href="#" class="btn_cancel close" onclick="javascript:closeHighPrize()">닫기</a> -->
<!-- 				</div> -->
				</div>
			</div>
		</div>
	</div>
	<!-- //레이어팝업  추가 180921 -->	
</div>
</body>
</html>