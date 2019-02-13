Class {
	#name : #FTAbstractColumnSortingStrategy,
	#superclass : #Object,
	#instVars : [
		'column'
	],
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #accessing }
FTAbstractColumnSortingStrategy class >> column: aColumn [
	^ self new
		column: aColumn;
		yourself
]

{ #category : #accessing }
FTAbstractColumnSortingStrategy >> column [
	^ column
]

{ #category : #accessing }
FTAbstractColumnSortingStrategy >> column: anObject [
	column := anObject
]

{ #category : #testing }
FTAbstractColumnSortingStrategy >> isSortingEnabled [
	^ true
]

{ #category : #sorting }
FTAbstractColumnSortingStrategy >> sortDataSource: aDataSource [
	self subclassResponsibility
]
