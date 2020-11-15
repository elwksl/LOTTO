<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

$(document).ready(function(){
 	
	 addressSearch2();
	 addressSearch('서울');
});



function addressSearch2(){
	var valchk = '<select name="adre2" id="adre2" title="구/군 선택">';  
	var obj= $("#adre option:selected").val();
	if(obj==''){
		$("#adre").val("서울").attr("selected","selected");
		obj='서울';
	}
	var url2 = "http://api.vworld.kr/req/data";
	
		$.ajax({
	        type:"post",
	        data:{
	        	size:'100',
	        	request:'GetFeature',
	        	key:'5CBB0F7C-F94D-3EAE-B459-486417D6D665',
	        	data:'LT_C_ADSIGG_INFO',
	        	domain:'5CBB0F7C-F94D-3EAE-B459-486417D6D665',
	        	attrfilter:'full_nm:like:'+obj,
	        },
	        url: url2,
	        dataType : "json",
	        async:false,
	        contentType: "application/x-www-form-urlencoded; charset=utf8",   
	        success: function(data){   
	        	if(obj != '세종'){
		        	 var ar = data.response.result.featureCollection.features;
		        	 for(var i=0; i<ar.length; i++){
		        		 valchk+= '<option value="'+ar[i].properties.sig_kor_nm+'">'+ar[i].properties.sig_kor_nm+'</option>';
		        	 }  
	        	 } else {
	        		 valchk += '<option value="">구/군를 선택해 주세요.</option>';
	        		 valchk += '<option value="세종">세종</option>';
	        	 }
	        	 $("#addressGu").empty();
	    		 valchk =valchk+"</select>";
	    		 $("#addressGu").html(valchk); 
	        },
	        error: function (request, status, error){
	        	alert(status+error+request);    
	        }
	    });
	
}

function searchAddresspark1(){
	var obj = $("#searchAddresspark1").val();
	var SearchForm='';
	$.ajax({
        type:"post",
        data:{ adr : obj
        },
        url: "ShopSearch", 
        dataType : "json",
        async:false,
        contentType: "application/x-www-form-urlencoded; charset=utf8",   
        success: function(data){   
	        	 for(var i=0; i<data.length; i++){
	        		 SearchForm +='<tr><td>'+data[i].shop_NAME+'</td><td>'+data[i].phone+'</td><td>'+data[i].address+'</td></tr>';
	        	 }  
        	 $("#tbodySearchForm").empty();
        	 $("#tbodySearchForm").html(SearchForm);  
        },
        error: function (request, status, error){
        	alert(status+error+request);    
        }
    });   
}


function searchBtn2(searchadr){
	var SearchForm='';
	var obj= searchadr;
	
	$.ajax({
        type:"post",
        data:{ adr : obj
        },
        url: "ShopSearch", 
        dataType : "json",
        async:false,
        contentType: "application/x-www-form-urlencoded; charset=utf8",   
        success: function(data){   
	        	 for(var i=0; i<data.length; i++){
	        		 SearchForm +='<tr><td>'+data[i].shop_NAME+'</td><td>'+data[i].phone+'</td><td>'+data[i].address+'</td></tr>';
	        	 }  
        	 $("#tbodySearchForm").empty();
        	 $("#tbodySearchForm").html(SearchForm);  
        },
        error: function (request, status, error){
        	alert(status+error+request);    
        }
    });  
}


function addressSearch(s){
	var valchk = '';
	var url2 = "http://api.vworld.kr/req/data";
	
	 $.ajax({
        type:"post",
        data:{
        	size:'100',
        	request:'GetFeature',
        	key:'5CBB0F7C-F94D-3EAE-B459-486417D6D665',
        	data:'LT_C_ADSIGG_INFO',
        	domain:'5CBB0F7C-F94D-3EAE-B459-486417D6D665',
        	attrfilter:'full_nm:like:'+s,
        },
        url: url2,
        dataType : "json",
        async:false,
        contentType: "application/x-www-form-urlencoded; charset=utf8",   
        success: function(data){   
        	  if(s != '세종'){
	        	 var ar = data.response.result.featureCollection.features;
	        	 for(var i=0; i<ar.length; i++){
	        		 valchk += '<a onclick="searchBtn2(';   
	        		 valchk += "'"+ar[i].properties.sig_kor_nm+"'";
	        		 valchk += ');" href="#">';  
	        	     valchk += ar[i].properties.sig_kor_nm;
	        	     valchk += '</a></label>';
	        	 }  
        	 }else {
        		 valchk += '<a href="#">세종</a>';
        	 }   
        	 $("#addressGu2").empty();
    		 $("#addressGu2").html(valchk);  
        },
        error: function (request, status, error){
        	alert(status+error+request);    
        }
    });   
}

var ff = '';

function searchBtn1(ff){ 
	var SearchForm='';
	var obj= $("#adre2 option:selected").val();
	
	$.ajax({
        type:"post",
        data:{ adr : obj
        },
        url: "ShopSearch", 
        dataType : "json",
        async:false,
        contentType: "application/x-www-form-urlencoded; charset=utf8",   
        success: function(data){   
	        	 for(var i=0; i<data.length; i++){
	        		 SearchForm +='<tr><td>'+data[i].shop_NAME+'</td><td>'+data[i].phone+'</td><td>'+data[i].address+'</td></tr>';
	        	 }  
        	 $("#tbodySearchForm").empty();
        	 $("#tbodySearchForm").html(SearchForm);  
        },
        error: function (request, status, error){
        	alert(status+error+request);    
        }
    });   
} 
 
 
</script>
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
						<li id="04-01"><a href="SHOPINFO" class="menuLnb"><span>구입처 안내</a>
							<ul class="lnb_dep2">
								<li id="04-01-01"><a href="SHOPINFO"><span> 로또6/45판매점 조회</a></li>
							</ul>
						</li>
						<li id="04-02"><a href="LOTTOPRIZE" class="menuLnb"><span>당첨 판매점</a>
							<ul class="lnb_dep2">
								<li id="04-02-01"><a href="LOTTOPRIZE"><span> 회차별</a></li>
								<!-- 
								<li id="04-02-02"><a href="/store.do?method=topStoreRank&rank=1&pageGubun=L645"><span> 1등 배출점</a></li>
								<li id="04-02-03"><a href="/store.do?method=topStoreRank&rank=2&pageGubun=L645"><span> 2등 배출점</a></li>
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
					<h3 class="sub_title">로또 6/45 판매점 조회</h3>
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
										<select id="adre" name="adre" title="시/도 선택" onchange="addressSearch2();">
											<option value="">시/도 선택</option>
											<option value="경기" >경기</option>
											<option value="인천" >인천</option>
											<option value="강원" >강원</option>
											<option value="충청" >충북</option>
											<option value="충청" >충남</option>
											<option value="경상" >경북</option>
											<option value="경상" >경남</option>
											<option value="울산" >울산</option>
											<option value="전라" >전북</option>
											<option value="전라" >전남</option>
											<option value="제주" >제주</option>
											<option value="서울" >서울</option>
											<option value="대전" >대전</option>
											<option value="대구" >대구</option>
											<option value="부산" >부산</option>
											<option value="광주" >광주</option>
											<option value="세종" >세종</option>
										</select>
										<div id="addressGu">
											<select name="adre2" id="adre2" title="구/군 선택">
												<option value="">구/군를 선택해 주세요.</option>
											</select>
										</div>
										<a class="btn_common form blu" href="#none" id="searchBtn1" onclick="searchBtn1();">조회</a>
									</form>
								</div>
							</div>
							<div class="box_option box_option2">
								<h4><strong>검색어</strong>로 검색</h4>
								<div class="forms">
									<form id="frmSrch2" name="frmSrch2" method="post" onsubmit="false">
										<input type="hidden" name="searchType" value="2">
										<input type="hidden" id="nowPage2" name="nowPage">
										<select id="kind" name="kind" title="상호/지역(읍/면/동) 선택">
											<option value="0" >주소</option>
										</select>
										<input type="text" name="srchVal" id="searchAddresspark1" maxlength="20" value="">
										<a class="btn_common form blu" href="#none" id="searchAdr1" onclick="searchAddresspark1();">조회</a>
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
								<div id="mainaddres" class="area">
									<a href="#none" onclick="addressSearch('경기');">경기</a>  
									<a href="#" onclick="addressSearch('인천');">인천</a>
									<a href="#" onclick="addressSearch('강원');">강원</a>
									<a href="#" onclick="addressSearch('충청');">충북</a>
									<a href="#" onclick="addressSearch('충청');">충남</a>
									<a href="#" onclick="addressSearch('경상');">경북</a>
									<a href="#" onclick="addressSearch('경상');">경남</a>
									<a href="#" onclick="addressSearch('울산');">울산</a>
									<a href="#" onclick="addressSearch('전라');">전남</a>
									<a href="#" onclick="addressSearch('전라');">전북</a>
									<a href="#" onclick="addressSearch('제주');">제주</a>
									<a href="#" onclick="addressSearch('서울');">서울</a> 
									<a href="#" onclick="addressSearch('대전');">대전</a> 
									<a href="#" onclick="addressSearch('대구');">대구</a> 
									<a href="#" onclick="addressSearch('부산');">부산</a> 
									<a href="#" onclick="addressSearch('광주');">광주</a> 
									<a href="#" onclick="addressSearch('세종');">세종</a> 
								</div>
							</div>
							<div class="box_option box_option2">
								<div class="head">
									<h5>구선택</h5>
								</div>
								<div id="subMenu" class="area">
									<div id="addressGu2">
									   <a href="#">서울</a>
									</div>
								</div>
							</div>
						</div>
						
						<div class="group_content group_data_search">
							
						</div>
						<table class="tbl_data tbl_data_col" id="resultTable">
						</table>
						<div class="paginate_common" id="pagingView"></div>
		    		</div>
				</div>
			</div>
		</section>
		<section class="contentSection">
			<div id="articleSearchForm" class="contentsArticle">
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
					<tbody id="tbodySearchForm">
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
