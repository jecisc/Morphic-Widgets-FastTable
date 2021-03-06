"
I am a sample datasource class for the architecture checkboxes fast table.
"
Class {
	#name : #FTCellSampleArchitectureDataSource,
	#superclass : #FTSimpleDataSource,
	#category : #'Morphic-Widgets-FastTable-Examples'
}

{ #category : #'instance creation' }
FTCellSampleArchitectureDataSource class >> new [
	^self basicNew 
	initializeDataSource;
	yourself 
]

{ #category : #accesing }
FTCellSampleArchitectureDataSource >> armColumn: column row: rowIndex [
	^ FTCheckBoxCellMorph
		table: table
		content: (self elementAt: rowIndex) arm
		allowEdit: false
		position: (Array with: column with: rowIndex)
		property: #arm
]

{ #category : #accesing }
FTCellSampleArchitectureDataSource >> cellColumn: column row: rowIndex [
	column id = '#' ifTrue: [ ^ FTCellMorph new addMorph: rowIndex asMorph ].
	column id = 'distribution' ifTrue: [ ^ self distributionColumn: column row: rowIndex ].
	column id = 'x86' ifTrue: [ ^ self x86Column: column row: rowIndex ].
	column id = 'x8664' ifTrue: [ ^ self x8664Column: column row: rowIndex ].
	column id = 'ia64' ifTrue: [ ^ self ia64Column: column row: rowIndex ].
	column id = 'ppc' ifTrue: [ ^ self ppcColumn: column row: rowIndex ].
	column id = 'ppc64' ifTrue: [ ^ self ppc64Column: column row: rowIndex ].
	column id = 'sparc32' ifTrue: [ ^ self sparc32Column: column row: rowIndex ].
	column id = 'sparc64' ifTrue: [ ^ self ppc64Column: column row: rowIndex ].
	column id = 'arm' ifTrue: [ ^ self armColumn: column row: rowIndex ].

	self error: 'Invalid column'
]

{ #category : #accesing }
FTCellSampleArchitectureDataSource >> distributionColumn: column row: rowIndex [
	^ FTLabelCellMorph
		table: table
		content: (self elementAt: rowIndex) distribution
		allowEdit: false
		position: (Array with: column with: rowIndex)
		property: #distribution
]

{ #category : #accesing }
FTCellSampleArchitectureDataSource >> ia64Column: column row: rowIndex [
	^ FTCheckBoxCellMorph
		table: table
		content: (self elementAt: rowIndex) ia64
		allowEdit: false
		position: (Array with: column with: rowIndex)
		property: #ia64
]

{ #category : #initialization }
FTCellSampleArchitectureDataSource >> initializeDataSource [
	self initialize.
	self elements: (self populataTheTable )
]

{ #category : #private }
FTCellSampleArchitectureDataSource >> populataTheTable [ 
	|coll|
	coll := OrderedCollection new.
	coll add: ( FTSampleArchitecture distribution:'Alpine Linux' x86:true x8664:true	ia64:false ppc:false ppc64:false sparc32:false	sparc64:false	arm:true) .
	coll add: ( FTSampleArchitecture distribution:'Arch Linux' x86:true x8664:true	ia64:false ppc:true ppc64:false sparc32:false	sparc64:false	arm:true) .
	coll add: ( FTSampleArchitecture distribution:'CRUX' x86:true x8664:true	ia64:false ppc:true ppc64:false sparc32:false	sparc64:false	arm:false).
	coll add: ( FTSampleArchitecture distribution:'Debian' x86:true x8664:true	ia64:true ppc:true ppc64:true sparc32:true	sparc64:true	arm:true) .
	coll add: ( FTSampleArchitecture distribution:'Fedora' x86:true x8664:true	ia64:true ppc:true ppc64:true sparc32:false	sparc64:true	arm:true) .
	coll add: ( FTSampleArchitecture distribution:'Gentoo' x86:true x8664:true	ia64:true ppc:true ppc64:true sparc32:true	sparc64:true	arm:true) .
	coll add: ( FTSampleArchitecture distribution:'Kali Linux' x86:true x8664:true	ia64:false ppc:false ppc64:false sparc32:false	sparc64:false	arm:true) .
	coll add: ( FTSampleArchitecture distribution:'Manjaro Linux' x86:true x8664:true	ia64:false ppc:false ppc64:false sparc32:false	sparc64:false	arm:true) .		
	coll add: ( FTSampleArchitecture distribution:'Oracle Linux' x86:true x8664:true	ia64:true ppc:false ppc64:false sparc32:false	sparc64:false	arm:false) .		
	coll add: ( FTSampleArchitecture distribution:'Ubuntu' x86:true x8664:true	ia64:false ppc:true ppc64:false sparc32:false	sparc64:false	arm:true) .	
	^coll
]

{ #category : #accesing }
FTCellSampleArchitectureDataSource >> ppc64Column: column row: rowIndex [
	^ FTCheckBoxCellMorph
		table: table
		content: (self elementAt: rowIndex) ppc64
		allowEdit: false
		position: (Array with: column with: rowIndex)
		property: #ppc64
]

{ #category : #accesing }
FTCellSampleArchitectureDataSource >> ppcColumn: column row: rowIndex [
	^ FTCheckBoxCellMorph
		table: table
		content: (self elementAt: rowIndex) ppc
		allowEdit: false
		position: (Array with: column with: rowIndex)
		property: #ppc
]

{ #category : #accesing }
FTCellSampleArchitectureDataSource >> sparc32Column: column row: rowIndex [
	^ FTCheckBoxCellMorph
		table: table
		content: (self elementAt: rowIndex) sparc32
		allowEdit: false
		position: (Array with: column with: rowIndex)
		property: #sparc32
]

{ #category : #accesing }
FTCellSampleArchitectureDataSource >> sparc64Column: column row: rowIndex [
	^ FTCheckBoxCellMorph
		table: table
		content: (self elementAt: rowIndex) sparc64
		allowEdit: false
		position: (Array with: column with: rowIndex)
		property: #sparc64
]

{ #category : #accesing }
FTCellSampleArchitectureDataSource >> x8664Column: column row: rowIndex [
	^ FTCheckBoxCellMorph
		table: table
		content: (self elementAt: rowIndex) x8664
		allowEdit: false
		position: (Array with: column with: rowIndex)
		property: #x8664
]

{ #category : #accesing }
FTCellSampleArchitectureDataSource >> x86Column: column row: rowIndex [
	^ FTCheckBoxCellMorph
		table: table
		content: (self elementAt: rowIndex) x86
		allowEdit: false
		position: (Array with: column with: rowIndex)
		property: #x86
]
