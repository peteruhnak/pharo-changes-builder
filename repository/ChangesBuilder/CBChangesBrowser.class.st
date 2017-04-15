"
I override ChangesBrowser>>accept to provide a progress bar.
"
Class {
	#name : #CBChangesBrowser,
	#superclass : #ChangesBrowser,
	#category : 'ChangesBuilder-Utilities'
}

{ #category : #visiting }
CBChangesBrowser >> accept [
	self okToChange
		ifFalse: [ ^ self ].
	self pickedChanges
		ifNotEmpty: [ [ :job | 
			self pickedChanges
				do: [ :change | 
					RBRefactoryChangeManager instance performChange: change.
					job increment ] ] asJob
				title: 'Generating code';
				min: 0;
				max: self pickedChanges size;
				run ].
	window value delete
]
