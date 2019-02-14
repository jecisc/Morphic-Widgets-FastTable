Class {
	#name : #FTTemplateCellMoprh,
	#superclass : #FTIndentedCellMorph,
	#instVars : [
		'table',
		'allowEdit',
		'cellPosition',
		'property'
	],
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #accessing }
FTTemplateCellMoprh >> allowEdit [
	^ allowEdit
]

{ #category : #accessing }
FTTemplateCellMoprh >> allowEdit: aBool [
	allowEdit := aBool.

]

{ #category : #accessing }
FTTemplateCellMoprh >> cellPosition [
	^ cellPosition
]

{ #category : #accessing }
FTTemplateCellMoprh >> cellPosition: aPosition [
	cellPosition := aPosition
]

{ #category : #accessing }
FTTemplateCellMoprh >> property [
	^ property
]

{ #category : #accessing }
FTTemplateCellMoprh >> property: anObject [
	property := anObject
]

{ #category : #operations }
FTTemplateCellMoprh >> showEditor: index [
	"this message should be overrided by the cell that provide a custom editor or don't need the default editorProvider defined in the data source"

	self subclassResponsibility
]

{ #category : #accessing }
FTTemplateCellMoprh >> table [
	^ table
]

{ #category : #accessing }
FTTemplateCellMoprh >> table: aTable [
	table := aTable
]
