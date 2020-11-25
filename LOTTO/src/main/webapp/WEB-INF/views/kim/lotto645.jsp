<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="ko"><head>
    <meta charset="EUC-KR">
    <title></title>
 <c:set var="path" value="${pageContext.request.contextPath}"/>   
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<link href='${path}/resources/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/style.css?version=1.1">

<link href="${path}/resources/css/jquery-ui.css" rel="stylesheet">
<script src="${path}/resources/js/jquery.js"></script>
<script src="${path}/resources/js/jquery-ui.min.js"></script>
<script src="${path}/resources/js/common.js"></script>
<script src="${path}/resources/js/smoothie.js"></script>

<script type='text/javascript' language='javascript' src="${path}/resources/js/jquery.min.js"></script>
<script type='text/javascript' language='javascript' src="${path}/resources/js/jquery-ui.min.js"></script>

<script type="text/javascript">






if (navigator.platform && /win16|win32|win64|mac/ig.test(navigator.platform) == false) {
	alert("비정상적인 방법으로 접속하였습니다. 정상적인 PC 환경에서 접속하여 주시기 바랍니다.");
	parent.window.close();
}
</script>
<style>
/*연금복권 720+ 배너추가 20200417*/
#recommend720Plus .cont1, #recommend720Plus .cont2{line-height:21px;}
#recommend720Plus .bannerImg{margin:10px 0 20px;}
#recommend720Plus .bannerImg > a > img{width:100%;} 
.n720PlusBanner{overflow:hidden;width:380px;margin:0 0 20px -30px;border-radius: 3px 3px 0 0;}
.n720PlusBanner img{width:100%;}
.modifyPd720{padding:0 30px 30px !important;}
</style>
</head>
<body>

<div class="game-645-wrap">
    <div class="game-645-header">
        <div class="current">
            <div class="now">
                <h2><span>제</span><strong  id="curRound">939</strong><span>회</span></h2>
                <p><span>남은시간</span><strong id="countTime"><!-- 0일 00:00 --></strong></p>
            </div>
            <ul class="prize_and">
                <li><span>1등 예상 총 당첨금액</span><strong>225,872,435</strong></li>
                <li>&nbsp;</li>
            
            </ul>
        </div>
        <div class="past">
            <h3><strong>938</strong>회 당첨결과</h3>
            <p>
                <span class="ball color1"><span>4</span></span><!-- 볼 컬러 1~10 color1, 11~20 color2, 21~30 color3 31~40 color4, 41~45 color5 -->
                <span class="ball color1"><span>8</span></span>
                <span class="ball color1"><span>10</span></span>
                <span class="ball color2"><span>16</span></span>
                <span class="ball color4"><span>31</span></span>
                <span class="ball color4"><span>36</span></span>
                <span class="ext">보너스번호</span>
                <span class="ball color1"><span>9</span></span>
            </p>
            <a class="watch" href="#" onClick="javascript:guide05();">추첨방송보기</a>
        </div>
    </div>
    <div class="game-645-content">
        <!-- 번호선택 -->
        <div class="select-number">
            <div class="header">
                <h3>로또 구매방법 선택</h3>
                <ul id="tabWay2Buy">
                    <li class="active"><a href="#divWay2Buy1" id="num1" onclick="selectWayTab(0); return false;"><strong>혼합선택</strong><span>원하시는 번호를 직접입력 또는 자동으로 구매할 수 있습니다.</span></a></li>
                    <li><a href="#divWay2Buy1" id="num2" onclick="selectWayTab(1); return false;"><strong>자동번호발급</strong><span>구매 수량 전체를 자동번호로 발급 받을 수 있습니다.</span></a></li>
                    <li><a href="#divWay2Buy2" id="num3" onclick="selectWayTab(2); return false;"><strong>직전회차번호</strong><span>지난회차 구매한 최근 5게임 번호를 선택할 수 있습니다.</span></a></li>
                    <li><a href="#divWay2Buy3" id="num4" onclick="selectWayTab(3); return false;"><strong>나의로또번호</strong><span>저장한 나의 로또번호에서 선택해서 구매할 수 있습니다.</span></a></li>
                </ul>
               	<input type="hidden" id="selectedTab" name="selectedTab" value="0"/>
               	<input type="hidden" id="ROUND_DRAW_DATE" name="ROUND_DRAW_DATE" value="2020/11/28"/>
               	<input type="hidden" id="WAMT_PAY_TLMT_END_DT" name="WAMT_PAY_TLMT_END_DT" value="2021/11/29"/>
            </div>
            <div class="ways">
                <!-- 번호선택/자동번호발급 -->
                <div id="divWay2Buy1" class="way way1" style="display:block">
                    <div class="paper">
                        <div class="top">
                            <strong id="textPaperInt"></strong>
                            <span><span id="textPaperPmt">1,000</span><span>원</span></span>
                        </div>
                        <!-- input[type="checkbox"]#check645num$[name="check645num"][onchange="checkLength645($(this))"][value="$"]+label[for="check645num$"]{$} -->
                        <div id="checkNumGroup" class="check">
                        	<input type="hidden" id="activeGbn" name="activeGbn" />
                            <input type="checkbox" id="check645num1" name="check645num" onchange="checkLength645($(this))" value="1">
                            <label for="check645num1">1</label>
                            <input type="checkbox" id="check645num2" name="check645num" onchange="checkLength645($(this))" value="2">
                            <label for="check645num2">2</label>
                            <input type="checkbox" id="check645num3" name="check645num" onchange="checkLength645($(this))" value="3">
                            <label for="check645num3">3</label>
                            <input type="checkbox" id="check645num4" name="check645num" onchange="checkLength645($(this))" value="4">
                            <label for="check645num4">4</label>
                            <input type="checkbox" id="check645num5" name="check645num" onchange="checkLength645($(this))" value="5">
                            <label for="check645num5">5</label>
                            <input type="checkbox" id="check645num6" name="check645num" onchange="checkLength645($(this))" value="6">
                            <label for="check645num6">6</label>
                            <input type="checkbox" id="check645num7" name="check645num" onchange="checkLength645($(this))" value="7">
                            <label for="check645num7">7</label>
                            <input type="checkbox" id="check645num8" name="check645num" onchange="checkLength645($(this))" value="8">
                            <label for="check645num8">8</label>
                            <input type="checkbox" id="check645num9" name="check645num" onchange="checkLength645($(this))" value="9">
                            <label for="check645num9">9</label>
                            <input type="checkbox" id="check645num10" name="check645num" onchange="checkLength645($(this))" value="10">
                            <label for="check645num10">10</label>
                            <input type="checkbox" id="check645num11" name="check645num" onchange="checkLength645($(this))" value="11">
                            <label for="check645num11">11</label>
                            <input type="checkbox" id="check645num12" name="check645num" onchange="checkLength645($(this))" value="12">
                            <label for="check645num12">12</label>
                            <input type="checkbox" id="check645num13" name="check645num" onchange="checkLength645($(this))" value="13">
                            <label for="check645num13">13</label>
                            <input type="checkbox" id="check645num14" name="check645num" onchange="checkLength645($(this))" value="14">
                            <label for="check645num14">14</label>
                            <input type="checkbox" id="check645num15" name="check645num" onchange="checkLength645($(this))" value="15">
                            <label for="check645num15">15</label>
                            <input type="checkbox" id="check645num16" name="check645num" onchange="checkLength645($(this))" value="16">
                            <label for="check645num16">16</label>
                            <input type="checkbox" id="check645num17" name="check645num" onchange="checkLength645($(this))" value="17">
                            <label for="check645num17">17</label>
                            <input type="checkbox" id="check645num18" name="check645num" onchange="checkLength645($(this))" value="18">
                            <label for="check645num18">18</label>
                            <input type="checkbox" id="check645num19" name="check645num" onchange="checkLength645($(this))" value="19">
                            <label for="check645num19">19</label>
                            <input type="checkbox" id="check645num20" name="check645num" onchange="checkLength645($(this))" value="20">
                            <label for="check645num20">20</label>
                            <input type="checkbox" id="check645num21" name="check645num" onchange="checkLength645($(this))" value="21">
                            <label for="check645num21">21</label>
                            <input type="checkbox" id="check645num22" name="check645num" onchange="checkLength645($(this))" value="22">
                            <label for="check645num22">22</label>
                            <input type="checkbox" id="check645num23" name="check645num" onchange="checkLength645($(this))" value="23">
                            <label for="check645num23">23</label>
                            <input type="checkbox" id="check645num24" name="check645num" onchange="checkLength645($(this))" value="24">
                            <label for="check645num24">24</label>
                            <input type="checkbox" id="check645num25" name="check645num" onchange="checkLength645($(this))" value="25">
                            <label for="check645num25">25</label>
                            <input type="checkbox" id="check645num26" name="check645num" onchange="checkLength645($(this))" value="26">
                            <label for="check645num26">26</label>
                            <input type="checkbox" id="check645num27" name="check645num" onchange="checkLength645($(this))" value="27">
                            <label for="check645num27">27</label>
                            <input type="checkbox" id="check645num28" name="check645num" onchange="checkLength645($(this))" value="28">
                            <label for="check645num28">28</label>
                            <input type="checkbox" id="check645num29" name="check645num" onchange="checkLength645($(this))" value="29">
                            <label for="check645num29">29</label>
                            <input type="checkbox" id="check645num30" name="check645num" onchange="checkLength645($(this))" value="30">
                            <label for="check645num30">30</label>
                            <input type="checkbox" id="check645num31" name="check645num" onchange="checkLength645($(this))" value="31">
                            <label for="check645num31">31</label>
                            <input type="checkbox" id="check645num32" name="check645num" onchange="checkLength645($(this))" value="32">
                            <label for="check645num32">32</label>
                            <input type="checkbox" id="check645num33" name="check645num" onchange="checkLength645($(this))" value="33">
                            <label for="check645num33">33</label>
                            <input type="checkbox" id="check645num34" name="check645num" onchange="checkLength645($(this))" value="34">
                            <label for="check645num34">34</label>
                            <input type="checkbox" id="check645num35" name="check645num" onchange="checkLength645($(this))" value="35">
                            <label for="check645num35">35</label>
                            <input type="checkbox" id="check645num36" name="check645num" onchange="checkLength645($(this))" value="36">
                            <label for="check645num36">36</label>
                            <input type="checkbox" id="check645num37" name="check645num" onchange="checkLength645($(this))" value="37">
                            <label for="check645num37">37</label>
                            <input type="checkbox" id="check645num38" name="check645num" onchange="checkLength645($(this))" value="38">
                            <label for="check645num38">38</label>
                            <input type="checkbox" id="check645num39" name="check645num" onchange="checkLength645($(this))" value="39">
                            <label for="check645num39">39</label>
                            <input type="checkbox" id="check645num40" name="check645num" onchange="checkLength645($(this))" value="40">
                            <label for="check645num40">40</label>
                            <input type="checkbox" id="check645num41" name="check645num" onchange="checkLength645($(this))" value="41">
                            <label for="check645num41">41</label>
                            <input type="checkbox" id="check645num42" name="check645num" onchange="checkLength645($(this))" value="42">
                            <label for="check645num42">42</label>
                            <input type="checkbox" id="check645num43" name="check645num" onchange="checkLength645($(this))" value="43">
                            <label for="check645num43">43</label>
                            <input type="checkbox" id="check645num44" name="check645num" onchange="checkLength645($(this))" value="44">
                            <label for="check645num44">44</label>
                            <input type="checkbox" id="check645num45" name="check645num" onchange="checkLength645($(this))" value="45">
                            <label for="check645num45">45</label>
                            <div class="action">
                                <span class="btn"><input type="button" id="" name="" value="초기화" onclick="resetNumber645()"></span>
                                <input class="checkbox" type="checkbox" id="checkAutoSelect" name="checkAutoSelect"><label for="checkAutoSelect"><span>자동선택</span></label>
                                <span class="btn"><input type="button" id="btnRegMyNumber" value="나의번호등록" ></span>
                            </div>
                            <div id="coverPaper" class="box-autoselect" style="display:none">
                                <div class="inner"><div class="inner2">
                                    <p>구매하기 완료 시 <br>로또번호가 자동으로 <br>발급됩니다.</p>
                                </div></div>
                            </div>
                        </div>
                    </div>
                    <div class="amount">
                        <label for="amoundApply">적용수량</label>
                        <select id="amoundApply" name="" onchange="paperTextChange(this.value)">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                        <input type="button" class="button lrg confirm" id="btnSelectNum" name="btnSelectNum" value="확인">
                    </div>
                </div>
                <!-- //번호선택/자동번호발급 -->
                <!-- 직전회차번호 -->
                <div id="divWay2Buy2" class="way mynum way2" style="display:none">
                    <h4>구매내역</h4>
                    <div class="my-number">
                        <ul id="preList">
                            <!-- nodata -->
                            <!-- 데이터 없을 경우 주석 풀어서 사용해주세요 <li class="nodata">
                                <p>구매 내역이 없습니다.</p>
                            </li> -->
                            <!-- //nodata -->
                            <!-- loop -->
                        </ul>
                    </div>
                    <div class="btn">
                        <input type="button" class="button confirm lrg" name="btnPreNumber" value="확인">
                    </div>
                </div>
                <!-- //나의로또번호 -->
                <div id="divWay2Buy3" class="way mynum way3" style="display:none">
                    <h4>내 로또번호</h4>
                    <div class="my-number">
                        <ul id="myList">
                            <!-- nodata -->
                            <!-- 데이터 없을 경우 주석 풀어서 사용해주세요 
                            <li class="nodata">
                                <p>저장된 번호가 없습니다.</p>
                            </li> -->
                            <!-- //nodata -->
                        </ul>
                    </div>
                    <div class="btn">
                        <input type="button" class="button confirm lrg" name="btnMyNumber" value="확인">
                        <input type="button" class="button confirm lrg" id="btnDeleteMyNumber" name="btnDeleteMyNumber" value="삭제">
                    </div>
                </div>
                <!-- //나의로또번호 -->
            </div>
        </div>
        <!-- //번호선택 -->
        <!-- 선택 확인 -->
        <div class="selected-games">
            <div class="header">
                <h3>선택번호 확인</h3>
                <input type="button" id="resetAllNum" name="resetAllNum" class="button confirm lrg" value="초기화">
            </div>
            <div class="game" id="selectRow">
                <ul>
                    <!-- loop -->
                    <li>
                        <strong><span>A</span><span id="selectGbnA">미지정</span></strong>
                        <div class="nums">
                            <span id="num0A"></span><!-- 볼 컬러 1~10 color1, 11~20 color2, 21~30 color3 31~40 color4, 41~45 color5 -->
                            <span id="num1A"></span>
                            <span id="num2A"></span>
                            <span id="num3A"></span>
                            <span id="num4A"></span>
                            <span id="num5A"></span>
                        </div>
                        <div class="btn">
                            <input type="button" class="button mid" id="btnUptA" name="btnUpt" value="수정">
                            <input type="button" class="button mid" id="btnDelA" name="btnDel" value="삭제">
                            <input type="button" class="button mid" id="btnCpyA" name="btnCpy" value="번호복사">
                        </div>
                    </li>
                    <!-- //loop -->
                    <!-- loop -->
                    <li>
                        <strong><span>B</span><span id="selectGbnB">미지정</span></strong>
                        <div class="nums">
                            <span id="num0B"></span><!-- 볼 컬러 1~10 color1, 11~20 color2, 21~30 color3 31~40 color4, 41~45 color5 -->
                            <span id="num1B"></span>
                            <span id="num2B"></span>
                            <span id="num3B"></span>
                            <span id="num4B"></span><!-- 자동선택 번호 -->
                            <span id="num5B"></span>
                        </div>
                        <div class="btn">
                            <input type="button" class="button mid" id="btnUptB" name="btnUpt" value="수정">
                            <input type="button" class="button mid" id="btnDelB" name="btnDel" value="삭제">
                            <input type="button" class="button mid" id="btnCpyB" name="btnCpy" value="번호복사">
                        </div>
                    </li>
                    <!-- //loop -->
                    <!-- loop -->
                    <li>
                        <strong><span>C</span><span id="selectGbnC">미지정</span></strong>
                        <div class="nums">
                            <span id="num0C"></span><!-- 자동선택 번호 -->
                            <span id="num1C"></span>
                            <span id="num2C"></span>
                            <span id="num3C"></span>
                            <span id="num4C"></span>
                            <span id="num5C"></span>
                        </div>
                        <div class="btn">
                            <input type="button" class="button mid" id="btnUptC" name="btnUpt" value="수정">
                            <input type="button" class="button mid" id="btnDelC" name="btnDel" value="삭제">
                            <input type="button" class="button mid" id="btnCpyC" name="btnCpy" value="번호복사">
                        </div>
                    </li>
                    <!-- //loop -->
                    <!-- loop : 미지정 -->
                    <li>
                        <strong><span>D</span><span id="selectGbnD">미지정</span></strong>
                        <div class="nums">
                            <span id="num0D"></span><!-- 미지정 -->
                            <span id="num1D"></span>
                            <span id="num2D"></span>
                            <span id="num3D"></span>
                            <span id="num4D"></span>
                            <span id="num5D"></span>
                        </div>
                        <div class="btn">
                            <input type="button" class="button mid" id="btnUptD" name="btnUpt" value="수정">
                            <input type="button" class="button mid" id="btnDelD" name="btnDel" value="삭제">
                            <input type="button" class="button mid" id="btnCpyD" name="btnCpy" value="번호복사">
                        </div>
                    </li>
                    <!-- //loop -->
                    <!-- loop : 미지정 -->
                    <li>
                        <strong><span>E</span><span id="selectGbnE">미지정</span></strong>
                        <div class="nums">
                            <span id="num0E"></span><!-- 미지정 -->
                            <span id="num1E"></span>
                            <span id="num2E"></span>
                            <span id="num3E"></span>
                            <span id="num4E"></span>
                            <span id="num5E"></span>
                        </div>
                        <div class="btn">
                            <input type="button" class="button mid" id="btnUptE" name="btnUpt" value="수정">
                            <input type="button" class="button mid" id="btnDelE" name="btnDel" value="삭제">
                            <input type="button" class="button mid" id="btnCpyE" name="btnCpy" value="번호복사">
                        </div>
                    </li>
                    <!-- //loop -->
                </ul>
            </div>
            <div class="footer">
                <div class="set set1">
                    <span>보유예치금</span>
                    <input type="button" class="button sml" id="" name="" value="충전" onClick="javascript:guide06();">
                    <strong><span id="moneyBalance">0</span><span>원</span></strong>
                </div>
                <div class="set set2">
                    <span>결제금액</span>
                    <strong><span id="payAmt">0</span><span>원</span></strong>
                </div>
                
               	<input type="button" class="button buy" id="btnBuy" name="btnBuy" value="구매하기">
                <input type="hidden" class="button buy" id="btnBuy_send" name="btnBuy_send" value="실구매"> 
            </div>
        </div>
        <!-- //선택 확인 -->
    </div>
    <div class="game-645-footer">
        <ul class="links">
            <li class="link1"><a href="#" onClick="javascript:guide01();">도움말</a></li>
            <li class="link2"><a href="#" onClick="javascript:guide02();">당첨번호</a></li>
            <li class="link3"><a href="#" onClick="javascript:guide03();">당첨통계</a></li>
            <li class="link4"><a href="#" onClick="javascript:guide04();">구매내역</a></li>
        </ul>
        <div id="notice645" class="notice">
            <div class="inner">
                <div class="text">
                    <p>안녕하세요? 동행복권 입니다. <br/>로또6/45는 한 회차 최대 5천원으로 제한되어있습니다.<br/>좋은하루되세요.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- 구매내역 확인 레이어 -->
    <div class="layer-receipt" id="report" style="display:none">
        <div id="popReceipt" class="paper modifyPd720">
	        <!-- 720 추천메세지 [S]-->
			<div class="n720PlusBanner">
				<a href="javascript:goTabview('LP72');"><img src="/images/img_720popup_20200512.gif" alt="당첨금으로 매월2,200만원을 받을받는방법은?" /></a>
			</div>  
			<!-- 720 추천메세지 [E]-->        
			
            <h2>구매내역 확인</h2>
            <div class="date-info">
                <h3><span>복권 로또 645</span><strong id="buyRound">제 809회</strong></h3>
                <ul>
                    <li><span>발 행 일</span> : <span id="issueDay">2018/12/01 (월)18:00:00</span></li>
                    <li><span>추 첨 일</span> : <span id="drawDate">2018/12/08</span></li>
                    <li><span>지급 기한</span> : <span id="payLimitDate">2019/04/01</span></li>
                </ul>
				<p class="barcode">
					<span id="barCode1"></span>
					<span id="barCode2"></span>
					<span id="barCode3"></span>
					<span id="barCode4"></span>
					<span id="barCode5"></span>
					<span id="barCode6"></span>
					<span>*****</span>
				</p>
            </div>
            <div class="selected">
                <ul id="reportRow">
                    <!-- loop -->
                    <!-- //loop -->
                </ul>
                <div class="total">
                    <strong>금액:</strong>
                    <strong><span id="nBuyAmount">5,000</span></strong>
                </div>
            </div>
            <div class="btns">
<!--                 <input type="button" class="button lrg" id="printlayer" name="printlayer" OnClick="print(document.getElementById('report').innerHTML)" value="출력"> -->
                <input type="button" class="button lrg confirm" id="closeLayer" name="closeLayer" value="확인">
            </div>
            <div class="explain">
            	<span>하트 표시를 클릭하면 나의 로또번호에 저장됩니다.</span>
            </div>
            

        </div>
    </div>
    <!-- //구매내역 확인 레이어 -->
    <div class="layer-loading" id="execBuy" style="display:none">
    	<div class="buy-loading"></div>
    </div>

	<!-- 720 추천 팝업 [S]-->       	
	<div class="layer-wait recomd720Popup" id="recommend720Plus" style="display:none;">
        <div class="box">
            <div class="head">
				<h2>구매한도 알림</h2>
				<a class="close" href="javascript:closeRecomd720Popup();">닫기</a>
			</div>
			<div class="status">
				<p class="cont1">이번 주 로또 구매한도 5천원을 모두 채우셨습니다.<br>
					다음 회차 판매개시 후부터 다시 구매할 수 있습니다.<br><br>
					로또처럼 매주 추첨! 당첨금을 매월마다 안정적으로 지급하는 <br>
					연금복권720+를 구매해 보세요!
				</p>
				<p class="bannerImg"><a href="javascript:goTabview('LP72');"><img src="/images/img_720popup_20200512.gif" alt="당첨금으로 매월2,200만원을 받을받는방법은?" /></a></p>
				<p class="cont2">
				*연금복권 구매 Tip<br>
				연금복권은 1조~5조까지 동일번호로 5매를 구매하면<br>
				5매 중 1매라도 당첨일 경우 5매가 모두 당첨이 되는 구조입니다.<br>
				(예) 1등+2등 동시 당첨(5매, 총21.6억원), 보너스 5매(총6억원) 모두 당첨 등
				</p>
			</div>
			
            <div class="btns">
				<a href="javascript:goTabview('LP72');" class="button lrg confirm">연금복권720+ 구매하기</a>
				<a class="button lrg confirm" href="javascript:closeRecomd720Popup();">닫기</a>
			</div>
        </div>
        <input type="hidden" id="direct" value=""/>
    </div>
	<!-- 720 추천 팝업 [E]-->
</div>
<script>

/*
 * 기본 배열정보
 */
	var selected = new Array("","","","","","");				//선택한 번호를 가지고 있는 배열
	var emptyRow = new Array("Y","Y","Y","Y","Y");				//빈자리여부
	var alpabet = new Array("A","B","C","D","E");				//표번호 알파벳(A,B,C,D,E)
	var copyRow = new Array("","","","","","");					// 복사할 row
	var copyRowTxt = "";					// 복사할 row 선택값

    /*
    * comma 처리함수
    */
	var addComma = function(num){
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	
    /*
    * 번호선택 관련 체크
    */
	var checkLength645 = function(elem){
        var nums = $("#checkNumGroup");
        var length = nums.find("input[type='checkbox']:checked").length;
        if(nums.find("input[name='checkAutoSelect']:checked").length > 0){
        	length = length - 1;
        }
        var max = 6;
        if(length > max){
            alert("최대 "+max+"개의 숫자를 선택할 수 있습니다.");
            elem.prop("checked",false);
        }
    }

    /*
    * 좌측 하단 초기화
    */
    var resetNumber645 = function(){
        var nums = $("#checkNumGroup");
        nums.find("input[type='checkbox']").prop("checked",false);
        
        var index = 5;
    	for(var i=0;i<5;i++){
    		if(emptyRow[i] == "Y"){
    			index = i;
    			break;
    		} 
    	}
    	
    	// 현재 선택한 row번호
        $("#textPaperInt").text("");
        //신규 수정 구분
    	$("#activeGbn").val("");
        $("select[id=amoundApply]").attr("disabled",false);
    }

    var reSetAll = function(){
    	resetNumber645();
    	
    	for(var i=0;i<5;i++){
	    	if($("#selectGbn" + alpabet[i]).text() == "미지정"){
	    		continue;
	    	}
	    	
			$("#selectGbn" + alpabet[i]).text("미지정");	//	수동/자동/반자동 표기
			
			for(var k=0;k<6;k++){			//	값 setting Loop
				
				$("#num" + k + alpabet[i]).text("");	//	번호표기
				$("#num" + k + alpabet[i]).removeClass("ball");	//	선택표기
				$("#num" + k + alpabet[i]).removeClass("color1");	//	번호별 색상표기
				$("#num" + k + alpabet[i]).removeClass("color2");	//	번호별 색상표기
				$("#num" + k + alpabet[i]).removeClass("color3");	//	번호별 색상표기
				$("#num" + k + alpabet[i]).removeClass("color4");	//	번호별 색상표기
				$("#num" + k + alpabet[i]).removeClass("color5");	//	번호별 색상표기
			}
			
			emptyRow[i] = "Y";
			
			$("#payAmt").text(addComma(parseInt($("#payAmt").text().replace(/,/gi, "")) - 1000));	//	결제금액
    	}
    }
    
    var paperTextChange = function(val){
        var won = val + ",000";

        $("#textPaperPmt").html(won);
    }

    //좌측 탭 및 탭 우측 번호선택 영역 토글 처리
    var selectWayTab = function(num){
        var tab =  $("#tabWay2Buy");
        var tgtab = tab.find("li").eq(num);
        var tgnum = num;
        if(num == 0) tgnum = 1;
        var target = $("#divWay2Buy" + tgnum);
		
        $("#selectedTab").val(num);
        
        if(tgtab.hasClass("active")){ //활성화된 탭 클릭시
            return;
        }

        //탭 변경시 기존 체크값 삭제
        $("#divWay2Buy1").find("select option").eq(0).prop("selected",true);
        $("#divWay2Buy1").find("input[type='checkbox']").prop("checked",false).prop("disabled",true);
        $("#divWay2Buy2").find("input[type='checkbox']").prop("checked",false).prop("disabled",true);
        $("#divWay2Buy3").find("input[type='checkbox']").prop("checked",false).prop("disabled",true);

        //용지 상단 알파벳 및 금액
        var index = 5;
    	for(var i=0;i<5;i++){
    		if(emptyRow[i] == "Y"){
    			index = i;
    			break;
    		} 
    	}
    	
        $("#textPaperInt").text("");
        $("#textPaperPmt").html("1,000");

    	$("#activeGbn").val("");
        $("select[id=amoundApply]").attr("disabled",false);

        //탭 및 해당 div 활성
        tab.find("li").removeClass("active");
        tgtab.addClass("active");
        $('[id*="divWay2Buy"]').css("display","none");
        target.css("display","block");

        if(num == 1){ //자동번호발급일 경우
            $("#coverPaper").css("display","block"); //용지 가리는 영역 show
        }else{
            $("#coverPaper").css("display","none"); //용지 가리는 영역 hide
            //타겟 div 체크박스 disabled 속성 제거
            target.find("input[type='checkbox']").prop("disabled",false);
        }
        
        if(num == "2"){			//	직전회차복권번호
        	selectBeforeNum();
        }else if(num == "3"){	//	나의복권번호	
        	selectMyGameNum();
        }

    };

    //우하단 공지 롤링
    var rollingNotice = function(){
        var notice = $("#notice645");
        var noticeheight = notice.outerHeight();
        var holder = notice.children(".inner");
        var holderheight = holder.outerHeight();
        var posx = noticeheight * 1;
        var speed = 10000;
        holder.css("top", posx);
        holder.find(".text").css("min-height",noticeheight);
        holder.find(".text").clone().appendTo(holder).css("margin-top",noticeheight);
        holder.animate({top:holderheight * -1},speed,"linear", function(){
            holder.find(".text").eq(0).remove();
            holder.find(".text").css("min-height","").css("margin-top","");
            initNotice = null;
            initNotice = new rollingNotice();
        });
    }
    var initNotice = new rollingNotice();

    //판매종료일 남은시간 카운트다운 샘플
    var lotteryDate = "20201128200000"; //판매종료일 YYYYMMDDHHMMSS
    
    var date1 = new Date(lotteryDate.replace(
        /^(\d{4})(\d\d)(\d\d)(\d\d)(\d\d)(\d\d)$/,
        '$2/$3/$1 $4:$5:$6'
    ));
    var date2 = new Date();
    var remainTime = Math.round(Math.abs((date1.getTime() - date2.getTime())/1000));
    var seconds = remainTime;
    var timerCount = function() {
        var days = Math.floor((seconds)/24/60/60);
        var hours_left = Math.floor((seconds) - (days*86400));
        var hours = Math.floor(hours_left/3600);
        var minutes_left = Math.floor((hours_left) - (hours*3600));
        var minutes = Math.floor(minutes_left/60);
        var remain_sec = seconds % 60;
        if (hours < 10) {hours = "0" + hours}
        if (minutes < 10) {minutes = "0" + minutes}
        if (remain_sec < 10) {remain_sec = "0" + remain_sec}
        $("#countTime").html(days + "일 " + hours + ":" + minutes);
        if (seconds == 0) {
            //카운트 끝날때 어떻게?
            clearInterval(countdownTimer);
        }else{
            seconds--;
        }
    }
    var countdownTimer = setInterval('timerCount()', 1000);

	$(function(){
		$("#popReceipt").draggable(); //jqueryui draggable 선언
	});
	
    
	//도움말
	function guide01() {
		window.open('http://www.dhlottery.co.kr/gameInfo.do?method=gameMethod', '_blank');
	}
		
	//당첨번호
	function guide02() {
		window.open('http://www.dhlottery.co.kr/gameResult.do?method=byWin', '_blank');
	}
		
	//당첨통계
	function guide03() {
		window.open('http://www.dhlottery.co.kr/gameResult.do?method=statIndex', '_blank');
	}
		
	//구매내역
	function guide04() {
		window.open('http://www.dhlottery.co.kr/myPage.do?method=lottoBuyListView', '_blank');
	}

	//추첨방송보기
	function guide05() {
		window.open('http://www.dhlottery.co.kr/gameResult.do?method=lotTv', '_blank');
	}

   	//충전하기
   	function guide06() {
   		window.open('http://www.dhlottery.co.kr/payment.do?method=payment', '_blank');
   	}
    		
   	//연금720+
   	function guide07() {
   		window.open('http://www.dhlottery.co.kr/gameInfo.do?method=gameGuide&wiselog=H_B_2_1', '_blank');
   	}   	
    		
	/* 확인버튼 클릭 */
    $("#btnSelectNum").click(function() {
    	var selectIndex	=	0;
    	var curCnt		=	0;
    	var autoFlg		=	"N";
    	var selectedTab	=	$("#selectedTab").val();	//	0:직접선택, 1:자동선택, 2:직전회차번호, 3:나의로또번호
    	
    	//	자동선택 체크여부
    	if($("input[name=checkAutoSelect]").prop("checked") == true){
    		autoFlg = "Y";
    	}
    	
    	//	입력일 경우에만 수량 체크(수정은 이미 수량체크 완료된 상태)
    	if($("#activeGbn").val() != "U"){
	    	//	입력한도체크(총 5개)
	    	for(var i=0;i<5;i++){
	    		if(emptyRow[i] == "N"){
	    			curCnt = curCnt + 1;
	    		} 
	    	}
	    	
	    	if(curCnt + parseInt($("#amoundApply").val()) > 5){
	    		alert("1회 최대 5게임만 구매할 수 있습니다. (5,000원)");
	    		return;
	    	}
	    	
    	}
    	
    	//	selected배열에 선택된 번호 입력
    	$("input[name=check645num]").each(function(index, elem){
    		
    		if($(elem).prop("checked") == true){
    			if($(elem).prop("name") != "checkAutoSelect"){
        			selected[selectIndex] = $(elem).val(); 
        			selectIndex = selectIndex + 1;
    			}
    		}
    		
    	});
    	
    	if(selectedTab == "0"){		//	직접선택일 경우
        	//	자동선택이 체크되지 않은 경우 6개 모두 선택해야 함
	    	if(autoFlg == "N"){
	        	if(selectIndex != 6){
	        		alert("6개를 선택해 주세요");
	        		return;
	        	}
	    	}else{
	        	if(selectIndex == 6){
	        		alert("자동선택과 번호6개를 모두 선택하셨습니다.");
	        		return;
	        	}
	    	}
    	}
    	
    	//	번호 Row를 선택하지 않은 경우 자동으로 현재 빈 번호Row로 표기
    	if($("#textPaperInt").text() == ""){
    		$("#textPaperInt").text(alpabet[emptyRow.indexOf ("Y")]);	//	알파벳표기(A,B,C,D,E)
    	}

    	if($("#activeGbn").val() == "U"){
        	//	수정일 경우
    		var rowIndex	=	alpabet.indexOf ($("#textPaperInt").text());
        	
        	if(autoFlg == "Y" && selectIndex > 0){
    			$("#selectGbn" + alpabet[rowIndex]).text("반자동");	//	수동/자동/반자동 표기 [반자동]
        	}else if(autoFlg == "Y" && selectIndex == 0){
    			$("#selectGbn" + alpabet[rowIndex]).text("자동");	//	수동/자동/반자동 표기 [자동]
        	}else{
    			$("#selectGbn" + alpabet[rowIndex]).text("수동");	//	수동/자동/반자동 표기 [수동]
        	}

	        for(var k=0;k<6;k++){			//	색상 초기화
				$("#num" + k + alpabet[rowIndex]).removeClass("ball");		//	선택표기
				$("#num" + k + alpabet[rowIndex]).removeClass("color1");	//	번호별 색상표기
				$("#num" + k + alpabet[rowIndex]).removeClass("color2");	//	번호별 색상표기
				$("#num" + k + alpabet[rowIndex]).removeClass("color3");	//	번호별 색상표기
				$("#num" + k + alpabet[rowIndex]).removeClass("color4");	//	번호별 색상표기
				$("#num" + k + alpabet[rowIndex]).removeClass("color5");	//	번호별 색상표기
			}
			
			for(var k=0;k<6;k++){			//	값 setting Loop
				if(k < selectIndex){
					$("#num" + k + alpabet[rowIndex]).text(selected[k]);	//	번호표기
					$("#num" + k + alpabet[rowIndex]).addClass("ball");	//	선택표기
					if(selected[k] < 11){
						$("#num" + k + alpabet[rowIndex]).addClass("color1");	//	번호별 색상표기
					}else if(selected[k] > 10 && selected[k] < 21){
						$("#num" + k + alpabet[rowIndex]).addClass("color2");	//	번호별 색상표기
					}else if(selected[k] > 20 && selected[k] < 31){
						$("#num" + k + alpabet[rowIndex]).addClass("color3");	//	번호별 색상표기
					}else if(selected[k] > 30 && selected[k] < 41){
						$("#num" + k + alpabet[rowIndex]).addClass("color4");	//	번호별 색상표기
					}else if(selected[k] > 40){
						$("#num" + k + alpabet[rowIndex]).addClass("color5");	//	번호별 색상표기
					}
				}else{
					$("#num" + k + alpabet[rowIndex]).text("자동선택");			//	번호표기
					$("#num" + k + alpabet[rowIndex]).addClass("ball");			//	선택표기
				}
			}
			
		}else{
	    	var buyCnt	=	(curCnt + parseInt($("#amoundApply").val())) * 1000;
	    	
	    	$("#payAmt").text(addComma(buyCnt));		//	결제금액 표기

	    	//	입력일 경우	
    		for(var i=0;i<$("#amoundApply").val();i++){	//	매수 Loop
    			if($("#textPaperInt").text() == ""){
            		for(var j=0;j<5;j++){					//	빈칸찾기 Loop
            			if(emptyRow[j] == "Y"){
            	        	if(selectedTab == "0"){	//	직접선택
            					if(autoFlg == "Y" && selectIndex > 0){
                	    			$("#selectGbn" + alpabet[j]).text("반자동");	//	수동/자동/반자동 표기 [반자동]
                	        	}else if(autoFlg == "Y" && selectIndex == 0){
                	    			$("#selectGbn" + alpabet[j]).text("자동");	//	수동/자동/반자동 표기 [자동]
                	        	}else{
                	    			$("#selectGbn" + alpabet[j]).text("수동");	//	수동/자동/반자동 표기 [수동]
                	        	}
            	        	}else if(selectedTab == "1"){	//	자동선택
            	    			$("#selectGbn" + alpabet[j]).text("자동");	//	수동/자동/반자동 표기 [자동]
            	        	}else if(selectedTab == "2"){	//	기존번호선택
            	    			$("#selectGbn" + alpabet[j]).text("수동");	//	수동/자동/반자동 표기 [자동]
            	        	}else if(selectedTab == "3"){	//	나의번호선택
            	    			$("#selectGbn" + alpabet[j]).text("수동");	//	수동/자동/반자동 표기 [자동]
            	        	}			
            				
            				for(var k=0;k<6;k++){			//	값 setting Loop
            					if(k < selectIndex){
    	            				$("#num" + k + alpabet[j]).text(selected[k]);	//	번호표기
    	            				$("#num" + k + alpabet[j]).addClass("ball");	//	선택표기
    	            				if(selected[k] < 11){
    	            					$("#num" + k + alpabet[j]).addClass("color1");	//	번호별 색상표기
    	            				}else if(selected[k] > 10 && selected[k] < 21){
    	            					$("#num" + k + alpabet[j]).addClass("color2");	//	번호별 색상표기
    	            				}else if(selected[k] > 20 && selected[k] < 31){
    	            					$("#num" + k + alpabet[j]).addClass("color3");	//	번호별 색상표기
    	            				}else if(selected[k] > 30 && selected[k] < 41){
    	            					$("#num" + k + alpabet[j]).addClass("color4");	//	번호별 색상표기
    	            				}else if(selected[k] > 40){
    	            					$("#num" + k + alpabet[j]).addClass("color5");	//	번호별 색상표기
    	            				}
            					}else{
            						$("#num" + k + alpabet[j]).text("자동선택");				//	번호표기
            						$("#num" + k + alpabet[j]).addClass("ball");			//	선택표기
            					}
            				}
            				
            				emptyRow[j] = "N";
            				$("#textPaperInt").text("");
            				
            				$("#btnCpy" + alpabet[j]).val("번호복사"); 
            				
                			break;
            			}
            			
            		}
    			}else{
    				var insRowIndex	=	alpabet.indexOf ($("#textPaperInt").text());
    				
    	        	if(selectedTab == "0"){	//	직접선택
    					if(autoFlg == "Y" && selectIndex > 0){
        	    			$("#selectGbn" + alpabet[insRowIndex]).text("반자동");	//	수동/자동/반자동 표기 [반자동]
        	        	}else if(autoFlg == "Y" && selectIndex == 0){
        	    			$("#selectGbn" + alpabet[insRowIndex]).text("자동");	//	수동/자동/반자동 표기 [자동]
        	        	}else{
        	    			$("#selectGbn" + alpabet[insRowIndex]).text("수동");	//	수동/자동/반자동 표기 [수동]
        	        	}
    	        	}else if(selectedTab == "1"){	//	자동선택
    	    			$("#selectGbn" + alpabet[insRowIndex]).text("자동");	//	수동/자동/반자동 표기 [자동]
    	        	}else if(selectedTab == "2"){	//	기존번호선택
    	    			$("#selectGbn" + alpabet[insRowIndex]).text("수동");	//	수동/자동/반자동 표기 [자동]
    	        	}else if(selectedTab == "3"){	//	나의번호선택
    	    			$("#selectGbn" + alpabet[insRowIndex]).text("수동");	//	수동/자동/반자동 표기 [자동]
    	        	}			
    				
    				for(var k=0;k<6;k++){			//	값 setting Loop
    					if(k < selectIndex){
            				$("#num" + k + alpabet[insRowIndex]).text(selected[k]);	//	번호표기
            				$("#num" + k + alpabet[insRowIndex]).addClass("ball");	//	선택표기
            				if(selected[k] < 11){
            					$("#num" + k + alpabet[insRowIndex]).addClass("color1");	//	번호별 색상표기
            				}else if(selected[k] > 10 && selected[k] < 21){
            					$("#num" + k + alpabet[insRowIndex]).addClass("color2");	//	번호별 색상표기
            				}else if(selected[k] > 20 && selected[k] < 31){
            					$("#num" + k + alpabet[insRowIndex]).addClass("color3");	//	번호별 색상표기
            				}else if(selected[k] > 30 && selected[k] < 41){
            					$("#num" + k + alpabet[insRowIndex]).addClass("color4");	//	번호별 색상표기
            				}else if(selected[k] > 40){
            					$("#num" + k + alpabet[insRowIndex]).addClass("color5");	//	번호별 색상표기
            				}
    					}else{
    						$("#num" + k + alpabet[insRowIndex]).text("자동선택");				//	번호표기
    						$("#num" + k + alpabet[insRowIndex]).addClass("ball");			//	선택표기
    					}
    				}
    				
    				emptyRow[insRowIndex] = "N";
    				$("#textPaperInt").text("");
    				
    				$("#btnCpy" + alpabet[insRowIndex]).val("번호복사"); 
    				
    			}
    			
    		}
    		
    	}
    	
		resetNumber645();				//	초기화
    	
    });
    
    /* 입력/수정할 Row 선택 */
    $('#selectRow').find("ul > li").click(function() {
    	
     	var selectIndex	=	$('#selectRow').find("ul > li").index(this);
    	
    	if($("#selectGbn" + alpabet[selectIndex]).text() != "미지정"){
    		return;
    	}
    	
    	resetNumber645();
    	
    	$("select[id=amoundApply]").attr("disabled",false);

    	$("#textPaperInt").text(alpabet[selectIndex]);	//	알파벳 표기
		
    });
    
	
	/* Row별 삭제 버튼 클릭 */
    $('input[name=btnDel]').click(function() {
    	var selectIndex	=	$("input[name=btnDel]").index(this);
    	
    	if($("#selectGbn" + alpabet[selectIndex]).text() == "미지정"){
    		return;
    	}
    	
		$("#selectGbn" + alpabet[selectIndex]).text("미지정");	//	수동/자동/반자동 표기
		
		for(var k=0;k<6;k++){			//	값 setting Loop
			
			$("#num" + k + alpabet[selectIndex]).text("");	//	번호표기
			$("#num" + k + alpabet[selectIndex]).removeClass("ball");	//	선택표기
			$("#num" + k + alpabet[selectIndex]).removeClass("color1");	//	번호별 색상표기
			$("#num" + k + alpabet[selectIndex]).removeClass("color2");	//	번호별 색상표기
			$("#num" + k + alpabet[selectIndex]).removeClass("color3");	//	번호별 색상표기
			$("#num" + k + alpabet[selectIndex]).removeClass("color4");	//	번호별 색상표기
			$("#num" + k + alpabet[selectIndex]).removeClass("color5");	//	번호별 색상표기
		}
		
		emptyRow[selectIndex] = "Y";
		
		$("#payAmt").text(addComma(parseInt($("#payAmt").text().replace(/,/gi, "")) - 1000));	//	결제금액
		
		return false;
    });
    
    /* Row별 번호복사 버튼 클릭 */
    $('input[name=btnCpy]').click(function() {
    	var selectIndex	=	$("input[name=btnCpy]").index(this);
    	
    	if($("#btnCpy" + alpabet[selectIndex]).val() == "번호복사"){
        	if($("#selectGbn" + alpabet[selectIndex]).text() == "미지정" || $("#selectGbn" + alpabet[selectIndex]).text() == "자동"){
        		return;
        	}
        	copyRowTxt = $("#selectGbn" + alpabet[selectIndex]).text();
        	$.each(copyRow, function(i, v) {
        		copyRow[i] = $('#num' + i + alpabet[selectIndex]).text();
        	});
   			
    		for(var row=0;row<5;row++){
    			if($("#selectGbn" + alpabet[row]).text() == "미지정" && row != selectIndex ){
    				$("#btnCpy" + alpabet[row]).val("붙여넣기"); 
    			}
    		}
    	}else{
			$.each(copyRow, function(k, vNum) {
				$("#num" + k + alpabet[selectIndex]).text(vNum);	//	번호표기
				$("#num" + k + alpabet[selectIndex]).addClass("ball");	//	선택표기
			
				if(vNum < 11){
					$("#num" + k + alpabet[selectIndex]).addClass("color1");	//	번호별 색상표기
				}else if(vNum > 10 && vNum < 21){
					$("#num" + k + alpabet[selectIndex]).addClass("color2");	//	번호별 색상표기
				}else if(vNum > 20 && vNum < 31){
					$("#num" + k + alpabet[selectIndex]).addClass("color3");	//	번호별 색상표기
				}else if(vNum > 30 && vNum < 41){
					$("#num" + k + alpabet[selectIndex]).addClass("color4");	//	번호별 색상표기
				}else if(vNum > 40){
					$("#num" + k + alpabet[selectIndex]).addClass("color5");	//	번호별 색상표기
				}
			});
			emptyRow[selectIndex] = "N"
		
			$("#selectGbn" + alpabet[selectIndex]).text(copyRowTxt);	//	수동/자동/반자동 표기 [자동]
			
			if(parseInt($("#payAmt").text().replace(/,/gi, "")) < 5000){
				$("#payAmt").text(addComma(parseInt($("#payAmt").text().replace(/,/gi, "")) + 1000));	//	결제금액
			}
			
			$("input[name=btnCpy]").val("번호복사");
			
			$.each(copyRow, function (i) {copyRow[i] = "";})// 복사 데이터 초기화
			copyRowTxt = "";
		}
		
		return false;
    });
    
    
    /* Row별 수정 버튼 클릭 */
    $('input[name=btnUpt]').click(function() {
    	
    	$("#num1").trigger("click");
    	
		var selectIndex	=	$("input[name=btnUpt]").index(this);
    	var selectNum	=	0;
    	var selectedTab	=	$("#selectedTab").val();	//	0:직접선택, 1:자동선택, 2:직전회차번호, 3:나의로또번호
    	
    	if(selectedTab != "0"){		//	직접선택이 아닌 경우
    		return;
    	}
    	
    	if($("#num1" + alpabet[selectIndex]).text() == ""){		//	수정할 데이터가 없을 경우
    		return;
    	}
    	
    	resetNumber645();
    	
    	// select box 제어
    	$("#amoundApply").val("1");
    	$("select[id=amoundApply]").attr("disabled",true);
        
    	$("#activeGbn").val("U");						//	현재Action 수정 표기
    	$("#textPaperInt").text(alpabet[selectIndex]);	//	알파벳표기(A,B,C,D,E)
    	
		for(var k=0;k<6;k++){			//	값 setting Loop
			
			selectNum = $("#num" + k + alpabet[selectIndex]).text();	//	번호획득

			if(selectNum == "자동선택"){
				$("#checkAutoSelect").prop("checked",true)
			}else{
				$("#check645num" + selectNum).prop("checked",true)
			}
		}
    	
		return false;
    });
    
    /* 이전구매번호 확인버튼 클릭 */
    $('input[name=btnPreNumber]').click(function() {
    	var curCnt  = 0;
    	
    	//	입력한도체크(총 5개)
    	for(var i=0;i<5;i++){
    		if(emptyRow[i] == "N"){
    			curCnt = curCnt + 1;
    		} 
    	}
    	
    	if(curCnt + $("input:checkbox[name=checkNumberPrev]:checked").length > 5){
    		alert("1회 최대 5게임만 구매할 수 있습니다. (5,000원)");
    		return;
    	}

    	$("input[name=checkNumberPrev]:checked").each(function() {
    		
    		var selectIndex	=	$("input[name=checkNumberPrev]").index(this);
    		
    		$(this).parent().find("span").each(function(index, elem) {
    			if(index != 0){
    				selected[index-2] = $(elem).text();
    			}
    		});
    		
    		for(var j=0;j<5;j++){					//	빈칸찾기 Loop
				if(emptyRow[j] == "Y"){
					
	    			$("#selectGbn" + alpabet[j]).text("수동");	//	나의로또번호 [수동]
					
					for(var k=0;k<6;k++){			//	값 setting Loop
	    				$("#num" + k + alpabet[j]).text(selected[k]);	//	번호표기
	    				$("#num" + k + alpabet[j]).addClass("ball");	//	선택표기
	    				if(selected[k] < 11){
	    					$("#num" + k + alpabet[j]).addClass("color1");	//	번호별 색상표기
	    				}else if(selected[k] > 10 && selected[k] < 21){
	    					$("#num" + k + alpabet[j]).addClass("color2");	//	번호별 색상표기
	    				}else if(selected[k] > 20 && selected[k] < 31){
	    					$("#num" + k + alpabet[j]).addClass("color3");	//	번호별 색상표기
	    				}else if(selected[k] > 30 && selected[k] < 41){
	    					$("#num" + k + alpabet[j]).addClass("color4");	//	번호별 색상표기
	    				}else if(selected[k] > 40){
	    					$("#num" + k + alpabet[j]).addClass("color5");	//	번호별 색상표기
	    				}
					}
					
					emptyRow[j] = "N";
					break;
				}
			}
    		
			$("#payAmt").text(addComma(parseInt($("#payAmt").text().replace(/,/gi, "")) + 1000));	//	결제금액
			
    	});
    	
    	$("input[name=checkNumberPrev]").prop("checked",false);
    });    
    
    /* 나의 로또번호 확인버튼 클릭 */
    $('input[name=btnMyNumber]').click(function() {
    	var curCnt  = 0;
    	
    	//	입력한도체크(총 5개)
    	for(var i=0;i<5;i++){
    		if(emptyRow[i] == "N"){
    			curCnt = curCnt + 1;
    		} 
    	}
    	
    	if(curCnt + $("input:checkbox[name=checkNumberMy]:checked").length > 5){
    		alert("1회 최대 5게임만 구매할 수 있습니다. (5,000원)");
    		return;
    	}

    	$("input[name=checkNumberMy]:checked").each(function() {
    		
    		var selectIndex	=	$("input[name=checkNumberMy]").index(this);
    		
    		$(this).parent().find("span").each(function(index, elem) {
    			if(index != 0){
    				selected[index-1] = $(elem).text();
    			}
    		});
    		
    		for(var j=0;j<5;j++){					//	빈칸찾기 Loop
				if(emptyRow[j] == "Y"){
					
	    			$("#selectGbn" + alpabet[j]).text("수동");	//	나의로또번호 [수동]
					
					for(var k=0;k<6;k++){			//	값 setting Loop
	    				$("#num" + k + alpabet[j]).text(selected[k]);	//	번호표기
	    				$("#num" + k + alpabet[j]).addClass("ball");	//	선택표기
	    				if(selected[k] < 11){
	    					$("#num" + k + alpabet[j]).addClass("color1");	//	번호별 색상표기
	    				}else if(selected[k] > 10 && selected[k] < 21){
	    					$("#num" + k + alpabet[j]).addClass("color2");	//	번호별 색상표기
	    				}else if(selected[k] > 20 && selected[k] < 31){
	    					$("#num" + k + alpabet[j]).addClass("color3");	//	번호별 색상표기
	    				}else if(selected[k] > 30 && selected[k] < 41){
	    					$("#num" + k + alpabet[j]).addClass("color4");	//	번호별 색상표기
	    				}else if(selected[k] > 40){
	    					$("#num" + k + alpabet[j]).addClass("color5");	//	번호별 색상표기
	    				}
					}
					
					emptyRow[j] = "N";
					break;
				}
			}
    		
			$("#payAmt").text(addComma(parseInt($("#payAmt").text().replace(/,/gi, "")) + 1000));	//	결제금액
    	});
    	
    	$("input[name=checkNumberMy]").prop("checked",false);
    });
    
    // 2018.12.11 나의 번호 등록
    $('#btnRegMyNumber').click(function() {
    	var $selNums = $("#checkNumGroup input[type='checkbox'][name='check645num']:checked");
    	if ($selNums.length != 6) {
    		alert('6개의 나의 로또 번호를 선택해주세요');
    		return false;
    	}
    	var selNums = [];
    	$selNums.each(function(i) {
    		selNums.push($(this).val());
    	});
    	var selNumData = selNums.join(',');
    	if (confirm(selNumData + "\n나의 로또번호를 저장하시겠습니까?")) {
	    	registMyNumber({param : '[' + JSON.stringify({number :selNumData }) + ']'}, false);
    	}
    });
    
    
    // 2018.12.11 나의 로또번호 삭제
    $('#btnDeleteMyNumber').click(function() {
		var selectIndex	=	$("input[name=checkNumberMy]").index(this);
		$checkObjs = $('#myList input[name="checkNumberMy"]:checked');
		
		if ($checkObjs.length == 0) {
			alert('삭제하실 나의 로또번호를 선택해주세요.');
			return false;
		}
		
		if (confirm('나의 로또번호를 삭제하시겠습니까?')) {
			var gameSeqnos = [];
			$.each($checkObjs, function(i, elem) {
				gameSeqnos.push($(elem).val());
			});
			var params = {
				'gameSeqnos' : JSON.stringify(gameSeqnos)
			};
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url: "/olotto/game/deleteMyGameNum.do",
				type: "POST",
				dataType:"json",
				data: params,
				success: function(data) {
					innerHtml = "";
					
					if (data.loginYn == "N"){
						alert("시간 초과로 세션이 해제되었습니다. 로그인해 주시기 바랍니다.");
						parent.window.close();
						return;
					}
					
					if (data.result != undefined && data.result.length > 0) {
						$.each(data.result, function(i, element) {
							var splitNo = element.CHS_NO.split(',');
							
		                    innerHtml = innerHtml + '<li>' + 
		                                            '    <input type="checkbox" name="checkNumberMy" value="' + element.GAME_SEQNO + '">' +
		                                            '    <label for="checkNumberMy">' +
		                                            '        <span class="nums">' +
		                                            '            <span>' + splitNo[0] + '</span>' +
					                                '            <span>' + splitNo[1] + '</span>' +
					                                '            <span>' + splitNo[2] + '</span>' +
					                                '            <span>' + splitNo[3] + '</span>' +
					                                '            <span>' + splitNo[4] + '</span>' +
					                                '            <span>' + splitNo[5] + '</span>' +
					                                '        </span>' +
					                                '    </label>' +
					                                '</li>'; 
						});
					} else {
						innerHtml = '<li class="nodata">저장된 번호가 없습니다.</li>';
					}
					
					$('#myList').html(innerHtml).trigger("create");
					
					if (data.resultMsg) {
						alert(data.resultMsg);
					}
				},
				error: function(request, status, error) {
					mesg = "[삭제처리]오류 메세지 :  " + request.responseText + ", 오류 : " + error;
				}
			});
		}
		$.each($checkObjs, function(i, $obj) {
		
		});
	});

	 // 2018.08.09 dmkim 추가
    var tid;
    function redayTime(time){
		// alert("time"+time);
		var secs = time;
		
		function printMessage(sec){
			$("#secTime").html(""+sec+" 초" );
		}
		function redirection(){
			secs --;
			if(secs == 0){
				clearInterval(tid);
				// doAuction("Y");
				$("input[name=btnBuy]").trigger("click")
			} else {
				printMessage(secs);
			}
			
		}
		printMessage(secs);
		tid = setInterval(redirection,1000);
	}
    
    function closepopupLayer(){
  	  $("#popupLayer").hide();
   	  $("#direct").val("");
  	  clearInterval(tid);
  	}
 	
    $('input[name=btnBuy]').click(function() {
    	loadingProgress(true);
    	$('#btnBuy').blur();
    	var params = "";
    	$.ajax({
			url: "/olotto/game/egovUserReadySocket.json",
			type: "POST",
			dataType: "json",
			data: params,
			async : false,
			contentType : "application/json; charset=UTF-8",
			success: function(data) {
				clearInterval(tid);
				if(Number(data.ready_cnt) > 0){
					loadingProgress(false);
					$("#popupLayer").show();
					redayTime(Number(data.ready_time));
					$("#insertTime").html("총 "+(Number(data.ready_cnt))+" 명" ) ;
					$("#direct").val("");
					// openPopup();
				} else {
					$("#popupLayer").hide();
					$("#direct").val(data.ready_ip);
					$("#secTime").html("") ;
					$("input[name=btnBuy_send]").trigger("click");
				}
			},
			error : function(request, status, error) {
				loadingProgress(false);
				clearInterval(tid);
				$("#popupLayer").hide();
				$("#direct").val("");
				mesg = "접속자 대기 응답 오류 담당 관리자에게 문의해주세요.";
				alert(mesg);
			}
		});
    });
    
 	function direct_send(){
 		$("#b-close").trigger("click");
 		$("input[name=btnBuy_send]").trigger("click");
 	}
    
    /* 구매하기버튼 클릭 */
    $('input[name=btnBuy_send]').click(function() { 
    	// 선택번호 체크
    	var selNumCheck = false;
    	for (var i = 0; i < 5; i++) {
    		if ($("#num0" + alpabet[i]).text() != "") {
    			selNumCheck = true;
    			break;
    		}
    	}
    	
    	if (!selNumCheck){
			alert("구매할 번호를 선택해 주세요.");
			loadingProgress(false);
			return;
		}
    	
		var param	=	[];
		var arrGameChoiceNum	=	"";
		var index 	=	0;
		
		for(var i=0;i<5;i++){
			var data	=	{};
			arrGameChoiceNum = "";
			
			if($("#num0" + alpabet[i]).text() == ""){	//	선택한 값이 없으면 pass
				// pass
			}else if($("#num0" + alpabet[i]).text() == "자동선택"){	//	선택한 값이 없으면 pass
				data.genType = "0";				//	선택구분 : 자동
				data.arrGameChoiceNum = null;	//	선택번호
				data.alpabet = alpabet[i];
				param[index] = data;
				index = index + 1;				//	게임 수
			}else{	
				for(var j=0;j<6;j++){
					
					if($("#num" + j + alpabet[i]).text() != "자동선택"){
						if(j < 1){
							arrGameChoiceNum = $("#num" + j + alpabet[i]).text();
						}else{
							arrGameChoiceNum = arrGameChoiceNum + "," + $("#num" + j + alpabet[i]).text();
						}
					}
					
				}
				
				data.arrGameChoiceNum = arrGameChoiceNum;	//	선택번호
				
				//게임타입[Manual(선택) : 1, Combine(반자동) : 2, Automatic(자동) : 0] DEFAULT : 0
				if($("#selectGbn" + alpabet[i]).text() == "자동"){
					data.genType = "0";				//	선택구분 : 자동
				}else if($("#selectGbn" + alpabet[i]).text() == "수동"){
					data.genType = "1";				//	선택구분 : 수동
				}else if($("#selectGbn" + alpabet[i]).text() == "반자동"){
					data.genType = "2";				//	선택구분 : 반자동
				}
				
				data.alpabet = alpabet[i];
				
				param[index] = data;

				//게임 수
				index = index + 1;
			}
		}
		
		if(param.length < 1){
			alert("구매할 번호를 선택해 주세요.");
			loadingProgress(false);
			return;
		}
		
		
		if (confirm("구매하시겠습니까?")) {
			jQuery.ajaxSettings.traditional = true;
			loadingProgress(true);
			
			var params = {
				round					:	$("#curRound").text(),
				direct					:	$("#direct").val(),
				nBuyAmount				:	$("#payAmt").text().replace(/,/gi, ""),
				param					:	JSON.stringify(param),
				ROUND_DRAW_DATE			:	$("#ROUND_DRAW_DATE").val(),
				WAMT_PAY_TLMT_END_DT	:	$("#WAMT_PAY_TLMT_END_DT").val(),
				gameCnt					:	index
			};
			
			$.ajax({
				url: "execBuy",		//"/olotto/game/execBuy.do",
				type: "POST",
				dataType:"json",     //이부분이 중요 데이타타입을 jsonP로 해줘야 크로스도메인을 이용할수 있다.
				data: params,
				async : false,
				success: function(data) {
					var result	=	data.result
					var numb	=	new Array;
					
					if(data.loginYn == "N"){
						loadingProgress(false);
						alert("시간 초과로 세션이 해제되었습니다. 로그인해 주시기 바랍니다.");
						parent.window.close();
						return;
					}
					
					if (data.isAllowed == "N"){
						loadingProgress(false);
						alert("비정상적인 방법으로 접속하였습니다. 정상적인 PC 환경에서 접속하여 주시기 바랍니다.");
						parent.window.close();
						return;
					}
					
					if (data.checkOltSaleTime == false) {
						loadingProgress(false);
						alert("잘못된 요청입니다. 다시 구매요청해 주세요.");
						return;
					}
					
					//성공 시 결과 setting
					if(result.resultCode == "100"){
						innerHtml = "";
	
						for(var i=0;i<result.arrGameChoiceNum.length;i++){
							var resultNumber	=	result.arrGameChoiceNum[i];
							var lastGbn			=	result.arrGameChoiceNum[i].substr(result.arrGameChoiceNum[i].length - 1, result.arrGameChoiceNum[i].length);
							var autoGbn			=	"";			//	Manual : 1, Combine : 2, Automatic : 3 
							resultNumber		=	resultNumber.slice(0,-1);		
							numb				=	resultNumber.split("|");
							
							if(lastGbn == "3"){
								autoGbn = "자 &nbsp;&nbsp; 동";
							}else if(lastGbn == "2"){
								autoGbn = "반자동";
							}else{
								autoGbn = "수 &nbsp;&nbsp; 동";
							}
							
							innerHtml = innerHtml + 
							'<li>' + 
			                '    <strong><span>' + numb[0] + '</span><span>'+ autoGbn + '</span></strong>' + 
			                '    <div class="nums">' + 
			                '        <span>' + numb[1] + '</span>' + 
			                '        <span>' + numb[2] + '</span>' + 
			                '        <span>' + numb[3] + '</span>' + 
			                '        <span>' + numb[4] + '</span>' + 
			                '        <span>' + numb[5] + '</span>' + 
			                '        <span>' + numb[6] + '</span>' + 
			                '    </div>' + 
			                '    <div class="check">' + 
			                '        <input type="checkbox" id="saveThisNumber'+ i + '" name="saveThisNumber" value="">' + 
			                '        <label for="saveThisNumber'+ i + '">이 번호 저장</label>' + 
			                '    </div>' + 
			                '</li>'; 
						}
						
						$('#issueDay').text(result.issueDay + " (" + result.weekDay + ") " + result.issueTime);	//	ex) 2018/12/01 (월)18:00:00
						$('#drawDate').text(result.drawDate);
						$('#payLimitDate').text(result.payLimitDate);
						$('#barCode1').text(result.barCode1);
						$('#barCode2').text(result.barCode2);
						$('#barCode3').text(result.barCode3);
						$('#barCode4').text(result.barCode4);
						$('#barCode5').text(result.barCode5);
						$('#barCode6').text(result.barCode6);
						$('#nBuyAmount').text(addComma(result.nBuyAmount));
						$('#buyRound').text("제 " + result.buyRound + "회");
						
						$('#reportRow').html(innerHtml).trigger("create");
						$("#report").css("display","block");
						
						/* test */
						$("#recomd720").show();
						loadingProgress(false);
	
					}else{
						loadingProgress(false);
						/*20200429 720 추천 배너*/
						if(result.resultCode == "-7"){
							$("#recommend720Plus").show();
						}else{
							alert("구매시 오류가 발생하였습니다.\n오류메시지:" + result.resultMsg);
						}
					}
				},
				error: function(request, status, error) {
					mesg = "[구매오류]오류 메세지 :  " + request.responseText + ", 오류 : " + error;
					loadingProgress(false);
				}
			});
		} else {
			loadingProgress(false);
		}
		
	});
	
	function loadingProgress(isVisible) {
		if (isVisible == undefined || !isVisible) {
			$('#execBuy').hide();
		} else {
			$('#execBuy').show();
		}
	}
    
    /*
     * 구매결과 닫기 & 나만의번호 저장
     */
    $('input[name=closeLayer]').click(function() {
		var param	=	[];
		var cnt		=	0;

		$("input[name=saveThisNumber]:checked").each(function() {
			var data	=	{};
    		var selectIndex	=	$("input[name=saveThisNumber]").index(this);
    		
    		$(this).closest("li").find("span").each(function(index, elem) {
				if(index > 1){
					if(data.number == undefined){
						if($(elem).text().substr(0, 1) == 0){
							data.number = $(elem).text().substr(1,2);
						}else{
							data.number = $(elem).text();
						}
					}else{
						if($(elem).text().substr(0, 1) == 0){
							data.number = data.number + "," + $(elem).text().substr(1,2);
						}else{
							data.number = data.number + "," + $(elem).text();
						}
					}
				}    			
    		});
    		
    		param[cnt] = data;
    		cnt = cnt + 1;
    	});
    	
		if(cnt > 0){
			var params = {
				param	:	JSON.stringify(param),
			};
				
			registMyNumber(params, true);
			/*
			$.ajax({
				url: "/olotto/game/insertMyGameNum.do",
				type: "POST",
				dataType:"json",     //이부분이 중요 데이타타입을 jsonP로 해줘야 크로스도메인을 이용할수 있다.
				data: params,
				success: function(data) {
					var rtnValue = data.result;
					
					if(rtnValue.loginYn == "N"){
						alert("시간 초과로 세션이 해제되었습니다. 로그인해 주시기 바랍니다.");
						parent.window.close();
						return;
					}
					
					if(rtnValue != undefined && rtnValue.resultCode == "100"){
						alert("저장하였습니다.");
						reloadPage();
					}else{
						msg = "[저장오류] " + rtnValue.resultMsg ;
						alert(msg);
					}
				},
				error: function(request, status, error) {
					mesg = "[저장오류]오류 메세지 :  " + request.responseText + ", 오류 : " + error;
				}
			});*/
		} else {
			reloadPage();
		}
		
	    /* $("#report").css("display","none");
		
		$("#moneyBalance").text(addComma(parseInt($("#moneyBalance").text().replace(/,/gi, "")) - parseInt($("#payAmt").text().replace(/,/gi, ""))));
		
		reSetAll(); */
	});
    
    var reloadPage = function() {
    	parent.location.href = 'https://el.dhlottery.co.kr/game/TotalGame.jsp?LottoId=LO40';
    };
    /*
     * 우측 상단 번호 초기화
     */
    $('input[name=resetAllNum]').click(function() { 
    	reSetAll();
    	
		$("input[name=btnCpy]").val("번호복사");
    });

    /*
     * 직전회차번호 조회
     */
    var selectBeforeNum = function(){
		var params = {
				round	:	$("#curRound").text() - 1
		};

		$.ajax({
			url: "/olotto/game/selectBeforeNum.do",
			type: "POST",
			dataType:"json",     //이부분이 중요 데이타타입을 jsonP로 해줘야 크로스도메인을 이용할수 있다.
			data: params,
			success: function(data) {
				innerHtml = "";
				
				var resultList = data.result;
				
				if(resultList != undefined && resultList.length > 0){
					
					for(var j=0;j<resultList.length;j++){
						console.log(resultList[j]);
						arrGameDtl = resultList[j];
						arrNum	=	arrGameDtl.num;
						
						var gameType = "수동";	//	게임선택구분(숫자 1자리, 1 : 자동, 2 : 반자동, 3 : 수동)
						
						if(arrGameDtl.type == "3"){
							gameType = "자동";
						}else if(arrGameDtl.type == "2"){
							gameType = "반자동";
						}
						
	                    innerHtml = innerHtml + 
	                       '<li>' + 
	                       '    <input type="checkbox" name="checkNumberPrev">' +
	                       '    <label for="checkNumberPrev">' +
	                       '        <span class="type">'+ gameType + '</span>' +
	                       '        <span class="nums">' +
	                       '            <span>' + arrNum[0] + '</span>' +
	                       '            <span>' + arrNum[1] + '</span>' +
	                       '            <span>' + arrNum[2] + '</span>' +
	                       '            <span>' + arrNum[3] + '</span>' +
	                       '            <span>' + arrNum[4] + '</span>' +
	                       '            <span>' + arrNum[5] + '</span>' +
	                       '        </span>' +
	                       '    </label>' +
	                       '</li>'; 
					}
				} else {
					innerHtml = '<li class="nodata">직전회차 구매내역이 없습니다.</li>';
				}
				
				$('#preList').html(innerHtml).trigger("create");
				
			},
			error: function(request, status, error) {
				mesg = "[취소처리]오류 메세지 :  " + request.responseText + ", 오류 : " + error;
			}
		});
    }
    
    /*
    * 나만의번호 조회
    */
    var selectMyGameNum = function(){
		var params = {
		};

		$.ajax({
			url: "/olotto/game/selectMyGameNum.do",
			type: "POST",
			dataType:"json",     //이부분이 중요 데이타타입을 jsonP로 해줘야 크로스도메인을 이용할수 있다.
			data: params,
			success: function(data) {
				innerHtml = "";
				
				if (data.result != undefined && data.result.length > 0) {
					$.each(data.result, function(i, element) {
						var splitNo = element.CHS_NO.split(',');
						
	                    innerHtml = innerHtml + '<li>' + 
	                                            '    <input type="checkbox" name="checkNumberMy" value="' + element.GAME_SEQNO + '">' +
	                                            '    <label for="checkNumberMy">' +
	                                            '        <span class="nums">' +
	                                            '            <span>' + splitNo[0] + '</span>' +
				                                '            <span>' + splitNo[1] + '</span>' +
				                                '            <span>' + splitNo[2] + '</span>' +
				                                '            <span>' + splitNo[3] + '</span>' +
				                                '            <span>' + splitNo[4] + '</span>' +
				                                '            <span>' + splitNo[5] + '</span>' +
				                                '        </span>' +
				                                '    </label>' +
				                                '</li>'; 
					});
				} else {
					innerHtml = '<li class="nodata">저장된 번호가 없습니다.</li>';
				}
				
				$('#myList').html(innerHtml).trigger("create");
				
			},
			error: function(request, status, error) {
				mesg = "[취소처리]오류 메세지 :  " + request.responseText + ", 오류 : " + error;
			}
		});
    }
    
    /**
     * 나의 번호 등록
     */
    var registMyNumber = function(params, isReload){
    	jQuery.ajaxSettings.traditional = true;
    	$.ajax({
			url: "/olotto/game/insertMyGameNum.do",
			type: "POST",
			dataType:"json",
			data: params,
			success: function(data) {
				var rtnValue = data.result;
				
				if(rtnValue.loginYn == "N"){
					alert("시간 초과로 세션이 해제되었습니다. 로그인해 주시기 바랍니다.");
					parent.window.close();
					return;
				}
				
				if(rtnValue != undefined && rtnValue.resultCode == "100"){
					alert("저장하였습니다.");
					if (isReload) {
						reloadPage();
					}
				}else{
					msg = "[저장오류] " + rtnValue.resultMsg ;
					alert(msg);
				}
			},
			error: function(request, status, error) {
				mesg = "[저장오류]오류 메세지 :  " + request.responseText + ", 오류 : " + error;
			}
		});
    }
    
  	//720추천 팝업 닫기
    function closeRecomd720Popup(){
    	reloadPage();
    }
  	
	//부모창에 전달
    var goTabview = function(gameId){
    	parent.location.href = 'https://el.dhlottery.co.kr/game/TotalGame.jsp?LottoId=' + gameId;
    }
</script>


	<!-- 접속대기 레이어 -->
	<div class="layer-wait" id="popupLayer" style="display:none">
        <div class="box">
            <div class="head">
				<h2>접속</h2>
				<a class="close" href="javascript:closepopupLayer();">닫기</a>
			</div>
			<div class="status">
				<div class="circle"><span>접속 대기중</span></div>
				<div class="message">
					<p class="m1"><strong>서비스연결 대기중</strong>입니다. <span>대기 순서에 따라 자동 접속됩니다.</span></p>
					<p class="m2">현재 대기 인원 : <strong id="insertTime">총 0 명</strong><br>예상 대기 시간 : <strong id="secTime"></strong></p>
				</div>
			</div>
			<div class="noti">
				<h3>유의사항</h3>
				<ul>
					<li>- 새로고침 또는 뒤로가기를 하면 다시 대기시간이 부여됩니다.</li>
					<li>- 먼저 접속한 고객님의 구매로 수량 소진 시 구매가 불가할수있습니다.</li>
				</ul>
			</div>
            <div class="btns">
                <input type="button" class="button lrg confirm" id="" name="" value="대기종료" onclick="javascript:closepopupLayer();">
            </div>
        </div>
        <input type="hidden" id="direct" value=""/>
    </div>
	<!-- //접속대기 레이어 -->
</body>
</html>