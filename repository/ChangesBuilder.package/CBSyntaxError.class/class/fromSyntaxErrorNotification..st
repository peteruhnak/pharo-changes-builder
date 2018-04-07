instance creation
fromSyntaxErrorNotification: aNotification
	^ self new
		setCode: aNotification errorCode
		location: aNotification location
		errorMessage: aNotification errorMessage