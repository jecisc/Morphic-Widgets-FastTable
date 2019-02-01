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
	self toKill.
	^ false
]

{ #category : #accessing }
FTCellSimpleSelection >> selectCellIndex: cellIndex event: event [
	self toKill.
	self toggleCellIndex: cellIndex
]
