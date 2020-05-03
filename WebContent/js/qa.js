function insertQA(){
	location.href='q_a?board=write';
}

function qa(mode) {
	if(mode == 'write'){
		alert('질문이 등록되었습니다.');
		document.getElementById('write_qa').method = 'post';
		document.write_qa.action = 'q_a?board=write_ok';
		document.write_qa.submit();
	}	
	else if(mode == 'modify'){
		alert('질문이 수정되었습니다.');
		document.getElementById('update_qa').method = 'post';
		document.update_qa.action = 'q_a?board=modify_ok';
		document.update_qa.submit();
	}
}

function qaDetail(num){
	var path = 'q_a?board=modify&qa_num=' + num;
	location.href = path;
}

function qaDelete(num, pw){
	var msg = '정말 삭제하시겠습니까?';
	if (confirm(msg)!=0) {
		modal.style.display = "block";
	}
	else {
		//cancel
	}
}


/*
function inputpwd(){
	var pwd = prompt("비밀번호를 입력하세요",'');
	var pw='111';
	if(pwd != null){
		if(pwd == pw){
			alert('삭제되었습니다.');
		}
		else {
			var pw_wrong = confirm('잘못된 비밀번호입니다.\n다시 비밀번호를 입력하시겠습니까?');
			if(pw_wrong){
				inputpwd();
			}
			else {
				alert('삭제를 취소했습니다.');
			}
		}
	}
	else {
		var pw_error = confirm('비밀번호를 입력하지 않았습니다.\n다시 비밀번호를 입력하시겠습니까?');
		if(pw_error){
			inputpwd();
		}
		else {
			alert('삭제를 취소했습니다.');
		}
	}
}
*/


/**********************************************************************************/
//Get the modal
var modal = document.getElementById('myModal');
var pwd_chk = document.getElementById('pwd_chk');

// When the user clicks on <span> (x), close the modal
function close_pwdchk(){
	modal.style.display = 'none';
	pwd_chk.value = '';
}

function pwdchk_cancel(){
	modal.style.display = 'none';
	pwd_chk.value = '';
	alert('삭제를 취소합니다.');
}

function pwdchk_ok(num){
	var qa_pwd = document.getElementById('qa_pwd');
	if(qa_pwd.value == pwd_chk.value){
		alert('삭제되었습니다.');
		modal.style.display = 'none';
    	pwd_chk.value = '';
    	
		var path = 'q_a?board=delete_ok&qa_num=' + num;
		location.href = path;
	}
	else {
		alert('비밀번호가 다릅니다.');
		modal.style.display = 'none';
    	pwd_chk.value = '';
	}
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
    	modal.style.display = 'none';
    	pwd_chk.value = '';
    }
}