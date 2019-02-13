Class {
	#name : #FTAscendingColumnState,
	#superclass : #FTAbstractColumnState,
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #accessing }
FTAscendingColumnState >> nextState [
	^ FTDescendingColumnState context: self context
]

{ #category : #accessing }
FTAscendingColumnState >> sortingIcon [
	^ self context morphicIconNamed: #arrowUp
]
