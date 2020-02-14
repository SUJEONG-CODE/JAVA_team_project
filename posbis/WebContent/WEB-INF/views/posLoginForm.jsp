
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
 
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>POSLogin</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/pos/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="resources/pos/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/pos/assets/libs/css/style.css">
    <link rel="stylesheet" href="resources/pos/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <!-- GoogleFont CSS -->
<!-- <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
 -->	<style>
    html,
    body { 
        height: 100%;
    }

    body {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
    }
    </style>



		<script>
		   $(document).ready(function(){
			   
			   inputData("[name=business_no]",'${cookie.business_no.value}');
				  inputData("[name=user_pwd]",'${cookie.user_pwd.value}'); 
				 
				 <c:if test="${!empty cookie.business_no.value}">
			  	$('[name=is_posLogin]').prop("checked",true);
			  	</c:if>

			  	
	            $("#business_no").keyup(function(){
	                var b_no = $(this).val();
	                //숫자만 골라서 저장할 변수 선언
	                var num="";
	                //money 변수 안의 데이터 중 숫자만 골라 num 변수에 누적 시킴
	                for(var i=0; i<b_no.length; i++){
	                   //money 안의 데이터 중 i번째 데이터가 숫자문자면 num 변수 축적
	                   if("0123456789".indexOf(b_no.charAt(i))>=0){
	                      num=num + b_no.charAt(i);
	                   }
	                }
	                   //-를 포함한 최종 문자열을 저장할 변수 선언
	                   var result="";
	                   //cnt 변수의 역할은 낚아챈 개수가 저장된다.
	                   var cnt=0;
	                   for(var i=0; i<num.length; i++){
	                      cnt++;
	                      if(cnt==4 || cnt==6){
	                         result = result + "-" + num.charAt(i);
	                      }
	                      else{
	                         result = result + num.charAt(i);
	                      }
	                   }
	                   $(this).val(result);
	             });
			   
			 });





		
		//*************************************************************************************   
		//사업자 번호, 암호 체크 후 ajax를 통해 사업자 번호 조회 후 로그인 하기           
		  function goPosLogin(){
		
			    if( is_empty("[name=business_no]") ){
			          alert("사업자 번호를 입력하세요.");
			          $("[name=business_no]").val("");
			          return;
			       }
			
			    if( is_empty("[name=user_pwd]") ){
			          alert("비밀번호를 입력하세요.");
			          $("[name=user_pwd]").val("");
			          return;
			       }      

	
			//사업자 번호, 암호 체크 후 ajax를 통해 사업자 번호 조회 후 로그인 하기                 
				$.ajax({
					url : "/posbis/posLoginProc.do",
					type : "post",
					data : $("[name=posLoginForm]").serialize(),
					success : function(data) {
						if (data == 1) {
							//alert("로그인 성공");
							location.replace("/posbis/posPayForm.do");
						} 
						else if (data == 0) {
							alert("사업자 번호 또는 암호가 존재하지 않습니다. \n다시 입력해주세요");
							$("[name=business_no]").val("");
							$("[name=user_pwd]").val("");
						}
					},
					error : function(request, status, error) {
						alert("서버 접속 실패");
						alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n" + "error:"+ error);
					}

				})

			}

			
		</script>









</head>

<body>
	<!-- ============================================================== -->
	<!-- login page  -->
	<!-- ============================================================== -->
	<div class="splash-container">
		<div class="card ">
			<div class="card-header text-center">
				<img class="logo-img" src="resources/pos/assets/images/logo.png"
					alt="logo">
			</div>
		
			<div class="card-body">
				<form name="posLoginForm">
					<div class="form-group">
						<input class="form-control form-control-lg" id="business_no" maxlength="12" name="business_no" type="text" placeholder="사업자번호" autocomplete="off">
					</div>
					<div class="form-group">
						<input class="form-control form-control-lg" id="user_pwd" maxlength="10" name="user_pwd" type="password" placeholder="비밀번호">
					</div>
					<div class="form-group">
						<label class="custom-control custom-checkbox"> 
							<input class="custom-control-input" type="checkbox" name="is_posLogin" ><span class="custom-control-label">사업자번호 저장</span>
						</label>
					</div>
					<button type="button" class="btn btn-primary btn-lg btn-block" onClick="goPosLogin();">로그인</button>
				</form>
			</div>
			
		</div>
	</div>

	<!-- ============================================================== -->
	<!-- end login page  -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->
	<script src="resources/pos/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script
		src="resources/pos/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
</body>

</html>