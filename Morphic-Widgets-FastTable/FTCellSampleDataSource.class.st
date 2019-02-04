"
This is a SimpleDataSource that populate a fastTable with FTCellSampleClassModel objects. This datasource populate itself with sample data as well.
"
Class {
	#name : #FTCellSampleDataSource,
	#superclass : #FTSimpleDataSource,
	#category : #'Morphic-Widgets-FastTable-Examples'
}

{ #category : #'instance creation' }
FTCellSampleDataSource class >> new: anInteger [
	^self basicNew 
	initializeDataSource: anInteger;
	yourself 
]

{ #category : #accessing }
FTCellSampleDataSource >> cellColumn: column row: rowIndex [ 
	column id = '#' ifTrue: [ ^ FTCellMorph new addMorph: rowIndex asMorph ].
	column id = 'column1' ifTrue: [ column property: #property1. ^ self prop1Column: column row: rowIndex ].
	column id = 'column2' ifTrue: [ column property: #property2. ^ self prop2Column: column row: rowIndex ].
	column id = 'column3' ifTrue: [ column property: #property3. ^ self prop3Column: column row: rowIndex ].
	column id = 'column4' ifTrue: [ column property: #property4. ^ self prop4Column: column row: rowIndex ].
	column id = 'column5' ifTrue: [ column property: #property5. ^ self prop5Column: column row: rowIndex ].
	column id = 'column6' ifTrue: [ column property: #property6. ^ self prop6Column: column row: rowIndex ].
	
self error: 'Invalid column'
]

{ #category : #private }
FTCellSampleDataSource >> createSampleModels:anInterger [
	|coll|
	coll := OrderedCollection new.
	1 to: anInterger do: [:cpt | coll add: (FTCellSampleClassModel prop1:'property 1.',cpt asString  prop2: 'property 2.',(anInterger - cpt) asString prop3: 'property 3.',cpt asString prop4: (cpt % 2)=1 prop5: ((OrderedCollection with:'one' with:'two' with:'three' with:'four' with:'five')   shuffled first ) prop6:(Date today)) ]. 
	^ coll.
]

{ #category : #initialization }
FTCellSampleDataSource >> initializeDataSource: anInterger [
	self initialize.
	self elements: (self createSampleModels: anInterger)

]

{ #category : #accessing }
FTCellSampleDataSource >> prop1Column: column row: rowIndex [
	^ FTLabelCellMorph table: table content: ((self elementAt: rowIndex) property1 ) allowEdit: true position: (Array with:column with: rowIndex)

]

{ #category : #accessing }
FTCellSampleDataSource >> prop2Column: column row: rowIndex [
	^ FTLabelCellMorph table: table content: ((self elementAt: rowIndex) property2 ) allowEdit: false position: (Array with:column with: rowIndex)

]

{ #category : #accessing }
FTCellSampleDataSource >> prop3Column: column row: rowIndex [
	^ FTTextEditCellMorph table: table content: ((self elementAt: rowIndex) property3 ) allowEdit: true position: (Array with:column with: rowIndex)
	
]

{ #category : #accessing }
FTCellSampleDataSource >> prop4Column: column row: rowIndex [
	^ FTCheckBoxCellMorph table: table content: ((self elementAt: rowIndex) property4 ) allowEdit: true position: (Array with:column with: rowIndex)
	
]

{ #category : #accessing }
FTCellSampleDataSource >> prop5Column: column row: rowIndex [
	^ FTDropListCellMorph table:table datasource: #('one' 'two' 'three' 'four' 'five') selectedItem:((self elementAt: rowIndex) property5 ) allowEdit: true position: (Array with:column with: rowIndex)
	
]

{ #category : #accessing }
FTCellSampleDataSource >> prop6Column: column row: rowIndex [
	^ FTDateCellMorph  table:table  date:((self elementAt: rowIndex) property6 ) allowEdit: true position: (Array with:column with: rowIndex)
	
	
]
