/**
 * 작성자 : pwg
 * 작성일 : 2014.6
 * ----------------------------------
 * 멀티 게시판에 관련한 자바스크립트
 * mybatis로 변경
 * ---------------------------------- 
 */

function getId(id){ return document.getElementById(id)}

var url= 'index.jsp?inc_content=./board_myba/';
var part = 'default';

//-----------------------------------
// 게시판 종류 설정 및 선택
// -----------------------------------
function setPart(p){
	part = p;
}
function getPart(){
	return part;
}

//-----------------------------------
// 스크립트 초기화
//-----------------------------------
function init(){
	if(getId('btnList') != null){
		getId('btnList').onclick=function(){
			location.href = url + 'list.jsp';
		}
	}
	if(getId('btnInsert') != null){
		getId('btnInsert').onclick=function(){
			location.href =	url + 'register.jsp';
		}
	}
	if(getId('btnSave') != null){
		getId('btnSave').onclick=function(){
			community_form.action = url + 'register_result.jsp';
			community_form.submit();
			
		}
	}

	if(getId('btnFind') != null){
		getId('btnFind').onclick=function(){
			community_form.action = url + 'list.jsp';
			community_form.submit();
		}
	}
	
	if(getId('btnInsertResult') != null){
		getId('btnInsertResult').onclick=function(){
			community_form.action = url + 'upload_result.jsp';
			community_form.submit();
		}
	}
	
	if(getId('btnModifyResult') != null){
		getId('btnModifyResult').onclick=function(){
			community_form.action = url + 'modify_result.jsp';
			community_form.submit();
		}
	}
	if(getId('btnRepResult') != null){
		getId('btnRepResult').onclick=function(){
			community_form.action = url + 'rep_register_result.jsp';
			community_form.submit();
		}
	}
}

function view(serial){
	location.href =	url + 'view.jsp&serial=' + serial;
}


function modify(serial){
	location.href =	url + 'modify.jsp&serial=' + serial;
}
function rep(serial, grp, deep){
	location.href =	url + 'rep_register.jsp&serial=' + serial
				 + '&grp=' + grp + '&deep='+deep;
}



function del(serial, filename){
	var f = confirm("정말 삭제하시겠습니까 ???");
	if(f){
		location.href =	url + 'delete_result.jsp&serial=' + serial
					  + "&filename=" + filename;
	}else{
		alert("삭제가 취소되었습니다.");
	}
}


function fileDel(fileDelFlag, serial){
	location.href =	url + 'modify.jsp&fileDelFlag=' + fileDelFlag
	  			   + '&serial=' + serial;
}


// 파일 다운로드 스크립트
// 새창을 열어 첨부파일을 무조건 다운로드하도록 조치
function fileDownload(filename){
	var yn = confirm("파일을 다운로드 하시겠습니가 ???");
	if(yn){
		var u = './board_myba/filedownload.jsp?filename='+ filename;
		filedownload.location.href= u;
	}else{
		alert("작업이 취소되었습니다.");
	}
}

function goPage(page){
	var ff = document.community_form;
	ff.nowPage.value = page;
	ff.action = url + 'list.jsp';
	ff.submit();
}

//------------------------------------
// 게시판 종류 선택
//------------------------------------
function goBoard(part){
	var frm = document.board_list;
	frm.action="index.do";
	frm.part.value = part;
	frm.submit();
}

