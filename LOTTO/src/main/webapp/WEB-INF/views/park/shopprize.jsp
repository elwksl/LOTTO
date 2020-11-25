<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta
	content="동행복권, 로또6/45, 로또6/45판매점, 연금복권520, 즉석복권, 즉석복권 판매점 조회, 연금복권 판매점 조회, 전자복권, 이벤트고객센터, 복권기금, 복권판매점 모집 문의 안내, 복권 통합포털, 추첨, 당첨정보, 회차별 번호 제공 ">
<meta id="desc" name="description" charset="EUC-KR" content="">
<title>동행복권</title>
<html>
<head>
<meta charset="UTF-8">
<script>

function dangSearch(){
	var obj= $("#drwNo option:selected").val();
	var SearchForm = '';
	var SearchForm2 = '';
	$.ajax({
        type:"get",
        url: "DangShopSearch?adr="+obj, 
        dataType : "json",
        async:false,
        contentType: "application/x-www-form-urlencoded; charset=utf8",   
        success: function(data){   
        	if(data.length==0){
        		SearchForm +='<tr><td colspan="5">당첨된 내역이 없습니다.</td></tr>';
        		SearchForm2 +='<tr><td colspan="4">당첨된 내역이 없습니다.</td></tr>';
        	} else{
        		 for(var i=0; i<data.length; i++){
        			if(data[i].drow_CNT==1){	 
        				SearchForm += '<tr><td>'+(i+1)+'</td><td>'+data[i].drow_STA_DATE+'</td><td>자동</td><td>'+data[i].drow_END_DATE+'</td><td><a href="#" class="btn_search" onClick="javascript:showMapPage()" title="새창 열림">지도보기</a></td>';
        			} else {
        				SearchForm2 += '<tr><td>'+(i+1)+'</td><td>'+data[i].drow_STA_DATE+'</td><td>'+data[i].drow_END_DATE+'</td><td><a href="#" class="btn_search" onClick="javascript:showMapPage()" title="새창 열림">지도보기</a></td>';
        			}
        		}
        	}
        	 $("#tbodySearchForm").empty();
        	 $("#tbodySearchForm").html(SearchForm);  
        	 $("#tbodySearchForm2").empty();
        	 $("#tbodySearchForm2").html(SearchForm2);  
        },
        error: function (request, status, error){
        	alert(status+error+request);    
        }
    });   
	
}

</script>
<title>동행복권</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>

	<section class="contentSection">
		<!--왼쪽-->
		<nav class="lnbNav">
			<!-- left menu include -------------->
			<div id="snb" class="lnb">
				<h2 id="04" class="lnb_title">판매점</h2>
				<ul id="lnb" class="lnb_dep1">
					<li id="04-01"><a href="SHOPINFO" class="menuLnb"><span>구입처
								안내</span></a>
						<ul class="lnb_dep2">
							<li id="04-01-01"><a href="SHOPINFO"><span>
										로또6/45판매점 조회</span></a></li>
						</ul></li>
					<li id="04-02"><a href="LOTTOPRIZE" class="menuLnb"><span>당첨
								판매점</span></a>
						<ul class="lnb_dep2">
							<li id="04-02-01"><a href="LOTTOPRIZE"><span> 회차별</span></a></li>
							<!-- 
				<li id="04-02-02"><a href="/store.do?method=topStoreRank&rank=1&pageGubun=L645"><span> 1등 배출점</span></a></li>
				<li id="04-02-03"><a href="/store.do?method=topStoreRank&rank=2&pageGubun=L645"><span> 2등 배출점</span></a></li>
				-->
						</ul></li>
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
							<li class="active"
								style="width: 100%; border: 1px solid #12a19a;"><strong>로또6/45</strong></li>
						</ul>
					</div>

					<form name="frm" id="frm" method="post">
						<input type="hidden" name="method" value="topStore"> <input
							type="hidden" name="nowPage" id="nowPage" value="1"> <input
							type="hidden" name="rankNo" id="rankNo" value=""> <input
							type="hidden" name="gameNo" id="gameNo" value="5133">
						<table class="tbl_data tbl_form tbl_search_opt">
							<caption>회차별 당첨판매점 검색</caption>
							<colgroup>
								<col style="width: 180px">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">회차</th>
									<td>
										<!-- DB로 불러와서 for문돌린다. --> 
										<select id="drwNo" name="drwNo"
											title="회차 선택">
												<c:forEach var="shopprize" items="${shopprize}"
													varStatus="status">
													<option value="${shopprize.DROW_CNT}">${shopprize.DROW_CNT}회차</option>
												</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">판매점</th>
									<td><select name="schKey" id="schKey" title="조회옵션 선택">
											<option value="all">전체</option>
									</select> <input type="text" name="schVal" id="schVal" title="검색어 입력"
										value=""></td>
								</tr>
							</tbody>
						</table>
					</form>
					<div class="btns_submit search">
						<a class="btn_common mid blu" id="searchBtn" href="#" onclick="dangSearch();">조회</a>
					</div>

					<div class="group_content">
						<div class="group_title">
							<h4 class="title">1등 배출점</h4>
						</div>
						<table class="tbl_data tbl_data_col">
							<caption>상호, 번호선택구분, 소재지, 위치 등 선택 회차의 로또 6/45 1등 배출점을
								안내합니다.</caption>
							<colgroup>
								<col style="width: 60px">
								<col>
								<col style="width: 80px">
								<col style="width: 445px">
								<col style="width: 90px">
							</colgroup>
							<thead >
								<tr>
									<th scope="col">번호</th>
									<th scope="col">상호명</th>
									<th scope="col">구분</th>
									<th scope="col">소재지</th>
									<th scope="col">위치보기</th>
								</tr>
							</thead>
							<tbody id="tbodySearchForm">
								<tr>
									<td>1</td>
									<td>교통카드충전소</td>
									<td>자동</td>
									<td>서울 강동구 구천면로 194</td>
									<td><a href="#" class="btn_search" onClick="javascript:showMapPage('11100227')" title="새창 열림">지도보기</a>
									</td>
							</tbody>
						</table>
					</div>
					<div class="group_content">
						<div class="group_title">
							<h4 class="title">2등 배출점</h4>
						</div>
						<table class="tbl_data tbl_data_col">
							<caption>상호, 번호선택구분, 소재지, 위치 등 선택 회차의 로또 6/45 2등 배출점을
								안내합니다.</caption>
							<colgroup>
								<col style="width: 60px">
								<col>
								<col style="width: 445px">
								<col style="width: 90px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">상호명</th>
									<th scope="col">소재지</th>
									<th scope="col">위치보기</th>
								</tr>
							</thead>
							<tbody id="tbodySearchForm2">
								<tr>
									<td>1</td>
									<td>단골집편의점</td>
									<td>서울 강동구 구천면로 194</td>
									<td><a href="#" class="btn_search"
										onClick="javascript:showMapPage('11100227')" title="새창 열림">지도보기</a>
									</td>
								</tr>
							</tbody>
						</table>

						<div class="paginate_common" id="page_box">
							<a href="#" class="current" title="현재 위치"><strong>1</strong></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>
