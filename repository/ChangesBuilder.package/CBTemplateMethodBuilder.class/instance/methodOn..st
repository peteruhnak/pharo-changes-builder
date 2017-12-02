building
methodOn: aContext
	^ CBMethod new
		source: (self sourceOn: aContext);
		protocol: protocol;
		yourself