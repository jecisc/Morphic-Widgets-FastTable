"
I announce a cell data change, when the content of a cell get updated i propagate the event to the data source, i could be handled when creating the table as well.
"
Class {
	#name : #FTCellContentChanged,
	#superclass : #FTAnnouncement,
	#instVars : [
		'oldCellContent',
		'newCellContent'
	],
	#category : 'Morphic-Widgets-FastTable-Announcement'
}

{ #category : #'instance creation' }
FTCellContentChanged class >> from: oldData to: newData [
	^ self new 
		oldCellContent:  oldData;
		newCellContent:  newData;
		yourself
]

{ #category : #accessing }
FTCellContentChanged >> newCellContent [
	^newCellContent
]

{ #category : #accessing }
FTCellContentChanged >> newCellContent: anObject [
	newCellContent := newCellContent
]

{ #category : #accessing }
FTCellContentChanged >> oldCellContent [
	^oldCellContent
]

{ #category : #accessing }
FTCellContentChanged >> oldCellContent: anObject [
	oldCellContent := anObject 
]
