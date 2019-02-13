Class {
	#name : #FTOldColumnSortingStrategy,
	#superclass : #FTAbstractColumnSortingStrategy,
	#instVars : [
		'isColumnOrderedFromLeast',
		'isColumnOrderedFromGreatest'
	],
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #initialization }
FTOldColumnSortingStrategy >> initialize [
	super initialize.
	self reset
]

{ #category : #accessing }
FTOldColumnSortingStrategy >> isColumnOrderedFromGreatest [
	^isColumnOrderedFromGreatest
]

{ #category : #accessing }
FTOldColumnSortingStrategy >> isColumnOrderedFromGreatest: aBool [
	isColumnOrderedFromGreatest := aBool.
   isColumnOrderedFromLeast:= aBool not.
]

{ #category : #accessing }
FTOldColumnSortingStrategy >> isColumnOrderedFromLeast [
	^isColumnOrderedFromLeast

]

{ #category : #accessing }
FTOldColumnSortingStrategy >> isColumnOrderedFromLeast: aBool [
	isColumnOrderedFromLeast := aBool.
   isColumnOrderedFromGreatest := aBool not.

]

{ #category : #testing }
FTOldColumnSortingStrategy >> isSortingEnabled [
	^ true
]

{ #category : #initialization }
FTOldColumnSortingStrategy >> reset [
	isColumnOrderedFromGreatest := false.
	isColumnOrderedFromLeast := false
]

{ #category : #sorting }
FTOldColumnSortingStrategy >> sortDataSource: aDataSource [
	(self isColumnOrderedFromLeast not and: [ self isColumnOrderedFromGreatest not ])
		ifTrue: [ aDataSource sortElements: [ :a :c | (a perform: self column property) asString > (c perform: self column property) asString ].
			self isColumnOrderedFromLeast: false.
			self isColumnOrderedFromGreatest: true.
			^ self ].
	self isColumnOrderedFromLeast
		ifTrue: [ aDataSource sortElements: [ :a :c | (a perform: self column property) asString > (c perform: self column property) asString ].
			self isColumnOrderedFromLeast: false.
			self isColumnOrderedFromGreatest: true.
			^ self ]
		ifFalse: [ aDataSource sortElements: [ :a :c | (a perform: self column property) asString < (c perform: self column property) asString ].
			self isColumnOrderedFromLeast: true.
			self isColumnOrderedFromGreatest: false.
			^ self ].
	^ self
]

{ #category : #accessing }
FTOldColumnSortingStrategy >> sortingIcon [
	self isColumnOrderedFromGreatest ifTrue: [ ^ self morphicIconNamed: #arrowDown ].
	self isColumnOrderedFromLeast ifTrue: [ ^ self morphicIconNamed: #arrowUp ].
	^ self morphicIconNamed: #arrowUpAndDown
]
