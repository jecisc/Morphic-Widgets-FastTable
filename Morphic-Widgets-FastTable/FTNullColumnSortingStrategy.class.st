Class {
	#name : #FTNullColumnSortingStrategy,
	#superclass : #FTAbstractColumnSortingStrategy,
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #testing }
FTNullColumnSortingStrategy >> isSortingEnabled [
	^ false
]

{ #category : #sorting }
FTNullColumnSortingStrategy >> sortDataSource: aDataSource [
	"Nothing to do here"
]

{ #category : #'as yet unclassified' }
FTNullColumnSortingStrategy >> sortingIcon [
	^ nil
]
