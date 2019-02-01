Class {
	#name : #FTSelectionModeStrategy,
	#superclass : #Object,
	#instVars : [
		'table'
	],
	#category : #'Morphic-Widgets-FastTable-Selection'
}

{ #category : #printing }
FTSelectionModeStrategy class >> symbol [
	"Because we want to use dispatch with the strategy"
	self toKill.
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
FTSelectionModeStrategy class >> table: aTable [
	^ self new
		table: aTable;
		yourself
]

{ #category : #accessing }
FTSelectionModeStrategy >> associatedMultipleSelection [
	"Because we should not have cell and row simple/multiple selections..."
	self toKill.
	^ self subclassResponsibility
]

{ #category : #accessing }
FTSelectionModeStrategy >> associatedSingleSelection [
	"Because we should not have cell and row simple/multiple selections..."
	self toKill.
	^ self subclassResponsibility
]

{ #category : #testing }
FTSelectionModeStrategy >> isCellSelection [
	^ false
]

{ #category : #testing }
FTSelectionModeStrategy >> isRowSelection [
	^ false
]

{ #category : #accessing }
FTSelectionModeStrategy >> nullIndex [
	^ self subclassResponsibility
]

{ #category : #adding }
FTSelectionModeStrategy >> selectablesToHighlightFromRow: aFTRow at: aRowIndex withHighlightedIndexes: highligtedIndexes andPrimaryIndex: primarySelectionIndex [
	^ self subclassResponsibility
]

{ #category : #accessing }
FTSelectionModeStrategy >> selectedRowIndex [
	^ self subclassResponsibility
]

{ #category : #accessing }
FTSelectionModeStrategy >> table [
	^ table
]

{ #category : #accessing }
FTSelectionModeStrategy >> table: anObject [
	table := anObject
]
