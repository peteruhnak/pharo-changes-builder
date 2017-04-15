adding
compileMeta: aString classified: aProtocol
	self
		addMetaMethod:
			(CBMethod new
				source: aString;
				protocol: aProtocol)