adding
addComment: aString
	self addLine: '"' , (self asComment: aString) , '"'