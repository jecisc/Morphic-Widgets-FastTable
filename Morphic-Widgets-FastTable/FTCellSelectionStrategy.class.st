"
I define a strategy to handle cell selections. 
"
Class {
	#name : #FTCellSelectionStrategy,
	#superclass : #Object,
	#instVars : [
		'table'
	],
	#category : 'Morphic-Widgets-FastTable-Selection'
}

{ #category : #'instance creation' }
FTCellSelectionStrategy class >> new [
	self error: 'Use #table:'
]

{ #category : #'instance creation' }
FTCellSelectionStrategy class >> table: aFastTableMorph [
	^ self basicNew
		initializeTable: aFastTableMorph;
		yourself
]

{ #category : #initialization }
FTCellSelectionStrategy >> initializeTable: aTable [
	table := aTable.
	self initialize
]

{ #category : #testing }
FTCellSelectionStrategy >> isMultiple [
	^ self subclassResponsibility
]

{ #category : #testing }
FTCellSelectionStrategy >> isSimple [
	^ self isMultiple not
]

{ #category : #accessing }
FTCellSelectionStrategy >> selectCellIndex: cellIndex event: event [
	self subclassResponsibility
]

{ #category : #accessing }
FTCellSelectionStrategy >> table [
	^ table
]

{ #category : #private }
FTCellSelectionStrategy >> toggleCellIndex: cellIndex [
	((self table selectedCellsIndexes includes: cellIndex) 
		and: [ self table selectedCellsIndexes size = 1 "just one selected"
		and: [ self table allowsDeselection ] ])
			ifTrue: [  self table selectCellIndexes: #() ]
			ifFalse: [
				self table selectCellIndex: cellIndex ]
]
