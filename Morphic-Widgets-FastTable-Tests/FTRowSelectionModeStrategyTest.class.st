"
A FTRowSelectionModeStrategyTest is a test class for testing the behavior of FTRowSelectionModeStrategy
"
Class {
	#name : #FTRowSelectionModeStrategyTest,
	#superclass : #FTSelectionModeStrategyTest,
	#category : #'Morphic-Widgets-FastTable-Tests-Selection'
}

{ #category : #running }
FTRowSelectionModeStrategyTest >> setStrategy [
	table beRowSelection
]

{ #category : #test }
FTRowSelectionModeStrategyTest >> testIndexFromPosition [
	self assert: (strategy indexFromPosition: #(3 7)) equals: 3
]

{ #category : #test }
FTRowSelectionModeStrategyTest >> testIndexesToSelectInMultipleSelectionFromTo [
	self assert: (strategy indexesToSelectInMultipleSelectionFrom: 3 to: 11) asArray equals: #(3 4 5 6 7 8 9 10 11).
	self assert: (strategy indexesToSelectInMultipleSelectionFrom: 11 to: 3) asArray equals: #(11 10 9 8 7 6 5 4 3).
	self assert: (strategy indexesToSelectInMultipleSelectionFrom: 3 to: 3) asArray equals: #(3)
]
