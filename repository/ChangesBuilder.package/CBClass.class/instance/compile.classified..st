adding
compile: aString classified: aProtocol
	self
		addMethod:
			(CBMethod new
				source: aString;
				protocol: aProtocol)