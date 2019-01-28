"
I am TextEdit Cell Morph, i view the cell's data as a simple text morphs, and when an editing event occurs i use the floating editor to create an edting cell.
"
Class {
	#name : #FTLabelCellMorph,
	#superclass : #FTIndentedCellMorph,
	#instVars : [
		'content'
	],
	#category : 'Morphic-Widgets-FastTable'
}

{ #category : #'instance creation' }
FTLabelCellMorph class >> new [
	self error: 'use #table: content: allowEdit:'
]

{ #category : #'instance creation' }
FTLabelCellMorph class >> table: aTable content: aString allowEdit: aBoolean [
	^self basicNew 
	initialize:aTable content: aString allowEdit: aBoolean
	yourself 
]

{ #category : #'instance creation' }
FTLabelCellMorph class >> table: aTable content: aString allowEdit: aBoolean  position: aPosition [ 
	^self basicNew 
	initialize:aTable content: aString allowEdit: aBoolean  position: aPosition 
	yourself 
]

{ #category : #accessing }
FTLabelCellMorph >> allowEdit [
	^allowEdit
	
]

{ #category : #accessing }
FTLabelCellMorph >> allowEdit: aBool [
	allowEdit := aBool.

	
]

{ #category : #accessing }
FTLabelCellMorph >> content [
	^content 
]

{ #category : #accessing }
FTLabelCellMorph >> content: aString [
|oldValue newValue|
"self table selectedCellsIndex asString,"
	cellPosition ifNotNil: [oldValue :=((self table dataSource elements at: self cellPosition  second) perform:  self cellPosition first property).] ifNil: [ oldValue :=nil ].
	content := aString.
	newValue := aString.
	newValue = oldValue ifFalse:  [ self table doAnnounce:((FTCellContentChanged  from: oldValue  to: newValue)
				fastTable: self table;
				yourself).  ].

]

{ #category : #initialization }
FTLabelCellMorph >> initialize:aTable content: aString allowEdit: aBoolean [

	super initialize.
	self table: aTable.
	self allowEdit: aBoolean.
	self content: aString.
	self addMorphBack: content asStringMorph.
]

{ #category : #initialization }
FTLabelCellMorph >> initialize:aTable content: aString allowEdit: aBoolean  position: aPosition [ 

	super initialize.
	self table: aTable.
	self allowEdit: aBoolean.
	self cellPosition: aPosition.
	self content: aString.
	self addMorphBack: content asStringMorph.
]