"
Description
--------------------

I am a sorting state for descending sorted table.
"
Class {
	#name : #FTDescendingSortingState,
	#superclass : #FTAbstractSortingState,
	#category : #'Morphic-Widgets-FastTable-Sorting'
}

{ #category : #sorting }
FTDescendingSortingState >> executeSortingOn: aDataSource [
	aDataSource sortWith: [ :entity | self context property value: entity ] descending
]

{ #category : #accessing }
FTDescendingSortingState >> nextState [
	^ FTUnsortedSortingState context: self context
]

{ #category : #accessing }
FTDescendingSortingState >> sortingIcon [
	^ self context morphicIconNamed: #arrowDown
]
