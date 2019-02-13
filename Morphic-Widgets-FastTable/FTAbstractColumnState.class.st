Class {
	#name : #FTAbstractColumnState,
	#superclass : #Object,
	#instVars : [
		'context'
	],
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #'instance creation' }
FTAbstractColumnState class >> context: aContext [
	^ self new
		context: aContext;
		yourself
]

{ #category : #accessing }
FTAbstractColumnState >> context [
	^ context
]

{ #category : #accessing }
FTAbstractColumnState >> context: anObject [
	context := anObject
]

{ #category : #sorting }
FTAbstractColumnState >> executeSortingOn: aDataSource [
	self subclassResponsibility
]

{ #category : #accessing }
FTAbstractColumnState >> nextState [
	^ self subclassResponsibility
]

{ #category : #sorting }
FTAbstractColumnState >> sort: aDataSource [
	| nextState |
	nextState := self nextState.
	self context state: nextState.
	nextState executeSortingOn: aDataSource
]

{ #category : #accessing }
FTAbstractColumnState >> sortingIcon [
	^ self subclassResponsibility
]
