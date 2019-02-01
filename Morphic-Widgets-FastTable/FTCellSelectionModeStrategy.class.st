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
FTCellSelectionModeStrategy >> indexesToSelectInMultipleSelectionFrom: firstIndex to: endIndex [
	| stepV stepH |
	stepV := firstIndex first <= endIndex first ifTrue: [ 1 ] ifFalse: [ -1 ].
	stepH := firstIndex second <= endIndex second ifTrue: [ 1 ] ifFalse: [ -1 ].
	^ (firstIndex second to: endIndex second by: stepH) flatCollect: [ :v | (firstIndex first to: endIndex first by: stepV) collect: [ :h | {h . v} ] ]
]

{ #category : #testing }
FTCellSelectionModeStrategy >> is: anIndex aboveRow: aRowIndex [
	^ anIndex first < aRowIndex
]

{ #category : #testing }
FTCellSelectionModeStrategy >> is: anIndex afterColumn: aColumnIndex [
	^ anIndex second > aColumnIndex 
]

{ #category : #testing }
FTCellSelectionModeStrategy >> is: anIndex beforeColumn: aColumnIndex [
	^ anIndex second < aColumnIndex 
]

{ #category : #testing }
FTCellSelectionModeStrategy >> is: anIndex bellowRow: aRowIndex [
	^ anIndex first > aRowIndex
]

{ #category : #testing }
FTCellSelectionModeStrategy >> isCellSelection [
	^ true
]

{ #category : #accessing }
FTCellSelectionModeStrategy >> nullIndex [
	^ #(0 0)
]

{ #category : #accessing }
FTCellSelectionModeStrategy >> rowIndexFrom: anIndex [
	^ anIndex first
]

{ #category : #accessing }
FTCellSelectionModeStrategy >> selectableIndexAbove: anIndex [
	^ {(anIndex first - 1) . anIndex second}
]

{ #category : #accessing }
FTCellSelectionModeStrategy >> selectableIndexAfter: anIndex [
	^ {anIndex first . (anIndex second + 1)}
]

{ #category : #accessing }
FTCellSelectionModeStrategy >> selectableIndexBefore: anIndex [
	^ {anIndex first . (anIndex second - 1)}
]

{ #category : #accessing }
FTCellSelectionModeStrategy >> selectableIndexBellow: anIndex [
	^ {(anIndex first + 1) . anIndex second}
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