accessing
validateSource: aString
	[ RBParser parseMethod: aString ]
		on: SyntaxErrorNotification
		do: [ :ex | (CBSyntaxError fromSyntaxErrorNotification: ex) signal ]