Class {
	#name : #FTUnsortedColumnState,
	#superclass : #FTAbstractColumnState,
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #sorting }
FTUnsortedColumnState >> executeSortingOn: aDataSource [
	aDataSource unsort
]

{ #category : #accessing }
FTUnsortedColumnState >> nextState [
	^ FTAscendingColumnState context: self context
]

{ #category : #accessing }
FTUnsortedColumnState >> sortingIcon [
	^ self context morphicIconNamed: #arrowUpAndDown
]
