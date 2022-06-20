<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HTA BOOKS</title>
<link href="images/Hfavicon.ico" rel="icon" type="image/x-icon" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/common/navcenter.jsp">
	<jsp:param name="menu" value="register"/>
</jsp:include>
<div class="container-fluid mb-5 bg-info" style="--bs-bg-opacity: .1;">

	
	<div class="row">
		<div class="col">
	
			<div class="row justify-content-center bg-info" style="--bs-bg-opacity: .005;">
				<div class="col-7 bg-light p-5" style="--bs-bg-opacity: .1;">
				
					<form class=""  method="post" action="register.jsp" onsubmit="return goRegisterForm()">
						
						<div class="p-1">
							<div class="p-0 m-0">
								<input type="text" class="form-control rounded-0 " name="id" placeholder="아이디" onkeyup="idCheck();"/>
								<div id="id-helper" class="form-text text-sm"></div>
							</div>
						</div>
						
						<div class="p-1">
							<div class="p-0 m-0 ">
								<input type="password" class="form-control rounded-0 " name="password" placeholder="비밀번호" onkeyup="passwordCheck1();"/>
							</div>
						
							<div class="p-0 m-0 ">
								<input type="password" class="form-control rounded-0 " name="passwordcheck" placeholder="비밀번호 확인" onkeyup="passwordCheck2();"/>
									<div id="password-helper" class="form-text text-sm"></div>
							</div>
						</div>
						
						<div class="p-1">
							<div class="p-0 m-0 ">
								<input type="email" class="form-control rounded-0 " name="email" placeholder="이메일 주소" onkeyup="emailCheck();"/>
									<div id="email-helper" class="form-text"></div>
							</div>
						</div>
						
						<div class="p-1">
							<div class="p-0 m-0 ">
								<input type="text" class="form-control rounded-0 " name="name" placeholder="이름" onkeyup="nameCheck();"/>
									<div id="name-helper" class="form-text"></div>
							</div>
						</div>
						
						<div class="mb-1 p-1">
							<small style="font-size:15px;" class="text-secondary">선택 입력</small>
						</div>
						
						<div class="mb-1 p-1 row">
							<div class=" pt-1"></div>
								<div class="col-6">
									<input type="text" class="form-control rounded-0 " maxlength="4" name="birthDate" placeholder="출생년도"/>
								</div>
							<div class="col-6">
								<div class="btn-group w-100" role="group" aria-label="Basic radio toggle button group">
									  <input type="radio" class="btn-check" name="gender" id="btnM"autocomplete="off" value="M">
									  	<label class="btn btn-outline-primary" for="btnM">남</label>
									
									  	<input type="radio" class="btn-check" name="gender" id="btnF"autocomplete="off" value="F">
									  <label class="btn btn-outline-primary" for="btnF">여</label>
								</div>
							</div>
						</div>
							
						 	<div class="mb-3 border p-2  bg-light text-secondary">
						 		<div>
						 			<div class="form-check form-check-inline">
							 			<label class="form-check-label"for="agree_all"><small>모두 동의합니다.	</small>
							 				<input class="form-check-input" type="checkbox" name="agree_all" id="agree_all"></label>
							 		</div>
						 			<div></div>
						 		
							 		<div class="form-check form-check-inline">
							 			<input class="form-check-input" type="checkbox" name="agree" value="1">
							 				<label class="form-check-label"><small>이용약관 동의(필수)</small></label>
							 		</div>
							 			<a href="" class="float-end text-decoration-none text-secondary" ><small>약관 보기> </small></a>
						 		</div>
						 		
						 		<div>
							 		<div class="form-check form-check-inline">
							 			<input class="form-check-input" type="checkbox" name="agree" value="2">
							 			<label class="form-check-label"><small>개인 정보 수집 및 이용 동의(필수)</small></label>
							 		</div>
							 		<a href="" class="float-end text-decoration-none text-secondary" ><small>약관 보기> </small></a>
						 		</div>
						 		<div>
							 		<div class="form-check form-check-inline">
							 			<input class="form-check-input" type="checkbox" name="agree" value="3">
							 			<label class="form-check-label"><small>이벤트, 혜택 알림 수신 동의(선택)</small></label>
							 		</div>
							 		<a href="" class="float-end text-decoration-none text-secondary select_disable" ><small>약관 보기> </small></a>
						 		</div>
						 		
						 		<div>
							 		<div class="form-check form-check-inline">
							 			<input class="form-check-input" type="checkbox" name="agree" value="4">
							 			<label class="form-check-label"><small>성별, 생년 정보 제공 동의(선택)</small></label>
							 		</div>
							 		<a href="" class="float-end text-decoration-none text-secondary select_disable" ><small>약관 보기> </small></a>
						 		</div>
						 		
						 		
						 	</div>
						 	
						 	<div class="d-grid gap-2">
						 		<button type="submit" class="btn btn-primary">회원가입완료</button>
						 	</div>
						</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		let isIdChecked = false;
		let isPwdChecked = false;
		let isEmailChecked = false;
		let isNameChecked = false;
	
	
		function idCheck(){		
			
			let idHelperElement = document.querySelector("#id-helper");
			let idElement = document.querySelector("input[name=id]");	
			let idValue = idElement.value;							
			
			let classList = idHelperElement.classList;					
			classList.remove("text-danger", "text-success");
			
			if( idValue ===""){
				classList.add("text-danger")							
				idHelperElement.textContent = "아이디를 입력해주세요."		
				isIdChecked = false;
				return false;
				
			}
			
			if (idValue.length <3){
				classList.add("text-danger")
				idHelperElement.textContent = "아이디는 3글자이상 20글자 영문/숫자 입력";
				isIdChecked = false;
				return false;
			}
			
			if(idValue.length >20){
				classList.add("text-danger")
				idHelperElement.textContent = "아이디는 3글자이상 20글자 영문/숫자 입력";
				isIdChecked = false;
				return false;
			}
			
			
			let xhr = new XMLHttpRequest();		
			
			xhr.onreadystatechange = function(){	
				
				if(xhr.readyState === 4 && xhr.status ===200){
					let jsonText = xhr.responseText;			
					let result = JSON.parse(jsonText); 
					if(result.exist){
						classList.add("text-danger")
						idHelperElement.textContent = "사용할 수 없는 아이디 입니다. ";
						isIdChecked = false;
					}else {
						classList.add("text-success")
						idHelperElement.textContent = "사용가능한 아이디입니다.";
						isIdChecked = true;
					}
				}
			}
			xhr.open("GET", 'idCheck.jsp?id=' + idValue);	
			xhr.send();						
			
		}
		
		function passwordCheck1(){
			
			let helperElement = document.querySelector("#password-helper");
			let pwdElement = document.querySelector("input[name=password]");	
			let pwdValue = pwdElement.value;							
			
			let classList = helperElement.classList;					
			classList.remove("text-danger", "text-success");
			
			let password1RegExp = /^[a-zA-z0-9]{4,12}$/;
			
			if (pwdValue === "") {
				classList.add("text-danger")
				helperElement.textContent = "비밀번호를 입력해주세요.";
				isPwdChecked = false;
				return;
			}
			
			if (!password1RegExp.test(pwdValue)) {
				classList.add("text-danger")
				helperElement.textContent = "유효한 비밀번호가 아닙니다.";
				isPwdChecked = false;
				return;
				
			} else {
				classList.remove("text-danger")
				helperElement.textContent = "";
				return;
			}
		}
		
		function passwordCheck2(){
			
			let helperElement = document.querySelector("#password-helper");
			let pwdElement1 = document.querySelector("input[name=password]");	
			let pwdElement2 = document.querySelector("input[name=passwordcheck]");	
			let pwdValue1 = pwdElement1.value;							
			let pwdValue2 = pwdElement2.value;							
			
			let classList = helperElement.classList;					
			classList.remove("text-danger", "text-success");
			
			if (pwdValue1 != pwdValue2) {
				classList.add("text-danger")
				helperElement.textContent = "비밀번호가 일치하지 않습니다.";
				isPwdChecked = false;
				return;
				
			} else {
				classList.remove("text-danger")
				helperElement.textContent = "";
				isPwdChecked = true;
				return;
			}
			
			if (pwdValue2 ===""){
				classList.add("text-danger")							
				helperElement.textContent = "비밀번호를 입력해주세요."		
				isPwdChecked = false;
				return;
			}
		}
		
		function emailCheck(){		
			
			let helperElement = document.querySelector("#email-helper");
			let emailElement = document.querySelector("input[name=email]");	
			let emailValue = emailElement.value;							
			
			let classList = helperElement.classList;					
			classList.remove("text-danger", "text-success");		
			
			let emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
			
			
			if(emailValue ===""){
				classList.add("text-danger")							
				helperElement.textContent = "이메일을 입력해주세요."		
				isEmailChecked = false;
				return;
				
			}
			
			if (!emailRegExp.test(emailValue)) {
				classList.add("text-danger")
				helperElement.textContent = "유효한 이메일 주소가 아닙니다.";
				isEmailChecked = false;
				return;
				
			} else {
				classList.remove("text-danger")
				helperElement.textContent = "";
				return;
			}
		}
			
		function nameCheck(){
			
			let helperElement = document.querySelector("#name-helper");
			let nameElement = document.querySelector("input[name=name]");	
			let nameValue = nameElement.value;							
			
			let classList = helperElement.classList;					
			classList.remove("text-danger", "text-success");
			
			let nameRegExp = /^[가-힣]{2,15}$/;
	
			if(nameValue ===""){
				classList.add("text-danger")
			helperElement.textContent = "이름을 입력해주세요.	"
				isNameChecked = false;
				return;
			}
			
			if(!nameRegExp.test(nameValue)){
				classList.add("text-danger")
				helperElement.textContent = "유효한 이름이 아닙니다.";
				isNameChecked = false;
				return;
				
			} else {
				classList.remove("text-danger")
				helperElement.textContent = "";
				return;
			}
			
			
		}
			
		/* let agreeCheckAll = document.querySelector('input[name=agree_all]');
		agreeCheckAll.addEventLister('change',(e) => {
			let agreeCheck = document.querySelector('input[name=agree]');
			for(let i=0; i <agreeCheck.length; i++){
				agreeCheck[i].checked = e.target.checked;
			}
		});
	 */
		function goRegisterForm() {
			
			let idField = document.querySelector("input[name=id]");
			
			if (idField.value === '') {
				alert("아이디는 필수입력값입니다.");
				idField.focus();
				return false;
			}
			
			if (!isIdChecked)	{
				alert("유효한 아이디가 아니거나 사용할 수 없는 아이디 입니다.");
				idField.focus();
				return false;
			}
			
			let passwordField = document.querySelector("input[name=password]");
			
			if (passwordField.value === '') {
				alert("비밀번호는 필수입력값입니다.");
				passwordField.focus();
				return false;
			}
			
			let nameField = document.querySelector("input[name=name]");
			
			if (nameField.value === '') {
				alert("이름은 필수입력값입니다.");
				nameField.focus();
				return false;
			}
			
			let emailField = document.querySelector("input[name=email]");
			
			if (emailField.value === '') {
				alert("이메일은 필수입력값입니다.");
				emailField.focus();
				return false;
			}
			
			alert("회원가입 완료! 로그인 해 주세요.");
			return true;
		}
		
	</script>
</body>
</html>