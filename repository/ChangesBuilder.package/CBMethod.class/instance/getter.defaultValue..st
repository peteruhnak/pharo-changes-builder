definition
getter: aVariableName defaultValue: aDefaultValue
	self protocol: 'accessing'.
	self
		source:
			('<1s>
	^ <1s> ifNil: [ <1s> := <2s> ]'
				expandMacrosWith: aVariableName
				with: aDefaultValue)