<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
	

<script type="text/javascript" src="${path}/resources/js/function.js" charset="utf-8"></script>
<script type="text/javascript" src="${path}/resources/js/InsertFlash.js" charset="utf-8"></script>
<script type="text/javascript" src="${path}/resources/js/link.js" charset="utf-8"></script>
<script type="text/javascript" src="${path}/resources/js/makePCookie.js" charset="utf-8"></script>
<script type="text/javascript" src="${path}/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${path}/resources/js/webfont.js"></script>   

    

</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %> 
<body >

<!--내용-->
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
						<li id="04-02"><a href="/store.do?method=topStore&pageGubun=L645" class="menuLnb"><span>당첨 판매점</span></a>
							<ul class="lnb_dep2">
								<li id="04-02-01"><a href="/store.do?method=topStore&pageGubun=L645"><span> 회차별</span></a></li>
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
			<!-- PC 컨텐츠 영역 -->
			<div id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title"></h3>
					<p class="location"></p>
				</div>
				<div>
					<div class="content_wrap content_seller_info content_seller_645">
						<div class="wrap_option wrap_option1">
							<div class="box_option box_option1">
								<h4><strong>지역</strong>으로 검색</h4>
								<div class="forms">
									<form id="frmSrch1" name="frmSrch1" method="post">
										<input type="hidden" name="searchType" value="1">
										<input type="hidden" id="nowPage1" name="nowPage">
										<select id="sltSIDO" name="sltSIDO" title="시/도 선택">
											<option value="">시/도 선택</option>
											<option value="경기" >경기</option>
											<option value="인천" >인천</option>
											<option value="강원" >강원</option>
											<option value="충북" >충북</option>
											<option value="충남" >충남</option>
											<option value="경북" >경북</option>
											<option value="경남" >경남</option>
											<option value="울산" >울산</option>
											<option value="전북" >전북</option>
											<option value="전남" >전남</option>
											<option value="제주" >제주</option>
											<option value="서울" >서울</option>
											<option value="대전" >대전</option>
											<option value="대구" >대구</option>
											<option value="부산" >부산</option>
											<option value="광주" >광주</option>
											<option value="세종" >세종</option>
										</select>
										<select name="sltGUGUN" id="sltGUGUN" title="구/군 선택">
											<option value="">구/군를 선택해 주세요.</option>
										</select>
										<a class="btn_common form blu" href="#none" id="searchBtn1">조회</a>
									</form>
								</div>
							</div>
							<div class="box_option box_option2">
								<h4><strong>상호/지역(읍/면/동)</strong>으로 검색</h4>
								<div class="forms">
									<form id="frmSrch2" name="frmSrch2" method="post" onsubmit="false">
										<input type="hidden" name="searchType" value="2">
										<input type="hidden" id="nowPage2" name="nowPage">
										<select id="kind" name="kind" title="상호/지역(읍/면/동) 선택">
											<option value="0" >상호</option>
											<option value="1" >지역(읍/면/동)</option>
										</select>
										<input type="text" name="srchVal" id="srchVal" maxlength="20" value="" onkeydown="return $.enterCheck(event.keyCode);" onchange="clearSlt()" title="상호/지역(읍/면/동) 입력">
										<a class="btn_common form blu" href="#none" id="searchBtn2">조회</a>
									</form>
								</div>
							</div>
						</div>
						<form id="frmSrch3" name="frmSrch3" method="post">
							<input type="hidden" name="searchType" value="3">
							<input type="hidden" id="nowPage3"  name="nowPage">
							<input type="hidden" id="sltSIDO2"  name="sltSIDO2" value="">
							<input type="hidden" id="sltGUGUN2" name="sltGUGUN2" value="">
						</form>
						<div class="wrap_option wrap_option2">
							<div class="box_option box_option1">
								<div class="head">
									<h4><strong>행정구역</strong>으로 검색</h4>
									<h5>지역 선택</h5>
								</div>
								<div id="mainMenuArea" class="area">
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a> 
								</div>
							</div>
							<div class="box_option box_option2">
								<div class="head">
									<h5>구선택</h5>
								</div>
								<div id="subMenu" class="area">
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a>
									<a href="#">서울</a> 
								</div>
							</div>
						</div>
						
						<div class="group_content group_data_search">
							<div class="group_title">
							    <h4 class="title">검색결과 : <span class="color_key3" id="searchResult"></span></h4>
							    <div class="action">
							    	<div class="search">
							    		<form id="frmSrch4" name="frmSrch4" method="post">
										<input type="hidden" name="searchType" value="4">
										<input type="hidden" id="nowPage4" name="nowPage">
										<select id="rtlrSttus" name="rtlrSttus" title="조회옵션 선택">
											<option value="">전체</option>
											<option value="001" >판매점</option>
											<option value="002" >폐점</option>
										</select>
										<a id="searchBtn3" class="btn_common form blu" href="#">조회</a>
										</form>
									</div>
									<!-- <div class="btn"><a id="exceldw" class="btn_common form" href="#">엑셀다운로드</a></div> -->
							    </div>
							</div>
						</div>
						<table class="tbl_data tbl_data_col" id="resultTable">
						</table>
						<p class="note_result_search bottom"><img src="/images/common/ico_closed_store.png" alt="폐점"> 폐점된 판매점입니다.</p>
						<div class="paginate_common" id="pagingView"></div>


		    		</div>
				</div>
			</div>
		</section>
		<section class="contentSection">
			<div id="article" class="contentsArticle">
				<table class="tbl_data tbl_data_col" id="resultTable">
					<caption>상호명, 전화번호, 소재지, 위치 등 로또6/45 판매점 조회 결과</caption>
					<colgroup>
						<col style="width: 210px;">
						<col style="width: 120px;">
						<col>
						<%-- <col style="width: 80px;"> --%>
					</colgroup>
					<thead>
						<tr>
							<th scope="col">상호명</th>
							<th scope="col">전화번호</th>
							<th scope="col">소재지</th>
						<!-- 	<th scope="col">위치보기</th> -->
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="ta_left">바이복</td>
							<td>02-445-5597   </td>
							<td class="ta_left">서울 강남구 일원로5길 19 </td>  
							
							<!-- <td><a class="btn_search" href="#none"
								onclick="showMapPage('11190021	); return false;" title="새창">위치보기</a>
							</td> -->
						</tr>
						<c:forEach var="Shopinfo" items="${Shopinfo}" varStatus="status">
						<tr>
							<td>${Shopinfo.SHOP_NAME}</td>
							<td>${Shopinfo.PHONE}</td>
							<td>${Shopinfo.ADDRESS}</td>
							</tr>
						</c:forEach>
					</tbody>  
				</table>
				</div>
			</section>

</body>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>
