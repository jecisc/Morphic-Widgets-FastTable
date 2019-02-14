"
I am TextEdit Cell Morph, i uses the RubTextFieldArea morph to view my content.
"
Class {
	#name : #FTTextEditCellMorph,
	#superclass : #FTTemplateCellMoprh,
	#instVars : [
		'content',
		'rubTextField'
	],
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #'instance creation' }
FTTextEditCellMorph class >> new [
	self error: 'use #table: content: allowEdit:position:'
]

{ #category : #'instance creation' }
FTTextEditCellMorph class >> table: aTable content: aString allowEdit: aBoolean [
	^self basicNew 
	initialize:aTable content: aString allowEdit: aBoolean
	yourself 
]

{ #category : #'instance creation' }
FTTextEditCellMorph class >> table: aTable content: aString allowEdit: aBoolean  position: aPosition [ 
	^self basicNew 
	initialize:aTable content: aString allowEdit: aBoolean  position: aPosition 
	yourself 
]

{ #category : #accessing }
FTTextEditCellMorph >> allowEdit: aBool [
	super allowEdit: aBool.
	self rubTextField ifNotNil: [ self rubTextField lock: aBool not ]
]

{ #category : #accessing }
FTTextEditCellMorph >> content [
	^content 
]

{ #category : #accessing }
FTTextEditCellMorph >> content: aString [
|oldValue newValue|
	cellPosition ifNotNil: [oldValue :=((self table dataSource elements at: self cellPosition  second) perform:  self cellPosition first property).] ifNil: [ oldValue :=nil ].
	content := aString.
	newValue := aString.
	self rubTextField ifNotNil:[rubTextField setTextWith: content].
	self updateDataSource.
	newValue = oldValue ifFalse:  [ self table doAnnounce:((FTCellContentChanged  from: oldValue  to: newValue)
				fastTable: self table;
				yourself).].
]

{ #category : #accessing }
FTTextEditCellMorph >> hasEditingProvider [
"the textEdit cell morph  has a RubTextFieldArea which is basiclly an editing textbox"
	^true
]

{ #category : #initialization }
FTTextEditCellMorph >> initialize:aTable content: aString allowEdit: aBoolean  position: aPosition [ 

	super initialize.
	self table: aTable.
	self allowEdit: aBoolean.
	self cellPosition: aPosition.
	self setupRubTextFieldArea.
	self rubTextField announcer when: RubReturnEntered send: #value to:  [ self content: rubTextField text asString].
	self content: aString.
	self addMorphBack: self rubTextField.
]

{ #category : #accessing }
FTTextEditCellMorph >> rubTextField [
	^rubTextField
]

{ #category : #accessing }
FTTextEditCellMorph >> rubTextField: aWidget [
	rubTextField := aWidget.
]

{ #category : #'as yet unclassified' }
FTTextEditCellMorph >> setupRubTextFieldArea [
	self rubTextField: RubTextFieldArea  new yourself.
	rubTextField color: Color transparent;
	vResizing: #spaceFill;
	hResizing: #spaceFill;
	height: self bounds height;
   width: self bounds width.
]

{ #category : #operations }
FTTextEditCellMorph >> showEditor: index [
	"Nothing to do"
]

{ #category : #operations }
FTTextEditCellMorph >> updateDataSource [
	|index|
	index := self table columnIndexOf: self cellPosition first id.
	(self table dataSource elements at: self cellPosition second) instVarAt: (self table columnIndexOf:(self cellPosition first) id)  put: self content.
	self table refresh.
	
]
