"
I represent a set of unit tests for the various cell widgets.
"
Class {
	#name : #FTCellWidgetsTest,
	#superclass : #TestCase,
	#instVars : [
		'table'
	],
	#category : #'Morphic-Widgets-FastTable-Tests'
}

{ #category : #initialization }
FTCellWidgetsTest >> setUp [
	table := FTTableMorph new
		extent: 500@500;
            addColumn: (FTColumn id: 'column1');
		addColumn: (FTColumn id: 'column2');
		addColumn: (FTColumn id: 'column3');			
		addColumn: (FTColumn id: 'column4');
		addColumn: (FTColumn id: 'column5');	
		addColumn: (FTColumn id: 'column6');			
		dataSource: (FTSampleDataSource new:10);
		selectRowIndex: 1;
		showFirstRowSelection;	
		yourself.
]

{ #category : #running }
FTCellWidgetsTest >> tearDown [
	table := nil
]
