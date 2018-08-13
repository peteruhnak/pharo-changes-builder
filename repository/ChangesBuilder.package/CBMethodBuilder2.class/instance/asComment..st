utility
asComment: aString
	"aString asComment duplicates only double quotes that are alone, which is not what I want"
	^ aString copyReplaceAll: '"' with: '""'