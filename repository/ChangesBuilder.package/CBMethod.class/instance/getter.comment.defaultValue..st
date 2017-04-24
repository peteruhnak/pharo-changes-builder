definition
getter: aVariableName comment: aComment defaultValue: aDefaultValue
	aComment ifNil: [ ^ self getter: aVariableName defaultValue: aDefaultValue ].
	self protocol: 'accessing'.
	self
		source:
			('<1s>
	"<2s>"
	^ <1s> ifNil: [ <1s> := <3s> ]'
				expandMacrosWith: aVariableName
				with: (self asComment: aComment)
				with: aDefaultValue)