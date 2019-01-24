"
I announce a strong selection on a FT cell, a Strong selection is basiclly a double click
"
Class {
	#name : #FTCellStrongSelectionChanged,
	#superclass : #FTAnnouncement,
	#instVars : [
		'selectedCellIndex',
		'event'
	],
	#category : 'Morphic-Widgets-FastTable-Announcement'
}

{ #category : #'instance creation' }
FTCellStrongSelectionChanged class >> cellIndex: aTuple event: anEvent [
	^ self new 
		selectedCellIndex: aTuple;
		event: anEvent;
		yourself
]

{ #category : #accessing }
FTCellStrongSelectionChanged >> event [
	^ event 
]

{ #category : #accessing }
FTCellStrongSelectionChanged >> event: anEvent [
	event := anEvent
]

{ #category : #accessing }
FTCellStrongSelectionChanged >> selectedCellIndex [
	^ selectedCellIndex 
]

{ #category : #accessing }
FTCellStrongSelectionChanged >> selectedCellIndex: anObject [
	selectedCellIndex := anObject
]
