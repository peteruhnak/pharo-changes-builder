building
buildPragmas
	^ String
		<<
			[ :stream | pragmas do: [ :each | stream << (self asPragma: each) ] separatedBy: [ stream cr tab ] ]