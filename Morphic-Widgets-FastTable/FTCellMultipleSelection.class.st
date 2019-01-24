"
I define the multiple cell selection strategy. 

"
Class {
	#name : #FTCellMultipleSelection,
	#superclass : #FTCellSelectionStrategy,
	#category : 'Morphic-Widgets-FastTable-Selection'
}

{ #category : #testing }
FTCellMultipleSelection >> isMultiple [
	^ true
]

{ #category : #private }
FTCellMultipleSelection >> selectAppendingCellIndex: cellIndex [
	| currentSelection newSelection |
	currentSelection := self table selectedCellsIndexes.
	
	newSelection := (currentSelection includes: cellIndex)
		ifTrue: [ currentSelection copyWithout: cellIndex ]
		ifFalse: [ currentSelection copyWithFirst: cellIndex].
		
	self table selectCellIndexes: newSelection
]

{ #category : #accessing }
FTCellMultipleSelection >> selectCellIndex: cellIndex event: event [
	event shiftPressed ifTrue: [ ^ self selectCellIndexesUpTo: cellIndex ].
	OSPlatform current isMacOS 
	ifTrue:[event commandKeyPressed ifTrue: [^ self selectAppendingCellIndex: cellIndex  ]] 
	ifFalse:[event controlKeyPressed ifTrue: [^ self selectAppendingCellIndex: cellIndex  ]].
	self toggleCellIndex: cellIndex.

]

{ #category : #private }
FTCellMultipleSelection >> selectCellIndexes: cellIndex previous: oldSelection [		
	"Make sure the selected cell index is the first in selection range"
	self table selectCellIndexes: (((oldSelection includes: cellIndex)
		ifTrue: [ oldSelection copyWithout: cellIndex ]
		ifFalse: [ oldSelection] )
		copyWithFirst: cellIndex)
]

{ #category : #private }
FTCellMultipleSelection >> selectCellIndexesUpTo: endIndex [
	"Selects a range of cell, from what is already selected to a new celIndex, but make sure the selection is from the same column. 
	 This is used in case of multiple selections (when holding shift)"
	| oldSelected firstIndex stepV stepH tupleCollection|
	"step vertical and step horizontal help create rectangular selections"

	oldSelected := self table selectedCellsIndexes.
	firstIndex :=  oldSelected 
		ifNotEmpty: [ oldSelected first ]
		ifEmpty: [ endIndex ].
	stepV := firstIndex first <= endIndex first 
		ifTrue: [ 1 ] 
		ifFalse: [ -1 ]. 
	stepH := firstIndex second <= endIndex second 
		ifTrue: [ 1 ] 
		ifFalse: [ -1 ]. 
		tupleCollection:=OrderedCollection  new. "holds cell indexes from the firt to the last selected cell"
		firstIndex second to: endIndex second by: stepH do:[:v| 
		 firstIndex first to: endIndex first by: stepV do:[:h| tupleCollection add: (Array with:h with:v)  ].
		].
		

	self 
		selectCellIndexes: endIndex 
		previous: (oldSelected union: tupleCollection)
]
