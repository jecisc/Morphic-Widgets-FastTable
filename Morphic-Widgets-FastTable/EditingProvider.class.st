"
I am an class that provide an editing widget to update the value of a cell.
This editng porvider works only on text morphs 
"
Class {
	#name : #EditingProvider,
	#superclass : #Object,
	#instVars : [
		'ds'
	],
	#category : 'Morphic-Widgets-FastTable-DataSource'
}

{ #category : #'instance creation' }
EditingProvider class >> dateSource: aDataSource [
	^self basicNew 
	initialize:aDataSource 
	yourself 
]

{ #category : #'instance creation' }
EditingProvider class >> new [
	self error:'#dataSource'
]

{ #category : #adding }
EditingProvider >> addCellEditingEvents:index [
"View a floatting editor to edit the content of a cell (index)"
|textEditor cellMorph|
cellMorph := ds table visibleCellMorphAtIndex: index.	
cellMorph hasEditingProvider ifTrue: [ cellMorph showEditor:index.  ^self ].
cellMorph allowEdit ifFalse: [ ^self ].
	textEditor := RubFloatingEditorBuilder new
					customizeEditorWith: [ :editor | 
						editor scrollbarsShowNever.
						editor bounds: (cellMorph bounds insetBy: (Margin left: -2 top: 0 right: 0 bottom: 0  ))
					];
				withEditedContentsDo: [ :editedContents | 
					(self dataSource elements at: index first) instVarAt:index second put: editedContents asString.
					self dataSource table refresh].
				textEditor openEditorWithContents: ((ds elements at: index first)  instVarAt: index second).
]

{ #category : #adding }
EditingProvider >> addCellEditingEvents: aCellMorph at:index [
"View a floatting editor to edit the content of a cell"
|textEditor|

aCellMorph allowEdit ifFalse: [ ^self ].
	textEditor := RubFloatingEditorBuilder new
					customizeEditorWith: [ :editor | 
						editor scrollbarsShowNever.
						editor bounds: (aCellMorph bounds insetBy: (Margin left: -2 top: 0 right: 0 bottom: 0  ))
					];
				withEditedContentsDo: [ :editedContents | 
					(self dataSource elements at: index first) instVarAt:index second put: editedContents asString.
					self dataSource table refresh].
				textEditor openEditorWithContents: ((ds elements at: index first)  instVarAt: index second).
]

{ #category : #accessing }
EditingProvider >> dataSource [
	^ds
]

{ #category : #accessing }
EditingProvider >> dataSource: aDataSource [
	ds := aDataSource 
]

{ #category : #initialization }
EditingProvider >> initialize: aDataSource [ 
	super initialize.
	self dataSource: aDataSource 
]
