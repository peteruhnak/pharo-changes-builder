building
basicBuildSetter
	selector := selector asMutator.
	^ String
		<< [ :stream | 
			stream << self buildPreambles.
			stream << selector asRetriever << ' := ' << (self asArgument: arguments first) ]