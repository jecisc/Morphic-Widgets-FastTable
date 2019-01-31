Class {
	#name : #FTRowSelectionModeStrategy,
	#superclass : #FTSelectionModeStrategy,
	#category : #'Morphic-Widgets-FastTable-Selection'
}

{ #category : #printing }
FTRowSelectionModeStrategy class >> symbol [
	^ #row
]

{ #category : #'as yet unclassified' }
FTRowSelectionModeStrategy >> selectablesToHighlightFromRow: aFTRow at: aRowIndex withHighlightedIndexes: highligtedIndexes andPrimaryIndex: primarySelectionIndex [
	| selectablesToColorMap |
	selectablesToColorMap := Dictionary new.
	(highligtedIndexes includes: aRowIndex) ifTrue: [ selectablesToColorMap at: aFTRow put: primarySelectionIndex = aRowIndex ].
	^ selectablesToColorMap
]
