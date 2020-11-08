<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
<html>
<head>
	<meta content="동행복권, 로또6/45, 로또6/45판매점, 연금복권520, 즉석복권, 즉석복권 판매점 조회, 연금복권 판매점 조회, 전자복권, 이벤트고객센터, 복권기금, 복권판매점 모집 문의 안내, 복권 통합포털, 추첨, 당첨정보, 회차별 번호 제공 ">
	<meta id="desc" name="description" charset="EUC-KR" content="">
	<title>동행복권</title>
	

<html>
<head>
<meta charset="UTF-8">

<title> 동행복권</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %> 
<body >

<section class="contentSection">
	<!--왼쪽-->
	<nav class="lnbNav">
		<!-- left menu include -------------->
			<div id="snb" class="lnb">
	<h2 id="04" class="lnb_title">판매점</h2>
	<ul id="lnb" class="lnb_dep1">
		<li id="04-01"><a href="SHOPINFO" class="menuLnb"><span>구입처 안내</span></a>
			<ul class="lnb_dep2">
				<li id="04-01-01"><a href="SHOPINFO"><span> 로또6/45판매점 조회</span></a></li>
			</ul>
		</li>
		<li id="04-02"><a href="LOTTOPRIZE" class="menuLnb"><span>당첨 판매점</span></a>
			<ul class="lnb_dep2">
				<li id="04-02-01"><a href="LOTTOPRIZE"><span> 회차별</span></a></li>
				<!-- 
				<li id="04-02-02"><a href="/store.do?method=topStoreRank&rank=1&pageGubun=L645"><span> 1등 배출점</span></a></li>
				<li id="04-02-03"><a href="/store.do?method=topStoreRank&rank=2&pageGubun=L645"><span> 2등 배출점</span></a></li>
				-->
			</ul>
		</li>
	</ul>
</div>
		<!-- ----------------------------- -->
	</nav>	
	<div id="article" class="contentsArticle">
		<div class="header_article">
			<h3 class="sub_title">회차별</h3>
			<p class="location"></p>
		</div>
		<div>
			<div class="content_wrap content_store_win">
				<!-- ---------------------------------------------------------------------------------------------------- -->
				
					<div class="tab_article tab_size5">
		  				<ul>
		  					<li class="active" style="width:100%; border:1px solid #12a19a;"><strong>로또6/45</strong></li>
		  				</ul>
	 				</div>
		 			
		 			<form name="frm" id="frm" method="post">
						<input type="hidden" name="method" value="topStore">
						<input type="hidden" name="nowPage" id="nowPage" value="1">
						<input type="hidden" name="rankNo" id="rankNo" value="">
						<input type="hidden" name="gameNo" id="gameNo" value="5133">
                        <table class="tbl_data tbl_form tbl_search_opt">
                            <caption>회차별 당첨판매점 검색</caption>
                            <colgroup>
                                <col style="width:180px">
                                <col>
                            </colgroup>
                            <tbody>
                            
                                <tr>
                                    <th scope="row">회차</th>
                                    <td>
                                    	<!-- DB로 불러와서 for문돌린다. -->
                                    	<select id="drwNo" name="drwNo" title="회차 선택">
											<c:forEach var="shopprize" items="${shopprize}" varStatus="status">
												<option value="${shopprize.DROW_CNT}" >${shopprize.DROW_CNT}회차</option>	
											</c:forEach>
										</select>
                                    </td>
                               	</tr>
                               	<tr>
                                    <th scope="row">판매점</th>
                                    <td>
                                        <select name="schKey" id="schKey" title="조회옵션 선택">
                                        	<option value="all" >전체</option>
		                                    <option value="area" >지역</option>
		                                    <option value="offi" >상호</option>
                                        </select>
                                        <input type="text"name="schVal" id="schVal" title="검색어 입력" value="">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
					<div class="btns_submit search">
						<a class="btn_common mid blu" id="searchBtn" href="#">조회</a>
					</div>  

					<div class="group_content">
						<div class="group_title">
						    <h4 class="title">1등 배출점</h4>
						</div>
						<table class="tbl_data tbl_data_col">
							<caption>상호, 번호선택구분, 소재지, 위치 등 선택 회차의 로또 6/45 1등 배출점을 안내합니다.</caption>
							<colgroup>
								<col style="width:60px">
								<col>
								<col style="width:80px">
								<col style="width:445px">
								<col style="width:90px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
								 	<th scope="col">상호명</th>
								 	<th scope="col">구분</th>
								 	<th scope="col">소재지</th>
								 	<th scope="col">위치보기</th>
								</tr>
							</thead>				
							<tbody>
								
								
									<tr>
										<td>1</td>
										<td>교통카드충전소</td>
										<td>
											
												자동 
												
												
												
											
										</td>
										
											
											
												<td>서울특별시 강남구 선릉로 309(역삼동) </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11101091')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>2</td>
										<td>행운마트</td>
										<td>
											
												 
												수동
												
												
											
										</td>
										
											
											
												<td>서울 노원구 중계로 96,(중계동) </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11110277')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>3</td>
										<td>대박로또</td>
										<td>
											
												 
												수동
												
												
											
										</td>
										
											
											
												<td>서울 송파구 마천로57길 5 마천빌딩 </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11140334')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>4</td>
										<td>통일마트</td>
										<td>
											
												 
												수동
												
												
											
										</td>
										
											
											
												<td>서울 종로구 종로 19,(종로1가) </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11190220')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>5</td>
										<td>중구-가로가판대-37</td>
										<td>
											
												자동 
												
												
												
											
										</td>
										
											
											
												<td>서울 중구 남대문로 20-2,(남대문로3가) </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11100918')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>6</td>
										<td>CU(망우점)</td>
										<td>
											
												 
												수동
												
												
											
										</td>
										
											
											
												<td>서울 중랑구 망우로 410,(망우동) </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('21100270')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>7</td>
										<td>정다운복권 조이마트</td>
										<td>
											
												자동 
												
												
												
											
										</td>
										
											
											
												<td>인천 부평구 충선로 171,(부개동) </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('12810108')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>8</td>
										<td>장군슈퍼</td>
										<td>
											
												 
												수동
												
												
											
										</td>
										
											
											
												<td>인천 연수구 청량로 104,(옥련동) </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('12800100')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>9</td>
										<td>오천억복권방</td>
										<td>
											
												 
												수동
												
												
											
										</td>
										
											
											
												<td>광주 서구 상무대로 1087 </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('12900033')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>10</td>
										<td>행운복권</td>
										<td>
											
												자동 
												
												
												
											
										</td>
										
											
											
												<td>경기 성남시 중원구 시민로 120 </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('14100130')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>11</td>
										<td>스마일로또복권</td>
										<td>
											
												 
												수동
												
												
											
										</td>
										
											
											
												<td>경기 평택시 탄현1로 104 104호</td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('14140521')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>12</td>
										<td>율암25시편의점</td>
										<td>
											
												 
												수동
												
												
											
										</td>
										
											
											
												<td>경기 화성시 시청로 822-10 </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('14190240')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>13</td>
										<td>복드림로또판매점</td>
										<td>
											
												자동 
												
												
												
											
										</td>
										
											
											
												<td>충북 충주시 첨단산업9로 13 </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('14330012')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
								
							</tbody>
						</table>
					</div>
					<div class="group_content">
						<div class="group_title">
						    <h4 class="title">2등 배출점</h4>
						</div>
						<table class="tbl_data tbl_data_col">
							<caption>상호, 번호선택구분, 소재지, 위치 등 선택 회차의 로또 6/45 2등 배출점을 안내합니다.</caption>
							<colgroup>
								<col style="width:60px">
								<col>
								<col style="width:445px">
								<col style="width:90px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
								 	<th scope="col">상호명</th>
								 	<th scope="col">소재지</th>
								 	<th scope="col">위치보기</th>
								</tr>
							</thead>
							<tbody>
								
								
									<tr>
										<td>1</td>
										<td>단골집편의점</td>
										
											
											
												<td>서울 강동구 구천면로 194 </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11100227')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>2</td>
										<td>토큰박스</td>
										
											
											
												<td>서울 강북구 도봉로 334,(번동) </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11100798')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>3</td>
										<td>찬스복권방</td>
										
											
											
												<td>서울 강북구 한천로 1156 상민빌딩 </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11110209')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>4</td>
										<td>화곡본마트</td>
										
											
											
												<td>서울 강서구 까치산로4길 3,(화곡동) </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11100506')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>5</td>
										<td>신영정보통신</td>
										
											
											
												<td>서울 강서구 등촌로 61,(화곡동) </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11101474')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>6</td>
										<td>복권나라</td>
										
											
											
												<td>서울 관악구 은천로 40-1 </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11100250')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>7</td>
										<td>글사랑(책대여점)</td>
										
											
											
												<td>서울 광진구 천호대로112길 10 </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11101612')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>8</td>
										<td>성동약국</td>
										
											
											
												<td>서울 광진구 자양번영로 11 </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11110072')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>9</td>
										<td>글사랑(책대여점)</td>
										
											
											
												<td>서울 광진구 천호대로112길 10 </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11101612')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>10</td>
										<td>고고GOGO로또</td>
										
											
											
												<td>서울 광진구 자양로15길 34 </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11140070')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>11</td>
										<td>다모아복권</td>
										
											
											
												<td>서울 구로구 경인로19길 4,(오류동) </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11100024')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>12</td>
										<td>넘보원 마트</td>
										
											
											
												<td>서울 도봉구 도봉로165길 2,(도봉동) </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11100052')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>13</td>
										<td>gs25녹천본점</td>
										
											
											
												<td>서울 도봉구 덕릉로 349,(창동, 주공4단지아파트) </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11190170')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>14</td>
										<td>대구상회</td>
										
											
											
												<td>서울 마포구 토정로31길 51,(용강동) </td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11100592')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
									<tr>
										<td>15</td>
										<td>노다지복권방</td>
										
											
											
												<td>서울 서초구 남부순환로356길 26 1층</td>											
											
										
										<td>
										    
										        <a href="#" class="btn_search" onClick="javascript:showMapPage('11100035')" title="새창 열림">지도보기</a>
									        
										</td> 
									</tr>
								
								
							</tbody>
						</table>
						
						<div class="paginate_common" id="page_box">
									<a href="#" class="current" title="현재 위치"><strong>1</strong></a>
									<a href="javascript:void(0)" onclick="selfSubmit(2)" >2</a>
						</div>
					</div>    
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
</body>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>
