definition
setter: aVariableName argument: anArgumentName
	self protocol: 'accessing'.
	self
		source:
			('<1s>: <2s>
	<1s> := <2s>' expandMacrosWith: aVariableName with: (self asArgumentName: anArgumentName))