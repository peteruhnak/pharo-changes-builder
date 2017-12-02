adding
fromRealClass: aRealClass
	| class |
	classes at: aRealClass name ifPresent: [ :cls | ^ cls ].
	class := CBClass fromClass: aRealClass.
	self addClass: class.
	^ class