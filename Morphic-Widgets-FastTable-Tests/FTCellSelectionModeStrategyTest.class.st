"
A FTCellSelectionModeStrategyTest is a test class for testing the behavior of FTCellSelectionModeStrategy
"
Class {
	#name : #FTCellSelectionModeStrategyTest,
	#superclass : #FTSelectionModeStrategyTest,
	#category : #'Morphic-Widgets-FastTable-Tests-Selection'
}

{ #category : #running }
FTCellSelectionModeStrategyTest >> setStrategy [
	table beCellSelection
]

{ #category : #test }
FTCellSelectionModeStrategyTest >> testIndexFromPosition [
	self assert: (strategy indexFromPosition: #(3 7)) equals: #(3 7)
]

{ #category : #test }
FTCellSelectionModeStrategyTest >> testIndexesToSelectInMultipleSelectionFromTo [
	self
		assert: (strategy indexesToSelectInMultipleSelectionFrom: #(8 1) to: #(21 3)) asArray
		equals:
			#(#(8 1) #(9 1) #(10 1) #(11 1) #(12 1) #(13 1) #(14 1) #(15 1) #(16 1) #(17 1) #(18 1) #(19 1) #(20 1) #(21 1) #(8 2) #(9 2) #(10 2) #(11 2) #(12 2) #(13 2) #(14 2) #(15 2) #(16 2) #(17 2) #(18 2) #(19 2) #(20 2) #(21 2) #(8 3) #(9 3) #(10 3) #(11 3) #(12 3) #(13 3) #(14 3) #(15 3) #(16 3) #(17 3) #(18 3) #(19 3) #(20 3) #(21 3))
]
