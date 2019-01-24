"
I define the simple cell selection strategy. 

"
Class {
	#name : #FTCellSimpleSelection,
	#superclass : #FTCellSelectionStrategy,
	#category : 'Morphic-Widgets-FastTable-Selection'
}

{ #category : #testing }
FTCellSimpleSelection >> isMultiple [
	^ false
]

{ #category : #accessing }
FTCellSimpleSelection >> selectCellIndex: cellIndex event: event [
	self toggleCellIndex: cellIndex
]
