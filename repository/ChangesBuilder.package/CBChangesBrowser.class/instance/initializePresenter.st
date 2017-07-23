initialization
initializePresenter
	changesTree
		whenHighlightedItemChanged: [ :item | 
			item
				ifNotNil: [ diffModel
						leftText: item content oldVersionTextToDisplay;
						rightText: item content textToDisplay ] ]