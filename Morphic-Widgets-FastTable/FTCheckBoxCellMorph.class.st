"
CheckBox Cell Morph
"
Class {
	#name : #FTCheckBoxCellMorph,
	#superclass : #FTTemplateCellMoprh,
	#instVars : [
		'checkbox',
		'content'
	],
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #'instance creation' }
FTCheckBoxCellMorph class >> table: aTable content: aBooleanContent allowEdit: aBoolean position: aPosition property: aSymbol [
	^ self new
		initialize: aTable
			content: aBooleanContent
			allowEdit: aBoolean
			position: aPosition
			property: aSymbol;
		yourself
]

{ #category : #accesing }
FTCheckBoxCellMorph >> allowEdit: aBool [
	super allowEdit: aBool.
	checkbox ifNotNil: [ self checkbox lock: aBool not ]
]

{ #category : #accesing }
FTCheckBoxCellMorph >> checkbox [
	^ checkbox
]

{ #category : #accesing }
FTCheckBoxCellMorph >> checkbox: aMorph [
	checkbox := aMorph
]

{ #category : #accesing }
FTCheckBoxCellMorph >> content [
	^ content
]

{ #category : #accesing }
FTCheckBoxCellMorph >> content: aBool [
	| oldValue newValue |
	cellPosition ifNotNil: [ oldValue := (self table dataSource elementAt: self cellPosition second) perform: self property ] ifNil: [ oldValue := nil ].
	content := aBool.
	newValue := aBool.
	newValue = oldValue
		ifFalse: [ self table
				doAnnounce:
					((FTCellContentChanged from: oldValue to: newValue)
						fastTable: self table;
						yourself) ].
	self updateDataSource
]

{ #category : #testing }
FTCheckBoxCellMorph >> hasEditingProvider [
	"the date cell morph  has its own editing provider that shows the calender morph"

	^ true
]

{ #category : #initialization }
FTCheckBoxCellMorph >> initialize: aTable content: aBooleanContent allowEdit: aBoolean position: aPosition property: aSymbol [
	self
		table: aTable;
		property: aSymbol;
		cellPosition: aPosition;
		content: aBooleanContent;
		setupCheckBox;
		allowEdit: aBoolean;
		addMorphBack: checkbox
]

{ #category : #initialization }
FTCheckBoxCellMorph >> setupCheckBox [
	self checkbox:(CellCheckBox  on:self selected: #content
   changeSelected: #content:).
	checkbox 	beCheckbox;
	color: Color transparent;
	vResizing: #shrinkWrap;
	hResizing: #shrinkWrap;
	height: self bounds height;
   width: self bounds width.

]

{ #category : #operations }
FTCheckBoxCellMorph >> showEditor: index [
	"Nothing to do"

	
]

{ #category : #operations }
FTCheckBoxCellMorph >> updateDataSource [
	|index|
	index := self table columnIndexOf: self cellPosition first id.
	(self table dataSource elements at: self cellPosition second) instVarAt: (self table columnIndexOf:(self cellPosition first) id)  put: self content.
	self table refresh.
	
]
