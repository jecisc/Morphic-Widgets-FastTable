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
	self flag: #toKill.
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
FTSelectionModeStrategy class >> table: aTable [
	^ self new
		table: aTable;
		yourself
]

{ #category : #accessing }
FTSelectionModeStrategy >> table [
	^ table
]

{ #category : #accessing }
FTSelectionModeStrategy >> table: anObject [
	table := anObject
]
