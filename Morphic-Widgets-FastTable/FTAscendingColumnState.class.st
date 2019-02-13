Class {
	#name : #FTAscendingColumnState,
	#superclass : #FTAbstractColumnState,
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #sorting }
FTAscendingColumnState >> executeSortingOn: aDataSource [
	aDataSource sortWith: [ :entity | self context property value: entity ] ascending
]

{ #category : #accessing }
FTAscendingColumnState >> nextState [
	^ FTDescendingColumnState context: self context
]

{ #category : #accessing }
FTAscendingColumnState >> sortingIcon [
	^ self context morphicIconNamed: #arrowUp
]
