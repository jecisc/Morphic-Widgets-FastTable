"
I am a custom calendar widget used inside the fast table, basiclly i handle some extra keyborad shortcuts.
"
Class {
	#name : #CellCalendarMorph,
	#superclass : #CalendarMorph,
	#category : #'Morphic-Widgets-FastTable-Custom-Widgets'
}

{ #category : #'event handling' }
CellCalendarMorph >> handlesKeyboard: event [
	^ true
	
]

{ #category : #'event handling' }
CellCalendarMorph >> keyStroke: event [ 
	(self navigationKey: event) ifTrue: [^self].
	event keyCharacter = Character escape 
 ifTrue: [ self delete] 
]
