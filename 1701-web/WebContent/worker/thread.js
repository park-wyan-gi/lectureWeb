/**
 * worker에서 사용되는 스레드
 */
var str = "";
for(i=1; i<=200 ; i++){
	str += i + "<br/>";
			
	for(j=0;j<9999999;j++){}
}

postMessage(str);
