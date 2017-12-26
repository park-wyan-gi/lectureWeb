/**
 *  index.jsp에서 사용하는 스크립트
 *  date : 2017.11(pwg)
 */

function init(){
	var btnLogin = document.getElementById('btnLogin');
	var btnLogout = document.getElementById('btnLogout');
	if(btnLogin != null){
		btnLogin.onclick = function(){
			location.href = './member/login.jsp';
		}
	}
	if(btnLogout != null){
		btnLogout.onclick = function(){
			location.href = './member/logout.jsp';
		}
	}
	
}
