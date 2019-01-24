"
I provide a specific key combination for the current platform to be used to hadle FTs based sheets

"
Class {
	#name : #PlatformSpecificKeyCombination,
	#superclass : #Object,
	#category : 'Morphic-Widgets-FastTable'
}

{ #category : #api }
PlatformSpecificKeyCombination class >> copy [
"Paste the contents of the Clipboard into the current cell/row"
	^$v meta 
]

{ #category : #api }
PlatformSpecificKeyCombination class >> cut [
"Cut the selected item and copy it to the Clipboard."
	^$x meta 
]

{ #category : #api }
PlatformSpecificKeyCombination class >> edit [
"Edit a selected cell/row."
	^$e meta 
]

{ #category : #api }
PlatformSpecificKeyCombination class >> enter [
"edit a cell/row or validate the change"
	^Character  enter 
]

{ #category : #api }
PlatformSpecificKeyCombination class >> find [
"Find item, by triggering the search function"
	^$f meta 
]

{ #category : #api }
PlatformSpecificKeyCombination class >> findAgain [
"Find the next occurrence of the item "
	^$g meta 
]

{ #category : #api }
PlatformSpecificKeyCombination class >> sellectAll [
"No need to check for Spesific platform modifier since meta will take care of it"
	^$a meta 
]
