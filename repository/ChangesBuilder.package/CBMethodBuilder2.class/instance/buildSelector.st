building
buildSelector
	^ String
		<< [ :stream | 
			selector numArgs = 0
				ifTrue: [ stream << selector ]
				ifFalse: [ selector keywords
						with: arguments
						do: [ :kw :arg | stream << kw << (self asArgument: arg) << ' ' ].
					stream cr ] ]