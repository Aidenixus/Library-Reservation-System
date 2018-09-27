function Show(page, tag)
{  
	var i = 1;
	var el; 
	console.log(tag+i);
    while (el = document.getElementById(tag+i)) {
        if (i ==page )
            el.style.display = 'block';
        else
            el.style.display = 'none';
        i++;
    }
}

function ShowTime(page)
{  
	var tag;
	if(document.getElementById('loc1').style.display === 'block'){
		tag = 'time';
	}else{
		tag = 'tim';
	}
	var i = 1;
	var el; 
	//console.log(tag+i);
    while (el = document.getElementById(tag+i)) {
        if (i ==page )
            el.style.display = 'block';
        else
            el.style.display = 'none';
        i++;
    }
}