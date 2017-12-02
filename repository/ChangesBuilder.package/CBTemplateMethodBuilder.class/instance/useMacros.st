strategies
useMacros
	self
		templateStrategy: [ :aTemplate :aContext | aTemplate expandMacrosWithArguments: aContext ]