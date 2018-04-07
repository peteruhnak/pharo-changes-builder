initialization
styledErrorMessage
	^ self errorCode asText
		copyReplaceFrom: self location
		to: self location - 1
		with: ((self messageText , ' -> ') asText allBold makeAllColor: Color red)