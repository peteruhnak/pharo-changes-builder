adding
classNamed: aName
	| class |
	classes at: aName ifPresent: [ :cls | ^ cls ].
	class := CBClass new name: aName.
	self addClass: class.
	^ class