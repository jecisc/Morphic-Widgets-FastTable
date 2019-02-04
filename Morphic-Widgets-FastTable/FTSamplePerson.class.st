"
I hold the basic information of a person.
"
Class {
	#name : #FTSamplePerson,
	#superclass : #Object,
	#instVars : [
		'name',
		'dateOfBirth',
		'gender'
	],
	#category : #'Morphic-Widgets-FastTable-Examples'
}

{ #category : #'instance creation' }
FTSamplePerson class >> name:aStringName date:aDate gender:aStringGender [
	^self basicNew 
	initialize:aStringName date:aDate gender:aStringGender;
	yourself 
]

{ #category : #'instance creation' }
FTSamplePerson class >> new [
	self error: 'name: date: gender:'
]

{ #category : #accessing }
FTSamplePerson >> dateOfBirth [
	^dateOfBirth
]

{ #category : #accessing }
FTSamplePerson >> dateOfBirth: aDate [
	dateOfBirth := aDate
]

{ #category : #accessing }
FTSamplePerson >> gender [
	^gender
]

{ #category : #accessing }
FTSamplePerson >> gender: aString [
	gender := aString 
]

{ #category : #initialization }
FTSamplePerson >> initialize:aStringName date:aDate gender:aStringGender [
	self initialize.
	name := aStringName.
	dateOfBirth := aDate.
	gender := aStringGender.
]

{ #category : #accessing }
FTSamplePerson >> name [
	^name 
]

{ #category : #accessing }
FTSamplePerson >> name: aString [
	name := aString 
]
