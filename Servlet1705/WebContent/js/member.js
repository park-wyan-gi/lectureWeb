/**
 *  member와 관련한 스크립트
 *  date : 2017.11(pwg)
 */
var url = "index.jsp?inc=./member/";
var homeUrl = "/web1705/index.jsp";

//----------------------------------
// login
//----------------------------------
function initLogin(){
	var frm = document.frm_login;
	if(frm == null) return;
	
	var btnLogin = frm.btnLogin;
	var btnCancel = frm.btnCancel;
	
	
	if(btnLogin != null){
		frm.btnLogin.onclick = function(){
			if(frm.mid.value == ""){
				alert("아이디를 입력해 주세요!!");
				frm.mid.focus();
			}else if(frm.pwd.value == ""){
				alert("암호를 입력해 주세요!!");
				frm.pwd.focus();
			}else{
				frm.action = 'login_result.jsp';
				frm.submit();
			}
		}
	}
	
	if(btnCancel != null){
		frm.btnCancel.onclick = function(){
			history.back();
		}
	}
}

// ----------------------------
// list
// ----------------------------
                 
function initList(){
	var frm = document.frm_member;
	if(frm == null) return;
	
	var btnInsert = frm.btnInsert;
	var btnFind = frm.btnFind;

	var url;

	if(btnInsert != null){
		btnInsert.onclick=function(){
			var u = url + 'insert_form.jsp';
			frm.action = u;
			frm.submit();
		}
	}
	
	if(btnFind != null ){
		btnFind.onclick = function(){
			frm.nowPage.value = 1;
			frm.submit();
		}
	}
}

function listModify(obj){
	var frm = document.frm_member;
	if(frm != null){
		var u = url + "modify_form.jsp";
		frm.action = u;
		frm.mid.value = obj.text;
		frm.submit();
	}
	return false;
}

function movePage(nowPage){
	if(document.frm_member == null) return;
	var frm = document.frm_member;
	frm.nowPage.value = nowPage;
	frm.submit();
}

// ----------------------------------
// insert_form
// ----------------------------------
function initInsertForm(){
	if(document.frm_insert == null) return;
	
	var frm = document.frm_insert;
	
	var idC  = frm.btnIdCheck;
	var zip = frm.btnFindZip;
	var btnRegisger = frm.btnRegister;
	var btnCancel = frm.btnCancel;
	var btnList = frm.btnList;
	
	idC.onclick = function(){
		if(frm.mid.value == ''){
			alert('먼저 아이디를 입력해 주세요.');
			return;
		}
		var page = 'idCheck.jsp?mid=' + frm.mid.value;
		var win = window.open(page,'win', 'width=300, height=200');
	}
	
	zip.onclick = function(){
		var win = window.open('zipCode.jsp','win', 'width=300, height=500');
	}
	
	
	btnRegisger.onclick = function(){
		if( !checkData(frm) ){
			return;
		}
		
		frm.action = url + 'insert_result.jsp';;
		frm.submit();
	}
	
	btnCancel.onclick = function(){
		history.back();
	}
	
	btnList.onclick = function(){
		
		frm.action = url + 'list.jsp';;
		frm.submit();
	}
	
	
}

//--------------------------
// 공통(insert, modify)
// -------------------------
function checkData(frm){
	var b=true;
	for(i=0 ; i<frm.length ; i++){
		if(frm[i].type != 'text') continue;
		if(frm[i].value == ''){
			frm[i].focus();
			alert( ' 자료를 입력해 주세요' );
			b=false;
			break;
		}
	}
	
	return b;
}

//------------------------------------
//삭제 결과
//------------------------------------
function initInsertResult(){
	if(document.frm_insert_result == null) return;
	var frm = document.frm_insert_result;
	
	frm.btnMain.onclick = function(){
		frm.action = homeUrl;
		frm.submit();
	}
	
	frm.btnList.onclick = function(){
		frm.action = url + "list.jsp";
		frm.submit();
	}
	
}

// --------------------------------------
// modify_form
// --------------------------------------
function initModifyForm(){
	if(document.frm_modify == null) return;
	var frm = document.frm_modify;
	
	var btnDelete = frm.btnDelete;
	var zip = frm.btnFindZip;
	var btnModify = frm.btnModify;
	var btnCancel = frm.btnCancel;
	var btnList = frm.btnList;
	
	zip.onclick = function(){
		var win = window.open('zipCode.jsp','win', 'width=300, height=500');
	}
	
	btnDelete.onclick = function(){
		var yn = confirm("정말 삭제 ????");
		if(yn){
			frm.action = url + 'delete_result.jsp';
			frm.submit();
		}
	}
	btnModify.onclick = function(){
		if(!checkData(frm)){
			return ;
		}
		frm.action = url + 'modify_result.jsp';
		frm.submit();
	}
	
	btnCancel.onclick = function(){
		history.back();
	}
	
	btnList.onclick = function(){
		frm.action = url + 'list.jsp';
		frm.submit();
	}
}

// ------------------------------------
// 수정결과
// ------------------------------------
function initModifyResult(){
	if(document.frm_modify_result == null) return;
	var frm = document.frm_modify_result;
	
	frm.btnMain.onclick = function(){
		frm.action = homeUrl;
		frm.submit();
	}
	
	frm.btnList.onclick = function(){
		frm.action = url + 'list.jsp';
		frm.submit();
	}
	
}

//------------------------------------
//삭제 결과
//------------------------------------
function initDeleteResult(){
	if(document.frm_delete_result == null) return;
	var frm = document.frm_delete_result;
	
	frm.btnMain.onclick = function(){
		frm.action = honeUrl;
		frm.submit();
	}
	
	frm.btnList.onclick = function(){
		frm.action = url + 'list.jsp';
		frm.submit();
	}
	
}


















