/**
 *  guestbook 과 관련한 스크립트
 *  date : 2017.11(pwg)
 */
function gbInsert(){
	
	if(document.frm_gb == null) return;
	var ff = document.frm_gb;
	ff.btnInsert.onclick = function(){
		if(ff.mid.value == ''){
			alert("먼저 로그인 해 주세용...");
		}else if(ff.content.value == ''){
			alert("내용을 입력해 주쇼");
		}else if(ff.pwd.value == ''){
			alert("암호는요 ???");
		}else{
			ff.action = 'index.jsp?inc./guestbook/main.jsp&subInc=./guestbook/insert_result.jsp';
			ff.submit();
		}
	}
}

function dbInsertResult(){
	
}

function movePage(nowPage){
	if(document.frm_page == null) return;
	var frm = document.frm_page;
	frm.nowPage.value = nowPage;
	frm.submit();
}



var flag=new Array(document.forms.length) ; //0=보기, 1=수정
function gbModify(idx, img){
	var ff = document.forms[idx];
	if(flag[idx]==0 || flag[idx]==null){
		flag[idx]=1;
		img.src = './imgs/btnSave.png';
		ff.content.readOnly=false;
		ff.pwd.readOnly=false;
		ff.content.focus();
	}else{
		flag[idx]=0;
		img.src = './imgs/btnModify.png';
		ff.content.readOnly="readOnly";
		ff.pwd.readOnly="readOnly";
		ff.action = 'index.jsp?inc./guestbook/main.jsp&subInc=./guestbook/modify_result.jsp';
		ff.submit();
	}
}

function gbDelete(ff){
	var yn = confirm("정말???");
	if(yn){
		ff.action = 'index.jsp?inc./guestbook/main.jsp&subInc=./guestbook/delete_result.jsp';
		ff.submit();
	}
	return false;
}












