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
FTRowSelectionModeStrategy >> indexesToSelectInMultipleSelectionFrom: firstIndex to: endIndex [
	| step |
	step := firstIndex <= endIndex ifTrue: [ 1 ] ifFalse: [ -1 ].
	^ firstIndex to: endIndex by: step
]

{ #category : #testing }
FTRowSelectionModeStrategy >> is: anIndex aboveRow: aRowIndex [
	^ anIndex < aRowIndex
]

{ #category : #testing }
FTRowSelectionModeStrategy >> is: anIndex afterColumn: aColumnIndex [
	"Not possible for rows."

	^ false
]

{ #category : #testing }
FTRowSelectionModeStrategy >> is: anIndex beforeColumn: aColumn [
	"Not possible for rows."

	^ false
]

{ #category : #testing }
FTRowSelectionModeStrategy >> is: anIndex bellowRow: aRowIndex [
	^ anIndex > aRowIndex
]

{ #category : #adding }
FTRowSelectionModeStrategy >> isRowSelection [
	^ true
]

{ #category : #accessing }
FTRowSelectionModeStrategy >> nullIndex [ ^ 0
]

{ #category : #accessing }
FTRowSelectionModeStrategy >> rowIndexFrom: anIndex [
	^ anIndex
]

{ #category : #accessing }
FTRowSelectionModeStrategy >> selectableIndexAbove: anIndex [
	^ anIndex - 1
]

{ #category : #accessing }
FTRowSelectionModeStrategy >> selectableIndexAfter: anIndex [
	"Because rows cannot have something at the right or left."

	self shouldNotImplement
]

{ #category : #accessing }
FTRowSelectionModeStrategy >> selectableIndexBefore: anIndex [
	"Because rows cannot have something at the right or left."

	self shouldNotImplement
]

{ #category : #accessing }
FTRowSelectionModeStrategy >> selectableIndexBellow: anIndex [
	^ anIndex + 1
]

{ #category : #adding }
FTRowSelectionModeStrategy >> selectablesToHighlightFromRow: aFTRow at: aRowIndex withHighlightedIndexes: highligtedIndexes andPrimaryIndex: primarySelectionIndex [
	| selectablesToColorMap |
	selectablesToColorMap := Dictionary new.
	(highligtedIndexes includes: aRowIndex) ifTrue: [ selectablesToColorMap at: aFTRow put: primarySelectionIndex = aRowIndex ].
	^ selectablesToColorMap
]