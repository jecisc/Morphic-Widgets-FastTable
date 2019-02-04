"
This is a SimpleDataSource that populate a fastTable with FTSampleClassModel objects. This datasource populate itself with sample data as well.
"
Class {
	#name : #FTSampleDataSource,
	#superclass : #FTSimpleDataSource,
	#category : #'Morphic-Widgets-FastTable-Tests'
}

{ #category : #'instance creation' }
FTSampleDataSource class >> new: anInteger [
	^self basicNew 
	initializeDataSource: anInteger;
	yourself 
]

{ #category : #accessing }
FTSampleDataSource >> cellColumn: column row: rowIndex [ 
	column id = '#' ifTrue: [ ^ FTCellMorph new addMorph: rowIndex asMorph ].
	column id = 'column1' ifTrue: [ column property: #property1. ^ self prop1Column: column row: rowIndex ].
	column id = 'column2' ifTrue: [ column property: #property2. ^ self prop2Column: column row: rowIndex ].
	column id = 'column3' ifTrue: [ column property: #property3. ^ self prop3Column: column row: rowIndex ].
	column id = 'column4' ifTrue: [ column property: #property4. ^ self prop4Column: column row: rowIndex ].
	
self error: 'Invalid column'
]

{ #category : #private }
FTSampleDataSource >> createSampleModels:anInterger [
	|coll|
	coll := OrderedCollection new.
	1 to: anInterger do: [:cpt | coll add: (FTSampleClassModel prop1:'property 1.',cpt asString  prop2: 'property 2.',cpt asString prop3: 'property 3.',cpt asString prop4: (cpt % 2)=1)]. 
	^ coll.
]

{ #category : #initialization }
FTSampleDataSource >> initializeDataSource: anInterger [
	self initialize.
	self elements: (self createSampleModels: anInterger)

]

{ #category : #accessing }
FTSampleDataSource >> prop1Column: column row: rowIndex [
	^ FTLabelCellMorph table: table content: ((self elementAt: rowIndex) property1 ) allowEdit: true position: (Array with:column with: rowIndex)
]

{ #category : #accessing }
FTSampleDataSource >> prop2Column: column row: rowIndex [
	^ FTLabelCellMorph table: table content: ((self elementAt: rowIndex) property2 ) allowEdit: false position: (Array with:column with: rowIndex)

]

{ #category : #accessing }
FTSampleDataSource >> prop3Column: column row: rowIndex [
		^ FTTextEditCellMorph table: table content: ((self elementAt: rowIndex) property3 ) allowEdit: true position: (Array with:column with: rowIndex)
	
]

{ #category : #accessing }
FTSampleDataSource >> prop4Column: column row: rowIndex [
	^ FTCheckBoxCellMorph table: table content: ((self elementAt: rowIndex) property4 ) allowEdit: true position: (Array with:column with: rowIndex)
	
]
