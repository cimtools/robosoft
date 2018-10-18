clean:	
	find . -iname \*~ -exec rm -rfv {} \;
	find . -iname \*.~\* -exec rm -rfv {} \;
	find . -iname \*.dcu -exec rm -rfv {} \;