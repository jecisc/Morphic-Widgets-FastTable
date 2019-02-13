Class {
	#name : #FTDefaultColumnSortingStrategy,
	#superclass : #FTAbstractColumnSortingStrategy,
	#instVars : [
		'state',
		'property'
	],
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #'instance creation' }
FTDefaultColumnSortingStrategy class >> column: aColumn property: aValuable [
	^ (self column: aColumn)
		property: aValuable;
		yourself
]

{ #category : #initialization }
FTDefaultColumnSortingStrategy >> initialize [
	super initialize.
	self reset
]

{ #category : #accessing }
FTDefaultColumnSortingStrategy >> property [
	^ property
]

{ #category : #accessing }
FTDefaultColumnSortingStrategy >> property: aString [ 
	property := aString
]

{ #category : #initialization }
FTDefaultColumnSortingStrategy >> reset [
	self state: (FTUnsortedColumnState context: self)
]

{ #category : #sorting }
FTDefaultColumnSortingStrategy >> sortDataSource: aDataSource [
	self state sort: aDataSource
]

{ #category : #accessing }
FTDefaultColumnSortingStrategy >> sortingIcon [
	^ self state sortingIcon
]

{ #category : #accessing }
FTDefaultColumnSortingStrategy >> state [
	^ state
]

{ #category : #accessing }
FTDefaultColumnSortingStrategy >> state: anObject [
	state := anObject
]
