"
I'm a simple datasource and just implement a direct-to-table provision of my elements.  I can work with the default implementation of FTTableMorph. 

Users might want to subclass me to have better options.
"
Class {
	#name : #FTSimpleDataSource,
	#superclass : #FTDataSource,
	#instVars : [
		'elements'
	],
	#category : #'Morphic-Widgets-FastTable-DataSource'
}

{ #category : #'instance creation' }
FTSimpleDataSource class >> elements: aCollection [
	^ self new elements: aCollection
]

{ #category : #accessing }
FTSimpleDataSource >> cellColumn: column row: rowIndex [ 
	^ FTCellMorph new
		addMorphBack: (self elementAt: rowIndex) asMorph;
		yourself
	
	
]

{ #category : #accessing }
FTSimpleDataSource >> elementAt: index [
	^ self elements at: index
]

{ #category : #accessing }
FTSimpleDataSource >> elements [
	^ elements
]

{ #category : #accessing }
FTSimpleDataSource >> elements: anObject [
	elements := anObject
]

{ #category : #'private ' }
FTSimpleDataSource >> getCellMorphContent: column [
	column isSortEnabled ifFalse: [ ^ column id asStringMorph ]
	ifTrue:[ 
		|trg pane|
pane := Morph new.
pane layoutPolicy: TableLayout new. 
pane listDirection: #rightToLeft. 
pane hResizing: #shrinkWrap.
pane vResizing: #shrinkWrap.
pane layoutInset: 5@2. 
pane  cellInset:5@0.
pane color: Color transparent.
column sortingStrategy isColumnOrderedFromGreatest ifTrue: [ trg:= (Smalltalk ui icons 
iconNamed: #arrowDown) asMorph ].
column sortingStrategy isColumnOrderedFromLeast  ifTrue: [ trg:= (Smalltalk ui icons 
iconNamed: #arrowUp) asMorph ].


pane addMorph: trg.
pane addMorph: column id asStringMorph.
^ pane ]
	
]

{ #category : #accessing }
FTSimpleDataSource >> headerColumn: column [
	column id ifNil: [ ^ nil ].
	^ FTHeaderColumnCellMorph new
		listCentering: #left;
		column: column;
		addMorph: (self getCellMorphContent: column);
		yourself
]

{ #category : #accessing }
FTSimpleDataSource >> newDataSourceMatching: aFTFilter [
	| newElements |
	newElements := Array withAll: (elements select: [ :each | 
		aFTFilter matches: (self toString: each) ]).
	^ self class new elements: newElements
]

{ #category : #accessing }
FTSimpleDataSource >> numberOfRows [ 
	^ self elements 
		ifNotNil: [ self elements size ]
		ifNil: [ 0 ]
]

{ #category : #accessing }
FTSimpleDataSource >> searchText: aString [
	| result |
	aString isEmptyOrNil ifTrue: [ ^ #() ].
	result := OrderedCollection new.
	self elements withIndexDo: [ :each :index |
		((self toString: each) beginsWith: aString)
			ifTrue: [ result add: index ] ].
	^ result asArray
]

{ #category : #operations }
FTSimpleDataSource >> sortElements: aBlock [
	self elements:  (self elements asSortedCollection: aBlock).
	self table refresh.
]
