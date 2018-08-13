*ChangesBuilder
asRetriever
	"Return a gette message from a setter message. For example,
	#name: asRetriever returns #name
	return self if it is already a getter"

	self endsWithAColon
		ifFalse: [ ^ self ].
	^ (self copyWithout: $:) asSymbol