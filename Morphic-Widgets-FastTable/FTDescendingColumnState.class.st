Class {
	#name : #FTDescendingColumnState,
	#superclass : #FTAbstractColumnState,
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #sorting }
FTDescendingColumnState >> executeSortingOn: aDataSource [
	aDataSource sortWith: [ :entity | self context property value: entity ] descending
]

{ #category : #accessing }
FTDescendingColumnState >> nextState [
	^ FTUnsortedColumnState context: self context
]

{ #category : #accessing }
FTDescendingColumnState >> sortingIcon [
	^ self context morphicIconNamed: #arrowDown
]
