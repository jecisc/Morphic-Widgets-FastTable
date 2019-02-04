"
A row resizer morph for a fast table.
I am added to the exposed rows, if the resize option is set to true.
"
Class {
	#name : #FTRowResizerMorph,
	#superclass : #AbstractResizerMorph,
	#instVars : [
		'container',
		'topRow',
		'bottomRow',
		'oldColor',
		'traceMorph'
	],
	#category : #'Morphic-Widgets-FastTable'
}

{ #category : #'instance creation' }
FTRowResizerMorph class >> container: aTableContainerMorph top: aColumn bottom: otherColumn [
	^ self basicNew 
		initializeContainer: aTableContainerMorph 
			top: aColumn 
			bottom: otherColumn;
		yourself
]

{ #category : #'instance creation' }
FTRowResizerMorph class >> new [
	^ self error: 'Use #container:top:bottom'
]

{ #category : #accesing }
FTRowResizerMorph class >> resizerHeight [
	^ 8
]

{ #category : #testing }
FTRowResizerMorph >> canResizeRows [
	^ container owner isRowResizable 

]

{ #category : #accessing }
FTRowResizerMorph >> container [ 
	^container 
]

{ #category : #drawing }
FTRowResizerMorph >> drawOn: aCanvas [
	(owner notNil and: [owner containsPoint: self position])
		ifTrue: [super drawOn: aCanvas]

]

{ #category : #initialization }
FTRowResizerMorph >> initializeContainer: aTableContainerMorph top: aTopRow bottom: aBottomRow [
	self initialize.
	self height:  self class resizerHeight.
	container := aTableContainerMorph.
	topRow  := aTopRow.
	bottomRow  := aBottomRow
	
]

{ #category : #'event handling' }
FTRowResizerMorph >> mouseDown: anEvent [ 
	"A mouse button has been pressed.
	Update the color for feedback and store the mouse
	position and relative offset to the receiver."
	| cp |
	self canResizeRows  ifFalse: [^ self].
	(self bounds containsPoint: anEvent cursorPoint)
		ifTrue: [oldColor := self color.
			self setGrabbedColor].
	cp := anEvent cursorPoint.
	lastMouse := {cp. cp - self position}.
]

{ #category : #'event handling' }
FTRowResizerMorph >> mouseEnter: anEvent [
	self canResizeRows  ifFalse: [^ self].
	(owner notNil and: [owner bounds containsPoint: anEvent position]) 
		ifTrue: [super mouseEnter: anEvent]
]

{ #category : #'event handling' }
FTRowResizerMorph >> mouseLeave: anEvent [
	self canResizeRows ifFalse: [^ self].
	super mouseLeave: anEvent
]

{ #category : #'event handling' }
FTRowResizerMorph >> mouseMove: anEvent [ 
	self canResizeRows  ifFalse: [^ self].
	anEvent hand temporaryCursor ifNil: [^ self].
	traceMorph ifNil: [
		traceMorph := Morph newBounds: (self bounds withWidth: container width ).
		traceMorph color: Smalltalk ui theme fastTableColumnResizingColor.
		"traceMorph borderWidth: 0."
		container addMorph: traceMorph].
	traceMorph position: (traceMorph position x) @ (anEvent cursorPoint y - lastMouse second y).

]

{ #category : #'event handling' }
FTRowResizerMorph >> mouseUp: anEvent [
	"Change the cursor back to normal if necessary and change the color back to normal."
	
	self canResizeRows ifFalse: [^ self].
	(self bounds containsPoint: anEvent cursorPoint)
		ifFalse: [anEvent hand showTemporaryCursor: nil].
	self container owner allowNonUniformRowsHeights
	ifFalse: [ self updateFromEventUniformly: anEvent.]
	ifTrue:[self updateFromEvent: anEvent.].
	
	traceMorph ifNotNil: [traceMorph delete. traceMorph := nil].
	self adoptPaneColor: self paneColor.
	self triggerEvent: #mouseUp
]

{ #category : #updating }
FTRowResizerMorph >> normalFillStyle [
	^ self theme morphTreeSplitterNormalFillStyleFor: self
]

{ #category : #updating }
FTRowResizerMorph >> pressedFillStyle [
	^ self theme morphTreeSplitterPressedFillStyleFor: self
]

{ #category : #initialization }
FTRowResizerMorph >> release [
	traceMorph := nil.
	oldColor := nil.
	container := nil.
	super release.
	
]

{ #category : #actions }
FTRowResizerMorph >> resizeCursor [
	^ Cursor resizeForEdge: #top
]

{ #category : #initialization }
FTRowResizerMorph >> setGrabbedColor [
	"Set the color of the receiver when it is grabbed."
	self fillStyle: Smalltalk ui theme fastTableColumnSplitterSelectedColor
]

{ #category : #updating }
FTRowResizerMorph >> shouldDraw [
	^ true
]

{ #category : #updating }
FTRowResizerMorph >> themeChanged [
	self fillStyle: self normalFillStyle.
	super themeChanged
]

{ #category : #'event handling' }
FTRowResizerMorph >> updateFromEvent: anEvent [ 
	"Update the splitter and attached morph positions from
	the mouse event.
	Take into account the mouse down offset."
	| delta |
	delta := (anEvent cursorPoint - lastMouse first) y.
	
	(delta < 0 and: [ delta negated > (topRow  height  - (self height) - 5) ])
		ifTrue: [ delta := (topRow height - (self height) - 5) negated ].

	topRow  height:  (topRow height ifNil: [ topRow height ]) + delta.
	bottomRow  height: (bottomRow  height ifNil: [ bottomRow height ]) - delta.	
	container changed.
]

{ #category : #'event handling' }
FTRowResizerMorph >> updateFromEventUniformly: anEvent [ 

	| delta |
	delta := (anEvent cursorPoint - lastMouse first) y.
	"when the delta is nagative we need to make sure to not collaps rows"
	(delta < 0 and: [ delta negated > (container owner rowHeight  - (self height) - 5) ])
		ifTrue: [ delta := (container owner rowHeight - (self height) - 5) negated ].

	container owner rowHeight:  (container owner rowHeight ifNil: [ container owner rowHeight ]) + delta.
	container changed.
]
