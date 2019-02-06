"
A FTSelectionModeStrategyTest is a test class for testing the behavior of FTSelectionModeStrategy
"
Class {
	#name : #FTSelectionModeStrategyTest,
	#superclass : #TestCase,
	#instVars : [
		'table',
		'strategy'
	],
	#category : #'Morphic-Widgets-FastTable-Tests-Selection'
}

{ #category : #testing }
FTSelectionModeStrategyTest class >> isAbstract [
	^ self = FTSelectionModeStrategyTest
]

{ #category : #testing }
FTSelectionModeStrategyTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #running }
FTSelectionModeStrategyTest >> setStrategy [
	self subclassResponsibility
]

{ #category : #running }
FTSelectionModeStrategyTest >> setUp [
	super setUp.
	table := FTTableMorph new
		extent: 500 @ 500;
		addColumn: (FTColumn id: 'column1');
		addColumn: (FTColumn id: 'column2');
		addColumn: (FTColumn id: 'column3');
		addColumn: (FTColumn id: 'column4');
		dataSource: (FTSimpleDataSource elements: (1 to: 100));
		yourself.
	self setStrategy.
	strategy := table selectionModeStrategy
]

{ #category : #test }
FTSelectionModeStrategyTest >> testIndexFromPosition [
	self subclassResponsibility
]

{ #category : #test }
FTSelectionModeStrategyTest >> testIndexesToSelectInMultipleSelectionFromTo [
	self subclassResponsibility
]
