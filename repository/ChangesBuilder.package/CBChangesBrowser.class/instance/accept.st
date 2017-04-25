visiting
accept
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