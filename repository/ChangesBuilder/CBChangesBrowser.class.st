"
I override ChangesBrowser>>accept to provide a progress bar.
"
Class {
	#name : #CBChangesBrowser,
	#superclass : #ChangesBrowser,
	#instVars : [
		'diffModel'
	],
	#category : 'ChangesBuilder-Utilities'
}

{ #category : #specs }
CBChangesBrowser class >> defaultSpec [
	<spec>
	^ SpecLayout composed
		newColumn: [ :column1 | 
			column1
				newColumn: [ :column2 | column2 add: #changesTree ];
				addSplitter;
				add: #diffModel ]
]

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
				title: 'Applying changes';
				min: 0;
				max: self pickedChanges size;
				run ].
	window value delete
]

{ #category : #accessing }
CBChangesBrowser >> diffModel [
	^ diffModel
]

{ #category : #initialization }
CBChangesBrowser >> initialExtent [
	^ 800 @ 600
]

{ #category : #initialization }
CBChangesBrowser >> initializePresenter [
	changesTree
		whenHighlightedItemChanged: [ :item | 
			item
				ifNotNil: [ diffModel
						leftText: item content oldVersionTextToDisplay;
						rightText: item content textToDisplay ] ]
]

{ #category : #initialization }
CBChangesBrowser >> initializeWidgets [
	super initializeWidgets.
	diffModel := self newDiff.
	self focusOrder add: diffModel
]
