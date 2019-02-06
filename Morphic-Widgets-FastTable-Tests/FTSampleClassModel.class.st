"
I am a model class to be used in the FTSampleDataSource.
"
Class {
	#name : #FTSampleClassModel,
	#superclass : #Object,
	#instVars : [
		'property1',
		'property2',
		'property3',
		'property4'
	],
	#category : #'Morphic-Widgets-FastTable-Tests'
}

{ #category : #'instance creation' }
FTSampleClassModel class >> new [
	self error: 'use #prop1: prop2: porp3: prop4: instead'
]

{ #category : #'instance creation' }
FTSampleClassModel class >> prop1:aString1 prop2:aString2 prop3:aString3 prop4:aBoolean [
	^self basicNew 
	initialize:aString1 prop2:aString2 prop3:aString3 prop4:aBoolean;
	yourself 
]

{ #category : #initialization }
FTSampleClassModel >> initialize:aString1 prop2:aString2 prop3:aString3 prop4:aBoolean [
	self initialize.
	property1 := aString1.
	property2 := aString2.
	property3 := aString3.
	property4 := aBoolean.
]

{ #category : #accessing }
FTSampleClassModel >> property1 [
	^property1
]

{ #category : #accessing }
FTSampleClassModel >> property1:aString [
	property1 := aString
]

{ #category : #accessing }
FTSampleClassModel >> property2 [
	^property2
]

{ #category : #accessing }
FTSampleClassModel >> property2:aString [
	property2 := aString
]

{ #category : #accessing }
FTSampleClassModel >> property3 [
	^property3
]

{ #category : #accessing }
FTSampleClassModel >> property3:aString [
	property3 := aString
]

{ #category : #accessing }
FTSampleClassModel >> property4 [
	^property4
]

{ #category : #accessing }
FTSampleClassModel >> property4: aBoolean [
	property4 := aBoolean
]
