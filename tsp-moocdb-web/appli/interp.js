function nettoyage(txt) {
	var temp="";
	var i=0;
	var flag=0;
	while (txt.charAt(i)=="\n" || txt.charAt(i)=="\r" || txt.charAt(i)=="\t" || txt.charAt(i)==" ") i++;
	while (i<txt.length) {
		if (txt.charAt(i)=="\n") {
			temp=temp+"\n";
			i++;
			while(txt.charAt(i)=="\n" || txt.charAt(i)=="\r") i++;
		} else {
			if (txt.charAt(i)=="\t" || txt.charAt(i)==" ") {
				temp=temp+" ";
				i++;
				while(txt.charAt(i)=="\t"|| txt.charAt(i)==" ") i++;
			} else {
				temp=temp+txt.charAt(i);
				flag=0;
				i++;
			}
		}
	}
	return temp;
}