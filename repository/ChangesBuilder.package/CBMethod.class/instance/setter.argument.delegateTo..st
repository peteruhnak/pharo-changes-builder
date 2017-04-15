definition
setter: aVariableName argument: anArgumentName delegateTo: aString
	self protocol: 'accessing'.
	self
		source:
			('<1s>: <2s>
	<3s> <1s>: <2s>'
				expandMacrosWith: aVariableName
				with: (self asArgumentName: anArgumentName)
				with: aString)