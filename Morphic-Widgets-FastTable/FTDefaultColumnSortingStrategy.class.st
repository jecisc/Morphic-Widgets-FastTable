Class {
	#name : #FTDefaultColumnSortingStrategy,
	#superclass : #FTAbstractColumnSortingStrategy,
	#instVars : [
		'state'
	],
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #initialization }
FTDefaultColumnSortingStrategy >> initialize [
	super initialize.
	self reset
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
