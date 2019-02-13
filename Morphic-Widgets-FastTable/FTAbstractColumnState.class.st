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
FTAbstractColumnState >> executeSorting [
	self subclassResponsibility
]

{ #category : #sorting }
FTAbstractColumnState >> moveToNextState [
	self context state: self nextState
]

{ #category : #accessing }
FTAbstractColumnState >> nextState [
	^ self subclassResponsibility
]

{ #category : #sorting }
FTAbstractColumnState >> sort: aDataSource [
	self executeSorting.
	self moveToNextState
]

{ #category : #accessing }
FTAbstractColumnState >> sortingIcon [
	^ self subclassResponsibility
]
