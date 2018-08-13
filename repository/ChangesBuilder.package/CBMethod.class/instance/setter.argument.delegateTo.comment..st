definition
setter: aVariableName argument: anArgumentName delegateTo: aString comment: aComment
	self protocol: 'accessing'.
	self
		source:
			('<1s>: <2s>
	"<4s>"
	<3s> <1s>: <2s>'
				expandMacrosWith: aVariableName
				with: (self asArgumentName: anArgumentName)
				with: aString
				with: (self asComment: aComment))