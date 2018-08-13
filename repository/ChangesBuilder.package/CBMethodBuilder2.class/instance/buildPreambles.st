building
buildPreambles
	^ String
		<< [ :stream | 
			stream << self buildSelector.
			self buildComment ifNotEmpty: [ :com | stream tab << com ].
			self buildPragmas ifNotEmpty: [ :prag | stream tab << prag ] ]