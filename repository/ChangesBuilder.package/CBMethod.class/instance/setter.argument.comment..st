definition
setter: aVariableName argument: anArgumentName comment: aComment
	aComment ifNil: [ ^ self setter: aVariableName argument: anArgumentName ].
	self protocol: 'accessing'.
	self
		source:
			('<1s>: <2s>
	"<3s>"
	<1s> := <2s>'
				expandMacrosWith: aVariableName
				with: (self asArgumentName: anArgumentName)
				with: (self asComment: aComment))