"
I'm a column definition for a fast  table.

Description 
------------------
 
I keep an id and relevant information of my behaviour, but this behaviour is better defined in FTDataSource>>#headerTable:column:
 
Internal Representation and Key Implementation Points.
-----------------
    Instance Variables
	id:		An id for the column
	width:		An Integer that represent the width of a column.

"
Class {
	#name : #FTColumn,
	#superclass : #Object,
	#instVars : [
		'id',
		'property',
		'width',
		'isColumnOrderedFromLeast',
		'isColumnOrderedFromGreatest'
	],
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #'instance creation' }
FTColumn class >> id: anObject [
	^ self new
		id: anObject;
		isColumnOrderedFromGreatest: false;
		isColumnOrderedFromLeast: false;
		yourself
]

{ #category : #accessing }
FTColumn class >> undefinedColumnWidth [
	"This is a contant that defines a column width is undefined, then the layout will try to arrange 
	 it by itself."
	^ 0
]

{ #category : #layout }
FTColumn >> acquireWidth: anOwnerWidth [
	^ self widthOrUndefined min: anOwnerWidth
]

{ #category : #accessing }
FTColumn >> disableSort [
	isColumnOrderedFromGreatest := false.
	isColumnOrderedFromLeast := false
]

{ #category : #accessing }
FTColumn >> id [
	^ id
]

{ #category : #accessing }
FTColumn >> id: anObject [
	id := anObject
]

{ #category : #initialization }
FTColumn >> initialize [
	super initialize.
	self disableSort
]

{ #category : #accessing }
FTColumn >> isColumnOrderedFromGreatest [
	^isColumnOrderedFromGreatest
]

{ #category : #accessing }
FTColumn >> isColumnOrderedFromGreatest: aBool [
	isColumnOrderedFromGreatest := aBool.
   isColumnOrderedFromLeast:= aBool not.
]

{ #category : #accessing }
FTColumn >> isColumnOrderedFromLeast [
	^isColumnOrderedFromLeast

]

{ #category : #accessing }
FTColumn >> isColumnOrderedFromLeast: aBool [
	isColumnOrderedFromLeast := aBool.
   isColumnOrderedFromGreatest := aBool not.

]

{ #category : #testing }
FTColumn >> isSortActivated [
	^ self isColumnOrderedFromGreatest or: [ self isColumnOrderedFromLeast ]
]

{ #category : #accessing }
FTColumn >> property [
	^ property
]

{ #category : #accessing }
FTColumn >> property: aPropertyName [
"i am the name of the property linked to this column"
	property := aPropertyName
]

{ #category : #accessing }
FTColumn >> transform: anObject [
	^ anObject
]

{ #category : #accessing }
FTColumn >> width [
	^ width
]

{ #category : #accessing }
FTColumn >> width: anObject [
	width := anObject
]

{ #category : #accessing }
FTColumn >> widthOrUndefined [
	^ self width ifNil: [ self class undefinedColumnWidth ]
]
