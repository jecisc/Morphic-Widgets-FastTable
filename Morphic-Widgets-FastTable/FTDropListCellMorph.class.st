"
ComboBox Cell Morph
"
Class {
	#name : #FTDropListCellMorph,
	#superclass : #FTTemplateCellMoprh,
	#instVars : [
		'dropList',
		'selectedItem',
		'selectedIndex',
		'itemSource'
	],
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #'instance creation' }
FTDropListCellMorph class >> new [
	self error: 'use #table: selectedItem: allowEdit: or #table: itemSource: selectedItem: allowEdit:'
]

{ #category : #'instance creation' }
FTDropListCellMorph class >> table:aTable datasource: aList selectedItem:anObject allowEdit: aBoolean  position: aPosition [ 
	^self basicNew 
	initialize:aTable datasource: aList selectedItem:anObject allowEdit: aBoolean  position: aPosition 
	yourself 
]

{ #category : #accessing }
FTDropListCellMorph >> allowEdit: aBool [
	super allowEdit: aBool.
	self dropList ifNotNil: [ self dropList lock: aBool not ]
]

{ #category : #accessing }
FTDropListCellMorph >> dropList [
	^dropList 
]

{ #category : #accessing }
FTDropListCellMorph >> dropList: aWidget [
	dropList := aWidget
]

{ #category : #testing }
FTDropListCellMorph >> hasEditingProvider [
	"the date cell morph  has its own editing provider that shows the calender morph"

	^ true
]

{ #category : #initialization }
FTDropListCellMorph >> initialize:aTable datasource: aList selectedItem:anObject allowEdit: aBoolean [
"All editing is in reality allow change selection"

super initialize.
	self table: aTable.
	self itemSource: aList.
	self selectedItem: anObject. "We need to make sure that the object is part of the list"
	
   "self selectedIndex: 1."
	self setupDropList.
	self allowEdit: aBoolean.
	self addMorphBack:dropList.
]

{ #category : #initialization }
FTDropListCellMorph >> initialize:aTable datasource: aList selectedItem:anObject allowEdit: aBoolean  position: aPosition [ 
"All editing is in reality allow change selection"

super initialize.
	self table: aTable.
	self itemSource: aList.
	self cellPosition: aPosition.
	self selectedItem: anObject. "We need to make sure that the object is part of the list"
	self setupDropList.
	self allowEdit: aBoolean.
	self addMorphBack:dropList.
]

{ #category : #accessing }
FTDropListCellMorph >> itemSource [
	^itemSource
	
]

{ #category : #accessing }
FTDropListCellMorph >> itemSource: aCollection [
	itemSource := aCollection 
]

{ #category : #accessing }
FTDropListCellMorph >> selectedIndex [
	^selectedIndex  
]

{ #category : #accessing }
FTDropListCellMorph >> selectedIndex: anIndex [
"   allowEdit ifFalse: [^self]."
	selectedIndex := anIndex.
	self changed: #selectedIndex. 
	self selectedItem: (self itemSource at:anIndex). "more verification is required here"

]

{ #category : #accessing }
FTDropListCellMorph >> selectedItem [ 
	^selectedItem  
]

{ #category : #accessing }
FTDropListCellMorph >> selectedItem: anItem [
	| oldValue newValue index |
	"selectedItem := anItem a check whether the item is in the itemSource or not is needde"
	selectedIndex
		ifNil: [ index := itemSource indexOf: anItem ifAbsent: [ 0 ].
			index > 0 ifTrue: [ selectedIndex := index ] ifFalse: [ ^ self	"i should raise an exception here" ] ].

	cellPosition ifNotNil: [ oldValue := (self table dataSource elementAt: self cellPosition second) perform: self cellPosition first property ] ifNil: [ oldValue := nil ].
	newValue := anItem.
	selectedItem := anItem.
	newValue = oldValue
		ifFalse: [ self table
				doAnnounce:
					((FTCellContentChanged from: oldValue to: newValue)
						fastTable: self table;
						yourself) ].

	self updateDataSource
]

{ #category : #initialization }
FTDropListCellMorph >> setupDropList [
	self dropList:(DropListMorph
		on: self
		list:self itemSource
		selected: #selectedIndex  
		changeSelected: #selectedIndex: ).
	dropList color: Color transparent;
	vResizing: #spaceFill;
	hResizing: #spaceFill;
	height: self bounds height;
   width: self bounds width.
]

{ #category : #operations }
FTDropListCellMorph >> showEditor: index [
	"Nothing to do"

	
]

{ #category : #operations }
FTDropListCellMorph >> updateDataSource [
	|index|
	index := self table columnIndexOf: self cellPosition first id.
	(self table dataSource elements at: self cellPosition second) instVarAt: (self table columnIndexOf:(self cellPosition first) id)  put: self selectedItem.
	self table refresh.
	
]
