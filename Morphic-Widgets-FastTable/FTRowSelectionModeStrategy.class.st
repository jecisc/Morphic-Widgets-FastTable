Class {
	#name : #FTRowSelectionModeStrategy,
	#superclass : #FTSelectionModeStrategy,
	#category : #'Morphic-Widgets-FastTable-Selection'
}

{ #category : #printing }
FTRowSelectionModeStrategy class >> symbol [
	^ #row
]

{ #category : #accessing }
FTRowSelectionModeStrategy >> associatedMultipleSelection [
	"Because we should not have cell and row simple/multiple selections..."
	self toKill.
	^ FTMultipleSelection
]

{ #category : #accessing }
FTRowSelectionModeStrategy >> associatedSingleSelection [
	"Because we should not have cell and row simple/multiple selections..."
	self toKill.
	^ FTSimpleSelection
]

{ #category : #adding }
FTRowSelectionModeStrategy >> isRowSelection [
	^ true
]

{ #category : #adding }
FTRowSelectionModeStrategy >> selectablesToHighlightFromRow: aFTRow at: aRowIndex withHighlightedIndexes: highligtedIndexes andPrimaryIndex: primarySelectionIndex [
	| selectablesToColorMap |
	selectablesToColorMap := Dictionary new.
	(highligtedIndexes includes: aRowIndex) ifTrue: [ selectablesToColorMap at: aFTRow put: primarySelectionIndex = aRowIndex ].
	^ selectablesToColorMap
]
