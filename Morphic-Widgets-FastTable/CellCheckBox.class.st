"
I am a custom checkbox widget used inside the fast table, basiclly i don't have a label and i provide the posibility to adjast the clickable button inside.
"
Class {
	#name : #CellCheckBox,
	#superclass : #CheckboxMorph,
	#category : #'Morphic-Widgets-FastTable-Custom-Widgets'
}

{ #category : #accessing }
CellCheckBox >> allowEdit: aBoolean [
]

{ #category : #'event handling' }
CellCheckBox >> handlesKeyboard: evt [
	"Yes, we do it here."
	
	^false
]

{ #category : #'event handling' }
CellCheckBox >> handlesMouseDown: anEvent [ 
^ false

]

{ #category : #initialization }
CellCheckBox >> initialize [
	"Initialize the receiver."

	super initialize.
	
	self
		borderWidth: 0; 
		borderColor: Color transparent;
		enabled: true;
		changeTableLayout;
	
		wrapCentering: #center;
		listCentering: #center;
		cellInset: -4;			"todo: a much elegant solution"
		labelMorph: self newLabelMorph;
           buttonMorph: self newButtonMorph;
		on: #click send: #updateButton: to: self;
		on: #mouseMove send: #updateButton: to: self;
		on: #mouseUp send: #updateButton: to: self
]

{ #category : #'focus handling' }
CellCheckBox >> takesKeyboardFocus [
	^false
]

{ #category : #'focus handling' }
CellCheckBox >> wantsKeyboardFocusOnMouseDown [
	^false
]
