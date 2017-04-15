definition
getter: aVariableName comment: aComment
	aComment ifNil: [ ^ self getter: aVariableName ].
	self protocol: 'accessing'.
	self
		source:
			('<1s>
	"<2s>"
	^ <1s>' expandMacrosWith: aVariableName with: (self asComment: aComment))