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
<link href="${path}/resources/css/test.css" rel="stylesheet"/>  
</head>

<%@ include file="/WEB-INF/views/header.jsp" %> 
<body >
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
