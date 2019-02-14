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
	column id = 'column1' ifTrue: [ ^ self prop1Column: column row: rowIndex ].
	column id = 'column2' ifTrue: [ ^ self prop2Column: column row: rowIndex ].
	column id = 'column3' ifTrue: [ ^ self prop3Column: column row: rowIndex ].
	column id = 'column4' ifTrue: [ ^ self prop4Column: column row: rowIndex ].
	column id = 'column5' ifTrue: [ ^ self prop5Column: column row: rowIndex ].
	column id = 'column6' ifTrue: [ ^ self prop6Column: column row: rowIndex ].

	self error: 'Invalid column'
]

{ #category : #private }
FTCellSampleDataSource >> createSampleModels: anInterger [
	| coll |
	coll := OrderedCollection new.
	1 to: anInterger do: [ :cpt | 
		coll
			add:
				(FTCellSampleClassModel
					prop1: 'property 1.' , cpt asString
					prop2: 'property 2.' , (anInterger - cpt) asString
					prop3: 'property 3.' , cpt asString
					prop4: cpt % 2 = 1
					prop5:
						(OrderedCollection
							with: 1
							with: 2
							with: 3
							with: 4
							with: 5) shuffled first
					prop6: Date today) ].
	^ coll
]

{ #category : #initialization }
FTCellSampleDataSource >> initializeDataSource: anInterger [
	self initialize.
	self elements: (self createSampleModels: anInterger)

]

{ #category : #accessing }
FTCellSampleDataSource >> prop1Column: column row: rowIndex [
	^ FTLabelCellMorph
		table: table
		content: (self elementAt: rowIndex) property1
		allowEdit: true
		position: (Array with: column with: rowIndex)
		property: #property1
]

{ #category : #accessing }
FTCellSampleDataSource >> prop2Column: column row: rowIndex [
	^ FTLabelCellMorph
		table: table
		content: (self elementAt: rowIndex) property2
		allowEdit: false
		position: (Array with: column with: rowIndex)
		property: #property2
]

{ #category : #accessing }
FTCellSampleDataSource >> prop3Column: column row: rowIndex [
	^ FTTextEditCellMorph
		table: table
		content: (self elementAt: rowIndex) property3
		allowEdit: true
		position: (Array with: column with: rowIndex)
		property: #property3
]

{ #category : #accessing }
FTCellSampleDataSource >> prop4Column: column row: rowIndex [
	^ FTCheckBoxCellMorph
		table: table
		content: (self elementAt: rowIndex) property4
		allowEdit: true
		position: (Array with: column with: rowIndex)
		property: #property4
]

{ #category : #accessing }
FTCellSampleDataSource >> prop5Column: column row: rowIndex [
	^ FTDropListCellMorph
		table: table
		datasource: #(1 2 3 4 5)
		selectedItem: (self elementAt: rowIndex) property5
		allowEdit: true
		position: (Array with: column with: rowIndex)
		property: #property5
]

{ #category : #accessing }
FTCellSampleDataSource >> prop6Column: column row: rowIndex [
	^ FTDateCellMorph
		table: table
		date: (self elementAt: rowIndex) property6
		allowEdit: true
		position: (Array with: column with: rowIndex)
		property: #property6
]
