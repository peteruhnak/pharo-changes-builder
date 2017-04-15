accessing
addLine: aString
	source := String
		streamContents: [ :stream | 
			stream << source.
			indent timesRepeat: [ stream tab ].
			stream << aString.
			stream cr ]