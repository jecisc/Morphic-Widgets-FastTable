"
I announce a strong selection on a FT cell, a Strong selection is basiclly a double click
"
Class {
	#name : #FTCellStrongSelectionChanged,
	#superclass : #FTAnnouncement,
	#instVars : [
		'event',
		'selectedIndex'
	],
	#category : #'Morphic-Widgets-FastTable-Announcement'
}

{ #category : #'instance creation' }
FTCellStrongSelectionChanged class >> cellIndex: aNumber event: anEvent [
	self deprecated: 'Use #index:event: instead' transformWith: '`@receiver cellIndex: `@statements1 event: `@statements2' -> '`@receiver index: `@statements1 event: `@statements2'.
	^ self index: aNumber event: anEvent
]

{ #category : #'instance creation' }
FTCellStrongSelectionChanged class >> index: aTuple event: anEvent [
	^ self new
		selectedIndex: aTuple;
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
	self deprecated: 'Use #selectedIndex instead' transformWith: '`@receiver selectedCellIndex' -> '`@receiver selectedIndex'.
	^ self selectedIndex
]

{ #category : #accessing }
FTCellStrongSelectionChanged >> selectedCellIndex: aNumber [
	self deprecated: 'Use #selectedIndex: instead' transformWith: '`@receiver selectedCellIndex: `@statements1' -> '`@receiver selectedIndex: `@statements1'.
	self selectedIndex: aNumber
]

{ #category : #accessing }
FTCellStrongSelectionChanged >> selectedIndex [
	^ selectedIndex 
]

{ #category : #accessing }
FTCellStrongSelectionChanged >> selectedIndex: anObject [
	selectedIndex := anObject
]
