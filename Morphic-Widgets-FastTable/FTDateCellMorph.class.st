"
Date Cell Morph with a popup to choose the date from
"
Class {
	#name : #FTDateCellMorph,
	#superclass : #FTTemplateCellMoprh,
	#instVars : [
		'calendar',
		'date',
		'cellIndex'
	],
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #'instance creation' }
FTDateCellMorph class >> new [
	self error: 'use #table: date: allowEdit:'
]

{ #category : #'instance creation' }
FTDateCellMorph class >> table: aTable date: aDate allowEdit: aBoolean [
	^self basicNew 
	initialize:aTable date: aDate allowEdit: aBoolean
	yourself 
]

{ #category : #'instance creation' }
FTDateCellMorph class >> table: aTable date: aDate allowEdit: aBoolean  position: aPosition [ 
	^self basicNew 
	initialize:aTable date: aDate allowEdit: aBoolean  position: aPosition 
	yourself 
]

{ #category : #accessing }
FTDateCellMorph >> allowEdit: aBool [
	super allowEdit: aBool.
	calendar ifNotNil: [ aBool ifTrue: [ self calendar delete ] ]
]

{ #category : #accessing }
FTDateCellMorph >> calendar [
	^calendar 
]

{ #category : #accessing }
FTDateCellMorph >> calendar: aCalendarMorph [
	calendar :=  aCalendarMorph 
]

{ #category : #accessing }
FTDateCellMorph >> cellIndex [
	^cellIndex 
]

{ #category : #accessing }
FTDateCellMorph >> cellIndex: anInteger [
	cellIndex := anInteger  
]

{ #category : #accessing }
FTDateCellMorph >> date [
	^date
]

{ #category : #accessing }
FTDateCellMorph >> date: aDate [
|oldValue newValue|
	cellPosition ifNotNil: [oldValue :=((self table dataSource elements at: self cellPosition  second) perform:  self cellPosition first property).] ifNil: [ oldValue :=nil ].
	date := aDate.
	newValue := aDate.
	newValue = oldValue ifFalse:  [ self table doAnnounce:((FTCellContentChanged  from: oldValue  to: newValue)
				fastTable: self table;
				yourself).  ].

]

{ #category : #testing }
FTDateCellMorph >> hasEditingProvider [
	"the date cell morph  has its own editing provider that shows the calender morph"

	^ true
]

{ #category : #initialization }
FTDateCellMorph >> initialize: aTable date: aDate allowEdit: aBoolean [

	super initialize.
	self table: aTable.
	self allowEdit: aBoolean.
	self date: aDate.
	self addMorphBack: aDate asStringMorph.
]

{ #category : #initialization }
FTDateCellMorph >> initialize: aTable date: aDate allowEdit: aBoolean  position: aPosition [ 

	super initialize.
	self table: aTable.
      self cellPosition: aPosition.
	self allowEdit: aBoolean.
	self date: aDate.
	self addMorphBack: aDate asStringMorph.
]

{ #category : #initialization }
FTDateCellMorph >> setupCalendarMorph [
"date is a string with format mm.dd.yyyy or mm-dd-yyyy or mm/dd/yyyy"
	|cal|
	cal :=  (CellCalendarMorph on: Date today).
	cal extent: 200 @ 160.
	cal position: 20 @ 20.
	self calendar: cal
	
	
]

{ #category : #operations }
FTDateCellMorph >> showEditor: index [
	| cal |
	self allowEdit ifFalse: [ ^ self ].
	cal := CellCalendarMorph on: (self date ifNil: [ Date today ] ifNotNil: [ self date ]).
	self cellIndex: index.
	cal position: self bounds topLeft + (10 @ 10).
	self calendar: cal.
	cal takeKeyboardFocus.
	cal openInWorld.
	cal onChoiceSend: #updateDate to: self
]

{ #category : #operations }
FTDateCellMorph >> updateDate [
	self date: self calendar date.
	(self table dataSource elements at: self cellIndex first) instVarAt: self cellIndex  second put: self calendar date.
	self table refresh.
	self calendar delete .
]
