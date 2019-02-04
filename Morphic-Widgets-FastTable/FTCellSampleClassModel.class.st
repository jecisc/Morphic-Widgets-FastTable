"
I am a model class to be used in the FTSampleDataSource.
"
Class {
	#name : #FTCellSampleClassModel,
	#superclass : #Object,
	#instVars : [
		'property1',
		'property2',
		'property3',
		'property4',
		'property5',
		'property6'
	],
	#category : #'Morphic-Widgets-FastTable-Examples'
}

{ #category : #'instance creation' }
FTCellSampleClassModel class >> new [
	self error: 'use #prop1: prop2: porp3: prop4: instead'
]

{ #category : #'instance creation' }
FTCellSampleClassModel class >> prop1:aString1 prop2:aString2 prop3:aString3 prop4:aBoolean prop5:anObject [
	^self basicNew 
	initialize:aString1 prop2:aString2 prop3:aString3 prop4:aBoolean prop5:anObject;
	yourself 
]

{ #category : #'instance creation' }
FTCellSampleClassModel class >> prop1:aString1 prop2:aString2 prop3:aString3 prop4:aBoolean prop5:anObject prop6: aDate [
	^self basicNew 
	initialize:aString1 prop2:aString2 prop3:aString3 prop4:aBoolean prop5:anObject prop6:aDate; 
	yourself 
]

{ #category : #initialization }
FTCellSampleClassModel >> initialize:aString1 prop2:aString2 prop3:aString3 prop4:aBoolean prop5:anObject [
	self initialize.
	property1 := aString1.
	property2 := aString2.
	property3 := aString3.
	property4 := aBoolean.
	property5 := anObject.
]

{ #category : #initialization }
FTCellSampleClassModel >> initialize:aString1 prop2:aString2 prop3:aString3 prop4:aBoolean prop5:anObject prop6:aDate [
	self initialize.
	property1 := aString1.
	property2 := aString2.
	property3 := aString3.
	property4 := aBoolean.
	property5 := anObject.
	property6 := aDate.
]

{ #category : #accessing }
FTCellSampleClassModel >> property1 [
	^property1
]

{ #category : #accessing }
FTCellSampleClassModel >> property1:aString [
	property1 := aString
]

{ #category : #accessing }
FTCellSampleClassModel >> property2 [
	^property2
]

{ #category : #accessing }
FTCellSampleClassModel >> property2:aString [
	property2 := aString
]

{ #category : #accessing }
FTCellSampleClassModel >> property3 [
	^property3
]

{ #category : #accessing }
FTCellSampleClassModel >> property3:aString [
	property3 := aString
]

{ #category : #accessing }
FTCellSampleClassModel >> property4 [
	^property4
]

{ #category : #accessing }
FTCellSampleClassModel >> property4: aBoolean [
	property4 := aBoolean
]

{ #category : #accessing }
FTCellSampleClassModel >> property5 [
	^property5
]

{ #category : #accessing }
FTCellSampleClassModel >> property5: anObject [
	property5 := anObject
]

{ #category : #accessing }
FTCellSampleClassModel >> property6 [
	^property6
]

{ #category : #accessing }
FTCellSampleClassModel >> property6: aDate [
	property6 := aDate
]
