building
buildComment
	^ String
		<< [ :stream | 
			stream << '"'.
			comments do: [ :each | stream << (self asComment: each) ] separatedBy: [ stream cr tab ].
			stream << '"' ]