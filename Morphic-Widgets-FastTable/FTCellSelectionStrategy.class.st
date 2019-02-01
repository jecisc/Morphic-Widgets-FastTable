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
FTCellSelectionStrategy class >> table: aFastTableMorph [
	^ self new
		table: aFastTableMorph;
		yourself
]

{ #category : #testing }
FTCellSelectionStrategy >> isMultiple [
	self toKill.
	^ self subclassResponsibility
]

{ #category : #testing }
FTCellSelectionStrategy >> isSimple [
	self toKill.
	^ self isMultiple not
]

{ #category : #accessing }
FTCellSelectionStrategy >> selectCellIndex: cellIndex event: event [
	self toKill.
	self subclassResponsibility
]

{ #category : #accessing }
FTCellSelectionStrategy >> table [
	self toKill.
	^ table
]

{ #category : #accessing }
FTCellSelectionStrategy >> table: aTable [
	self toKill.
	table := aTable
]

{ #category : #private }
FTCellSelectionStrategy >> toggleCellIndex: cellIndex [
	self toKill.
	((self table selectedIndexes includes: cellIndex) and: [ self table selectedIndexes size = 1 and: [ self table allowsDeselection ]	"just one selected" ])
		ifTrue: [ self table selectIndexes: #() ]
		ifFalse: [ self table selectIndex: cellIndex ]
]
