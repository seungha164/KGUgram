function register_validataion(){
	let check = /^[0-9]+$/;		// 숫자 정규식
	var id = document.register_form.u_id.value;
	var pw = document.register_form.pass.value;
	var department = document.register_form.department.value;
	var nickname = document.register_form.nickname.value;
	
	if(id=="" || pw == "" || department=="" ||  nickname== ""){			
		alert("값을 모두 입력해 주세요");
		return false;
	}
	else if(id.length!=9 || !check.test(id)){
		alert("올바른 ID 형식이 아닙니다.");
		document.register_form.u_id.focus();
		return false;
	}
	else if(pw.length < 8){				// PW 형식 : 8글자 이상
    	alert("패스워드는 8글자 이상이여야 합니다")
    	document.register_form.pw.focus();
    	return false;
    }
	document.register_form.submit();	
}

function login_validation(){
    let check = /^[0-9]+$/;		// 숫자 정규식
    var id = document.login_form.id.value;
    var pw = document.login_form.pw.value;
    			   				
    if(id=="" || pw == ""){			
    	alert("값을 모두 입력해 주세요");
    	return false;
    }
    else if(id.length != 9 || !check.test(id)){		// ID 형식 : 9글자 숫자만 필요
    	alert("올바른 ID 형식이 아닙니다.\n학번을 입력해주세요!");
    	document.login_form.id.focus();
    	return false;
    }
    else if(pw.length < 8){				// PW 형식 : 8글자 이상
    	alert("패스워드는 8글자 이상이여야 합니다")
    	document.login_form.pw.focus();
    	return false;
    }
    document.login_form.submit();	
}
function upload_validation(){
 		var content = document.fileForm.content.value;	// 문구
 		var lat = document.fileForm.latitude.value;
 		var long = document.fileForm.longitude.value;	
 		if(content==""){			
 	    	alert("문구를 입력해 주세요");
 	    	return false;
 	    }	
 	    else if(lat == "" || long == ""){			
 	    	alert("지도에 표시할 위치를 마킹해주세요");
 	    	return false;
 	    }
 	    else document.fileForm.submit();	
 	}