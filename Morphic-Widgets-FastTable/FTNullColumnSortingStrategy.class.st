Class {
	#name : #FTNullColumnSortingStrategy,
	#superclass : #FTAbstractColumnSortingStrategy,
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #testing }
FTNullColumnSortingStrategy >> isSortingEnabled [
	^ false
]

{ #category : #initialization }
FTNullColumnSortingStrategy >> reset [
	"Nothing for this one"
]

{ #category : #sorting }
FTNullColumnSortingStrategy >> sortDataSource: aDataSource [
	"Nothing to do here"
]

{ #category : #accessing }
FTNullColumnSortingStrategy >> sortingIcon [
	^ nil
]
