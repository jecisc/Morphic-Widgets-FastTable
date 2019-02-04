"
I hold a linux distribution supported cpu Architectures.
"
Class {
	#name : #FTSampleArchitecture,
	#superclass : #Object,
	#instVars : [
		'distribution',
		'x86',
		'x8664',
		'ia64',
		'ppc',
		'ppc64',
		'sparc32',
		'sparc64',
		'arm'
	],
	#category : #'Morphic-Widgets-FastTable-Examples'
}

{ #category : #'instance creation' }
FTSampleArchitecture class >> distribution:aString x86:x86Bool x8664:x8664Bool ia64:ia64Bool ppc:ppcBool ppc64:ppc64Bool sparc32:sparc32Bool sparc64:sparc64Bool arm:armBool [
	^self basicNew 
	initialize:aString x86:x86Bool x8664:x8664Bool ia64:ia64Bool ppc:ppcBool ppc64:ppc64Bool sparc32:sparc32Bool sparc64:sparc64Bool arm:armBool;
	yourself 
]

{ #category : #'instance creation' }
FTSampleArchitecture class >> new [
	self error: 'distribution:aString x86:x86Bool x8664:x8664Bool ia64:ia64Bool ppc:ppcBool ppc64:ppc64Bool sparc32:sparc32Bool sparc64:sparc64Bool arm:armBool'
]

{ #category : #accessing }
FTSampleArchitecture >> arm [ 
	^ arm 
]

{ #category : #accessing }
FTSampleArchitecture >> arm: aBool [
	arm := aBool  
]

{ #category : #accessing }
FTSampleArchitecture >> distribution [
	^distribution
]

{ #category : #accessing }
FTSampleArchitecture >> distribution: aString [
	distribution := aString
]

{ #category : #accessing }
FTSampleArchitecture >> ia64 [
	^ia64 
]

{ #category : #accessing }
FTSampleArchitecture >> ia64: aBool [
	ia64  := aBool
]

{ #category : #initialization }
FTSampleArchitecture >> initialize:aString x86:x86Bool x8664:x8664Bool ia64:ia64Bool ppc:ppcBool ppc64:ppc64Bool sparc32:sparc32Bool sparc64:sparc64Bool arm:armBool [
	self initialize.
	distribution:=aString.
	 x86:=x86Bool.
	 x8664:=x8664Bool.
	 ia64:=ia64Bool.
	 ppc:=ppcBool.
	 ppc64:=ppc64Bool.
	 sparc32:=sparc32Bool.
	 sparc64:=sparc64Bool.
	 arm:=armBool.
]

{ #category : #accessing }
FTSampleArchitecture >> ppc [
	^ppc
]

{ #category : #accessing }
FTSampleArchitecture >> ppc64 [
 	^ppc64 
]

{ #category : #accessing }
FTSampleArchitecture >> ppc64: aBool [
 	ppc64 := aBool 
]

{ #category : #accessing }
FTSampleArchitecture >> ppc: aBool [
	ppc := aBool 
]

{ #category : #accessing }
FTSampleArchitecture >> sparc32 [
 	^sparc32  
]

{ #category : #accessing }
FTSampleArchitecture >> sparc32: aBool [
 	sparc32  := aBool
	
]

{ #category : #accessing }
FTSampleArchitecture >> sparc64 [
	^sparc64
]

{ #category : #accessing }
FTSampleArchitecture >> sparc64: aBool [
	sparc64 := aBool
]

{ #category : #accessing }
FTSampleArchitecture >> x86 [
	^x86 
]

{ #category : #accessing }
FTSampleArchitecture >> x8664 [
	^x8664 
]

{ #category : #accessing }
FTSampleArchitecture >> x8664: aBool [
	x8664 := aBool
]

{ #category : #accessing }
FTSampleArchitecture >> x86: aBool [
	x86 := aBool
]
