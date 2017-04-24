accessing
methodNamed: aName
	^ self methods detect: [ :each | each selector = aName ]