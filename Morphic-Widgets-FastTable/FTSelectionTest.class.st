"
I represent a set of unit tests for the differente selections methods and stategies.
"
Class {
	#name : #FTSelectionTest,
	#superclass : #TestCase,
	#instVars : [
		'table'
	],
	#category : 'Morphic-Widgets-FastTable-Tests'
}

{ #category : #initialization }
FTSelectionTest >> setUp [
	table := FTTableMorph new
		extent: 500@500;
		addColumn: (FTColumn id: 'column1');
		addColumn: (FTColumn id: 'column2');
		addColumn: (FTColumn id: 'column3');		
		addColumn: (FTColumn id: 'column4');		
		dataSource: (FTSampleDataSource new:10);
		selectRowIndex: 1;
		showFirstRowSelection;	
		yourself.
]

{ #category : #initialization }
FTSelectionTest >> tearDown [
	table := nil
]

{ #category : #tests }
FTSelectionTest >> testMultipleCellSelection [
"Test whether selecting multiple cells really add the cells indexes to the selected cells collection in the table "
	|columnsCount rowsCount rand cellsArray|
	"enable cell's seletion mode and deselect all cells"
	table enableCellSelectionMode.
	table beMultipleSelection.
	table deselectAllCells.
	"select a single cell randomly"	
	columnsCount := table columns size.
	rowsCount := table dataSource elements size.
	rand:=Random new.
	cellsArray := Array
                 with: (Array with:(rand nextInt:rowsCount) with:(rand nextInt:columnsCount))
                 with: (Array with:(rand nextInt:rowsCount) with:(rand nextInt:columnsCount))
                 with: (Array with:(rand nextInt:rowsCount) with:(rand nextInt:columnsCount))
                 with: (Array with:(rand nextInt:rowsCount) with:(rand nextInt:columnsCount)).
	table selectCellIndexes: cellsArray.  
	"assert:true, if the cell is really selected"

	self assert: table selectedCellsIndexes size > 1.
]

{ #category : #tests }
FTSelectionTest >> testMultipleRowSelection [
"Test whether selecting multiple rows really add the rows indexes to the selected rows collection in the table "
	|rowsCount rand rows|
	table enableRowSelectionMode.
	table beMultipleSelection.
	rowsCount := table dataSource elements size.
	rand := Random new.
	rows := Array 	with:(rand nextInt: rowsCount)
	 					with:(rand nextInt: rowsCount)
	 					with:(rand nextInt: rowsCount)
	 					with:(rand nextInt: rowsCount).
	table selectRowIndexes: rows.  
	self assert: table selectedRowIndexes size > 1.
]

{ #category : #tests }
FTSelectionTest >> testSingleCellSelection [
|columnsCount rowsCount rand cell|
"Test whether selecting a single cell really add the cell index to the selected cells collection in the table "
	"enable cell's seletion mode and deselect all cells"
	table enableCellSelectionMode.
	table beSingleSelection.
	table deselectAllCells.
	"select a single cell randomly"	
	columnsCount := table columns size.
	rowsCount := table dataSource elements size.
	rand:=Random new.
	cell := Array with:(rand nextInt:rowsCount) with:(rand nextInt:columnsCount).
	table selectCellIndex: cell.  
	"assert:true, if the cell is really selected"

	self assert: table selectedCellsIndex = cell.
]

{ #category : #tests }
FTSelectionTest >> testSingleRowSelection [
"Test whether selecting a single row really add the row index to the selected rows collection in the table "
	|rowsCount rand row|
	table enableRowSelectionMode.
	table beSingleSelection.
	rowsCount := table dataSource elements size.
	rand := Random new.
	row := (rand nextInt: rowsCount).
	table selectRowIndex: row.  
	self assert: table selectedRowIndex = row.
]
