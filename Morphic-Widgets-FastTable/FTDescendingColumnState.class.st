Class {
	#name : #FTDescendingColumnState,
	#superclass : #FTAbstractColumnState,
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #accessing }
FTDescendingColumnState >> nextState [
	^ FTUnsortedColumnState context: self context
]

{ #category : #accessing }
FTDescendingColumnState >> sortingIcon [
	^ self context morphicIconNamed: #arrowDown
]
