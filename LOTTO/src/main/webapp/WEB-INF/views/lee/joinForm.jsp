<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta
	content="동행복권, 로또6/45, 로또6/45판매점, 연금복권520, 즉석복권, 즉석복권 판매점 조회, 연금복권 판매점 조회, 전자복권, 이벤트고객센터, 복권기금, 복권판매점 모집 문의 안내, 복권 통합포털, 추첨, 당첨정보, 회차별 번호 제공 ">
<meta id="desc" name="description" charset="EUC-KR" content="">
<title>동행복권</title>

<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>동행복권</title>
<link href="${path}/resources/css/layout.css" rel="stylesheet" />
<link href="${path}/resources/css/default.css" rel="stylesheet" />
<link href="${path}/resources/css/al720.css" rel="stylesheet" />
<link href="${path}/resources/css/common.css" rel="stylesheet" />
<link href="${path}/resources/css/base.css" rel="stylesheet" />
<link href="${path}/resources/css/test.css" rel="stylesheet" />
<link href="${path}/resources/css/board.css" rel="stylesheet" />
<link href="${path}/resources/css/main.css" rel="stylesheet" />
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>
	<div class="join_wrap content_foot_pb">

<form name="regisForm" action="join.php" method="post" onsubmit="return regisCheck(this);" autocomplete="off">
<input type="hidden" name="action" value="regis">
<input type="hidden" name="a" value="regis">
<input type="hidden" name="jumin1" value="">
<input type="hidden" name="jumin2" value="">
<input type="hidden" name="idcheck" value="0">
<input type="hidden" name="emailcheck" value="0">
<input type="hidden" name="niccheck" value="0">
<input type="hidden" name="sponsoridcheck" value="0">
<input type="hidden" name="phonecheck" id="ic_chk_phone" value="">


	<div class="join_top_box">
		<h2>회원가입</h2>
	</div>
	<div class="join_box">
		<div class="input_list">
			<div class="input_box has_btn">
				<label>아이디<span class="col_oran">*</span></label>
				<input type="text" name="id" autocomplete="false" class="mr5" id="membid" maxlength="16" title="아이디" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" onkeyup="isKeyCheck('id');" onkeypress="isKeyCheck('id');">
				<button type="button" class="btn_confirm green" onclick="isCheck('id');">중복확인</button>
			</div>
			<p class="input_info">
				<span class="col_oran" id="checkid">6자 이상의 영문 혹은 영문과 숫자를 조합</span>
			</p>
		</div>

		<div class="input_list">
			<div class="input_box">
				<label>비밀번호<span class="col_oran">*</span></label>
				<input type="password" name="pw1" autocomplete="false" id="password" title="비밀번호" maxlength="16" placeholder="비밀번호를 입력해주세요" onkeyup="password_check();" onkeypress="password_check();" onkeydown="password_check();">
			</div>
			<p class="input_info">
				<span class="col_oran" id="checkpassword1">비밀번호는 10자이상 영문, 숫자, 특수문자로 구성하여야 합니다.</span><br>
			</p>
		</div>
		<div class="input_list">
			<div class="input_box">
				<label>비밀번호 확인<span class="col_oran">*</span></label>
				<input type="password" autocomplete="false" name="pw2" id="password_confirm" title="비밀번호확인" maxlength="16" placeholder="비밀번호를 한번 더 입력해주세요" onkeyup="password_check();" onkeypress="password_check();" onkeydown="password_check();">
			</div>
			<p class="input_info">
				<span class="col_oran" id="checkpassword2">비밀번호를 정확하게 입력해주세요<span>
			</span></span></p>
		</div>

		<div class="input_list">
			<div class="input_box">
				<label>이름<span class="col_oran">*</span></label>
				<input type="text" id="inputId" name="name" title="이름">
			</div>
		</div>
		<div class="input_list">
			<div class="input_box has_btn">
				<label>이메일<span class="col_oran">*</span></label>
				<input type="email" autocomplete="false" class="mr5" name="email" title="이메일" placeholder="예: metree@metree.com" id="notHangul" onkeyup="isKeyCheck('email');" onkeypress="isKeyCheck('email');">				
				<button type="button" class="btn_confirm green" onclick="isCheck('email');">중복확인</button>
			</div>
			<p class="input_info">
				<span class="col_oran" id="checkemail">이메일을 입력해주세요.</span>
			</p>
		</div>
		<div class="input_list">
			<div class="input_box has_btn">
				<label>닉네임<span class="col_oran">*</span></label>
				<input type="text" autocomplete="false" class="mr5" name="nic" id="nick_name" title="닉네임" onkeyup="isKeyCheck('nic');" onkeypress="isKeyCheck('nic');">
				<button type="button" class="btn_confirm green" onclick="isCheck('nic');">중복확인</button>
			</div>
			<p class="input_info">
				<span class="col_oran" id="checknic">닉네임은 한글 6자 영문 18자까지 사용가능 합니다.<span>
			</span></span></p>
		</div>
		<div class="input_list">
			<div class="input_box has_btn">
				<label>휴대폰<span class="col_oran">*</span></label>
				<input type="number" autocomplete="false" id="call" name="tel2" title="휴대폰" placeholder="숫자만 입력해주세요" maxlength="11" max="99999999999" class="cv_tel_nums mr5" onkeydown="return showKeyCode(event)">
				<button type="button" class="btn_confirm call disable" onclick="go_phone_auth(); return false;">인증번호받기</button>
			</div>
		</div>
		<div class="input_list">
			<div class="input_box has_btn">
				<label>인증번호<span class="col_oran">*</span></label>
				<input type="number" autocomplete="false" id="cv_auth_num" name="auth_num" title="인증번호" placeholder="인증번호를 입력해주세요" maxlength="4" max="9999" class="cv_tel_nums mr5" onkeydown="return showKeyCode(event)">
				<button type="button" class="btn_confirm call disable" onclick="auth_result();">확인</button>
			</div>
			<p id="checkAuth" style="padding-left:130px;font-size:13px;display:none">
				<span class="col_oran">인증번호를 정확하게 입력해주세요.<span>
			</span></span></p>
			<p id="checkAuth2" style="padding-left:130px;font-size:13px;display:none">
				<span class="col_oran">확인되었습니다.<span>
			</span></span></p>
		</div>
		<div class="input_list">
			
			<div class="input_box has_btn adress">
				<label>배송 주소<span class="col_oran">*</span></label>
				<button type="button" class="btn_confirm adress" onclick="winopen('./iframe.php?r=join_address','join_addr','420','467','0','0','auto')">주소찾기</button>
			</div>
			<div class="input_box adress2" id="member_adress2">
				<input type="hidden" name="zip1_1" id="zip1_1" value="" readonly="readonly">
				<input type="hidden" name="zip1_2" id="zip1_2" value="" readonly="readonly">
				<input type="text" readonly="readonly" id="addr_1" name="addr_1" title="주소" placeholder="배송지 주소를 검색해서 선택해주세요" onclick="winopen('./iframe.php?r=join_address','join_addr','400','300','0','0','auto')">
				<input type="text" id="addr_2" name="addr_2" title="나머지 주소">
			</div>

		</div>
		<div class="input_list select_sex_box">
			<div class="input_box has_btn">
				<label>성별<span class="col_oran">*</span></label>
				<input type="radio" class="custom_radio" id="male" name="sex" value="1" checked="true">
				<label for="male" class="select_sex">남자</label>
				<input type="radio" class="custom_radio" id="female" name="sex" value="2">
				<label for="female" class="select_sex">여자</label>
			</div>
		</div>		
		<div class="input_list">
			<div class="input_box">
				<label>생년월일<span class="col_oran">*</span></label>
				<div class="birthday">
					<input type="number" id="year" name="birth_1" maxlength="4" placeholder="YYYY" max="9999">
					<span>/</span>
					<input type="number" id="month" name="birth_2" maxlength="2" placeholder="MM" max="99">
					<span>/</span>
					<input type="number" id="day" name="birth_3" maxlength="2" placeholder="DD" max="99">
				</div>
			</div>			
		</div>
		<div class="input_list">
			<div class="input_box has_btn">

				<label>추천인<span class="col_oran">*</span></label>

								<input type="text" id="recommender" class="mr5" name="sponsorid" value="" title="추천인" onkeyup="isKeyCheck('sponsorid');" onkeypress="isKeyCheck('sponsorid');" onkeydown="isKeyCheck('sponsorid');" placeholder="추천인 코드를 입력해주세요">
					
				
				<button type="button" class="btn_confirm green" onclick="isCheck('sponsorid');">추천인확인</button>
				
			</div>
			<p class="input_info"><span class="col_oran" id="checksponsorid">추천인이 있을 경우 추천인 CODE를 입력해주세요.</span></p>
		</div>
		<div class="join_bottom_wrap">
		
			
				<!-- <div class="private_box">
					<div class="check_box">
						<input type="checkbox" id="agree_3" class="custom_check">
						<label for="agree_3"><span class="col_gray">(선택)</span> 개인정보 처리위탁</label>
					</div>
					<a href="#" class="txt_more">자세히 보기</a>
					<div class="private_txt">
						<div class="scroll_txt" tabindex="0">
							<p>개인정보 처리위탁 내용</p>						</div>
					</div>
				</div>
				<div class="private_box">
					<div class="check_box">
						<input type="checkbox" id="agree_4" class="custom_check">
						<label for="agree_4"><span class="col_gray">(선택)</span> 개인정보 제 3자 제공</label>
					</div>
					<a href="#" class="txt_more">자세히 보기</a>
					<div class="private_txt">
						<div class="scroll_txt" tabindex="0">
							<p>개인정보 제3자 제공</p>						</div>
					</div>
				</div> -->
				<div class="private_box">
					<div class="check_box">
						<input type="checkbox" id="agree_5" class="custom_check">
						<label for="agree_5"><span class="col_gray">(선택)</span> 이벤트, 상품 프로모션 등 알림 수신</label>
					</div>
					<!-- <a href="#" class="txt_more">자세히 보기</a>
					<div class="private_txt">
						<div class="scroll_txt" tabindex="0">
							<p>이벤트등 프로모션 알림수신</p>						</div>
					</div> -->
				</div>
				<div class="com_flex_box pl25" id="agree_check_box">
					<div class="check_box mr25">
						<input type="checkbox" id="agree_6" class="custom_check">
						<label for="agree_6">SMS</label>
					</div>
					<div class="check_box">
						<input type="checkbox" id="agree_7" class="custom_check">
						<label for="agree_7">이메일</label>
					</div>
				</div>
			</div>
		</div>
	</div>

</form>

<script>
$(function() {
	comCheckAll('#private_agree','#all_agree') /* 약관 전부 체크시 전체동의 체크 */

	$('.join_box .input_box input').on('focusin', function(){
		$(this).parent().siblings('.input_info').show();
	});
	$('.join_box .input_list .birthday input').on('focusin', function(){
		$(this).parent().css('border-color','#203a40');
	});
	$('.join_box .input_list .birthday input').on('focusout', function(){
		$(this).parent().css('border-color','#ccc');
	});

	var $call = $('#call');
	$call.on('keyup', function() {
		if ($call.val().length > 9) {
			$(this).next('button').removeAttr('disabled').removeClass('disable')
		} else {
			$(this).next('button').attr('disabled', 'true').addClass('disable')
		}
	});

	var $number = $('#cv_auth_num');
	$number.on('keyup', function() {
		if ($number.val().length > 3) {
			$(this).next('button').removeAttr('disabled').removeClass('disable')
		} else {
			$(this).next('button').attr('disabled', 'true').addClass('disable')
		}
	});

	var allAgree = $('#all_agree');
	var joinCheckbox = $('.join_bottom_wrap input[type=checkbox]');
	allAgree.on('click', function() {
		if ($(this).is(':checked') == true) {
			joinCheckbox.prop('checked', true);
		} else {
			joinCheckbox.prop('checked', false);
		}
	});
	$('#agree_5').on('click',function(){
		if ($(this).is(':checked') == true) {
			$('#agree_6, #agree_7').prop('checked', true);
		} else {
			$('#agree_6, #agree_7').prop('checked', false);
		}
	});
	$('#agree_check_box input[type=checkbox]').on('change',function(){		
		var checkLeng = $('#agree_check_box input[type=checkbox]').length
		if($('#agree_check_box input[type=checkbox]:checked').length == checkLeng){
			$('#agree_5').prop('checked', true);
		}else{
			$('#agree_5').prop('checked', false);
		}
	})

})

// 입력을 제한 할 특수문자의 정규식
var replaceId  = /[~!@\#$%^&*\-=+_']/gi;

$(document).ready(function(){
	
	$("#inputId").on("focusout", function() {
		var x = $(this).val();
		if (x.length > 0) {
			if (x.match(replaceId)) {
			   x = x.replace(replaceId, "");
			}
			$(this).val(x);
		}
	}).on("keyup", function() {
		$(this).val($(this).val().replace(replaceId, ""));

	});

	$("#addr_1").on("focusout", function() {
		var x = $(this).val();
		if (x.length > 0) {
			if (x.match(replaceId)) {
			   x = x.replace(replaceId, "");
			}
			$(this).val(x);
		}
	}).on("keyup", function() {
		$(this).val($(this).val().replace(replaceId, ""));

	});

	$("#addr_2").on("focusout", function() {
		var x = $(this).val();
		if (x.length > 0) {
			if (x.match(replaceId)) {
			   x = x.replace(replaceId, "");
			}
			$(this).val(x);
		}
	}).on("keyup", function() {
		$(this).val($(this).val().replace(replaceId, ""));

	});

});
</script>
</div>
</body>
<br>
<br>
<br>
<br>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>
