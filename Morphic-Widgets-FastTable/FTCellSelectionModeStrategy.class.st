Class {
	#name : #FTCellSelectionModeStrategy,
	#superclass : #FTSelectionModeStrategy,
	#category : #'Morphic-Widgets-FastTable-Selection'
}

{ #category : #printing }
FTCellSelectionModeStrategy class >> symbol [
	^ #column
]

{ #category : #accessing }
FTCellSelectionModeStrategy >> associatedMultipleSelection [
	"Because we should not have cell and row simple/multiple selections..."
	self toKill.
	^ FTCellSimpleSelection
]

{ #category : #accessing }
FTCellSelectionModeStrategy >> associatedSingleSelection [
	"Because we should not have cell and row simple/multiple selections..."
	self toKill.
	^ FTCellMultipleSelection
]

{ #category : #testing }
FTCellSelectionModeStrategy >> isCellSelection [
	^ true
]

{ #category : #adding }
FTCellSelectionModeStrategy >> selectablesToHighlightFromRow: aFTRow at: aRowIndex withHighlightedIndexes: highligtedIndexes andPrimaryIndex: primarySelectionIndex [
	| selectablesToColorMap |
	selectablesToColorMap := Dictionary new.
	self flag: #clean.	"I do not like this #submorphs thing."
	aFTRow submorphs
		withIndexDo: [ :each :columnIndex | 
			| cellIndex |
			(highligtedIndexes includes: (cellIndex := {aRowIndex . columnIndex})) ifTrue: [ selectablesToColorMap at: each put: primarySelectionIndex = cellIndex ] ].
	^ selectablesToColorMap
]
