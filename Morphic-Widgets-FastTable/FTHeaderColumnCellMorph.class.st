"
I represent a column cell morph, i handle mouse click and double to trigger the needed functionalities.
"
Class {
	#name : #FTHeaderColumnCellMorph,
	#superclass : #FTCellMorph,
	#instVars : [
		'column',
		'allowSort',
		'isColumnOrderedFromLeast',
		'isColumnOrderedFromGreatest'
	],
	#category : 'Morphic-Widgets-FastTable'
}

{ #category : #accessing }
FTHeaderColumnCellMorph >> column [
	^column 
]

{ #category : #accessing }
FTHeaderColumnCellMorph >> column: aColumn [
	column  := aColumn 
]

{ #category : #accessing }
FTHeaderColumnCellMorph >> desableSort [
	self column ifNotNil: [ self column desableSort ]
]

{ #category : #accessing }
FTHeaderColumnCellMorph >> enableSort [
	self column ifNotNil: [ self column isColumnOrderedFromGreatest:true ]
]

{ #category : #'event handling' }
FTHeaderColumnCellMorph >> handlesMouseDown: event [
	^ true

]

{ #category : #'event handling' }
FTHeaderColumnCellMorph >> handlesMouseOver: event [
	^ false

]

{ #category : #initialization }
FTHeaderColumnCellMorph >> initialize [
	super initialize.
	self desableSort.
]

{ #category : #accessing }
FTHeaderColumnCellMorph >> isSortEnabled [
     self table selectionMode =#row ifTrue:[^false].
	^self column isSortActivated
]

{ #category : #'event handling' }
FTHeaderColumnCellMorph >> mouseDown: event [

	self isSortEnabled  ifFalse: [ ^self ].
	(self column isColumnOrderedFromLeast not and:self column isColumnOrderedFromGreatest not) ifTrue:[ self table dataSource sortElements:[:a :c | (a perform: (self column property)) asString  > (c perform:(self column property)) asString ].	
			self column isColumnOrderedFromLeast:false. 
		self column isColumnOrderedFromGreatest:true. ^self ].
	(self column isColumnOrderedFromLeast) ifTrue:[ 
		self table dataSource sortElements:[:a :c | (a perform:(self column property))asString > (c perform:(self column property)) asString].
		self column isColumnOrderedFromLeast: false. 
		self column isColumnOrderedFromGreatest: true. 
		^self ]
	ifFalse:[ 
		self table dataSource sortElements:[:a :c | (a perform:(self column property))asString < (c perform:(self column property))asString ].
		self column isColumnOrderedFromLeast: true. 
		self column isColumnOrderedFromGreatest: false. 
		^self ].
	^self
				

]