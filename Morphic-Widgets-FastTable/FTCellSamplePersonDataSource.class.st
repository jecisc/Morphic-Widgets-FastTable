"
I am a sample datasource class for a bunch of persons basic informtion table (name, date of birth, gender).
"
Class {
	#name : #FTCellSamplePersonDataSource,
	#superclass : #FTSimpleDataSource,
	#category : #'Morphic-Widgets-FastTable-Examples'
}

{ #category : #'instance creation' }
FTCellSamplePersonDataSource class >> new: anInteger [
	^self basicNew 
	initializeDataSource: anInteger;
	yourself 
]

{ #category : #accessing }
FTCellSamplePersonDataSource >> cellColumn: column row: rowIndex [
	column id = '#' ifTrue: [ ^ FTCellMorph new addMorph: rowIndex asMorph ].
	column id = 'name' ifTrue: [ ^ self nameColumn: column row: rowIndex ].
	column id = 'dateOfBirth' ifTrue: [ ^ self dateOfBirthColumn: column row: rowIndex ].
	column id = 'gender' ifTrue: [ ^ self genderColumn: column row: rowIndex ].

	self error: 'Invalid column'
]

{ #category : #private }
FTCellSamplePersonDataSource >> createTheTable: anInteger [
	| coll |
	coll := OrderedCollection new.
	1 to: anInteger do: [ :a | coll add: (FTSamplePerson name: 'no name' date: Date today gender: 'male') ].
	^ coll
]

{ #category : #accessing }
FTCellSamplePersonDataSource >> dateOfBirthColumn: column row: rowIndex [
	^ FTDateCellMorph
		table: table
		date: (self elementAt: rowIndex) dateOfBirth
		allowEdit: true
		position: (Array with: column with: rowIndex)
		property: #dateOfBirth
]

{ #category : #accessing }
FTCellSamplePersonDataSource >> genderColumn: column row: rowIndex [
	^ FTDropListCellMorph
		table: table
		datasource: #('male' 'female')
		selectedItem: (self elementAt: rowIndex) gender
		allowEdit: true
		position: (Array with: column with: rowIndex)
		property: #gender
]

{ #category : #initialization }
FTCellSamplePersonDataSource >> initializeDataSource: anInterger [
	self initialize.
	self elements: (self createTheTable:  anInterger)

]

{ #category : #accessing }
FTCellSamplePersonDataSource >> nameColumn: column row: rowIndex [
	^ FTLabelCellMorph
		table: table
		content: (self elementAt: rowIndex) name
		allowEdit: true
		position: (Array with: column with: rowIndex)
		property: #name
]
