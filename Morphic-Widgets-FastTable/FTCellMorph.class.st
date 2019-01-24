"
I represent a cell for the table. 

Description
------------------

I contains other Morph that need to be render. I should be answered in FTDataSource>>#cellTable:column:row:, with this method a FTTableContainer can display all the needed cells.

Technically, FTDataSource can answer  any kind of morph, but I'm better prepared  for the role so is recommendable  to  use me.

Public API and Key Messages
-------------------

- #withTopSeparator 		this is use to put a separator before the cell. (For exmple on a FTOutlineDataSource).

Example
-------------------

FTCellMorph new
		addMorphBack: 'Example' asMorph;
		withTopSeparator;
		openInWindow.
 
Internal Representation and Key Implementation Points.
-----------------

    Instance Variables
	topSeparator:		This is a boolean to know if the cell need a topSeparator.

"
Class {
	#name : #FTCellMorph,
	#superclass : #Morph,
	#instVars : [
		'topSeparator',
		'columnSelectionColor',
		'table',
		'allowEdit',
		'cellPosition'
	],
	#category : 'Morphic-Widgets-FastTable'
}

{ #category : #accessing }
FTCellMorph >> allowEdit [
	^allowEdit
]

{ #category : #accessing }
FTCellMorph >> allowEdit: aBool [
	allowEdit := aBool.

]

{ #category : #accessing }
FTCellMorph >> cellPosition [
	^cellPosition 
]

{ #category : #accessing }
FTCellMorph >> cellPosition: aPosition [
	cellPosition := aPosition
]

{ #category : #accessing }
FTCellMorph >> columnSelectionColor [
	^columnSelectionColor


]

{ #category : #accessing }
FTCellMorph >> columnSelectionColor: aColor [
	columnSelectionColor := aColor.
	self color: columnSelectionColor.


]

{ #category : #initialize }
FTCellMorph >> defaultColor [
	^ Color transparent
]

{ #category : #drawing }
FTCellMorph >> drawOn: aCanvas [
	super drawOn: aCanvas.
	topSeparator
		ifTrue: [ aCanvas line: bounds topLeft to: bounds topRight color: self seperatorColor ]
]

{ #category : #'event handling' }
FTCellMorph >> handlesMouseOver: evt [
table notNil
ifTrue: [ ^ table selectionMode == #column ].
^false

]

{ #category : #testing }
FTCellMorph >> hasEditingProvider [
"this message indicated that this cell doest has a custom editing, so it can use the editing provider implemented in the data source"
	^false
]

{ #category : #initialization }
FTCellMorph >> initialize [
	super initialize.
	topSeparator := false.
	columnSelectionColor := self defaultColor.
	self
		clipSubmorphs: true;
		layoutPolicy: TableLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		listDirection: #leftToRight;
		listCentering: #topLeft;
		wrapCentering: #center
]

{ #category : #'event handling' }
FTCellMorph >> mouseEnter: evt [
	self color: (
		columnSelectionColor isTransparent 
			ifTrue: [ self mouseOverColor ]
			ifFalse: [ self mouseOverColor mixed: 0.5 with: columnSelectionColor ]
	)
]

{ #category : #'event handling' }
FTCellMorph >> mouseLeave: evt [
	
	self color: self columnSelectionColor  
]

{ #category : #accessing }
FTCellMorph >> mouseOverColor [
	^ Smalltalk ui theme lightBackgroundColor 
]

{ #category : #drawing }
FTCellMorph >> seperatorColor [
	^ Smalltalk ui theme scrollbarColor
]

{ #category : #operations }
FTCellMorph >> showEditor:index [
"this message should be overrided by the cell that provide a custom editor or don't need the default editorProvider defined in the data source"
	self subclassResponsibility
]

{ #category : #accessing }
FTCellMorph >> table [
	^table 
]

{ #category : #accessing }
FTCellMorph >> table:aFTMorph [
	table := aFTMorph 
]

{ #category : #drawing }
FTCellMorph >> updateCellColor [
	|selectedCells|
	
]

{ #category : #accessing }
FTCellMorph >> withTopSeparator [
	topSeparator := true
]
