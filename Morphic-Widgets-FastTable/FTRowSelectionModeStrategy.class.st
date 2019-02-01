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

{ #category : #adding }
FTRowSelectionModeStrategy >> isRowSelection [
	^ true
]

{ #category : #accessing }
FTRowSelectionModeStrategy >> nullIndex [ ^ 0
]

{ #category : #adding }
FTRowSelectionModeStrategy >> selectablesToHighlightFromRow: aFTRow at: aRowIndex withHighlightedIndexes: highligtedIndexes andPrimaryIndex: primarySelectionIndex [
	| selectablesToColorMap |
	selectablesToColorMap := Dictionary new.
	(highligtedIndexes includes: aRowIndex) ifTrue: [ selectablesToColorMap at: aFTRow put: primarySelectionIndex = aRowIndex ].
	^ selectablesToColorMap
]

{ #category : #accessing }
FTRowSelectionModeStrategy >> selectedRowIndex [
	^ self table selectedIndex
]
