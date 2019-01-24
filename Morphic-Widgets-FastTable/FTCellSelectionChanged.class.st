"
I announce a cell selection change  (usually a click, but can also be done with arrows up and down)  when the table is on the #column selection mode
"
Class {
	#name : #FTCellSelectionChanged,
	#superclass : #FTAnnouncement,
	#instVars : [
		'oldSelectedCellsIndexes',
		'newSelectedCellIndexes'
	],
	#category : 'Morphic-Widgets-FastTable-Announcement'
}

{ #category : #'instance creation' }
FTCellSelectionChanged class >> from: oldArray to: newArray [ 
	^ self new 
		oldSelectedCellsIndexes: oldArray;
		newSelectedCellIndexes: newArray;
		yourself
]

{ #category : #accessing }
FTCellSelectionChanged >> newSelectedCellIndexes [
	^newSelectedCellIndexes
]

{ #category : #accessing }
FTCellSelectionChanged >> newSelectedCellIndexes: anObject [
	newSelectedCellIndexes := anObject
]

{ #category : #accessing }
FTCellSelectionChanged >> oldSelectedCellsIndexes [
	^oldSelectedCellsIndexes
]

{ #category : #accessing }
FTCellSelectionChanged >> oldSelectedCellsIndexes: anObject [
	oldSelectedCellsIndexes := anObject
]
