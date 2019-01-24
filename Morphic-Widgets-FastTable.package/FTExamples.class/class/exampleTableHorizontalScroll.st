examples
exampleTableHorizontalScroll
	"Show a table with all Object methods, with a header,
	 all fixed width columns as horizontal scroll."
	<example>
	"self exampleTableHorizontalScroll"
	| table |
	
	table := FTTableMorph newTrialHorizontalScrollBar
		extent: 650@500;
		addColumn: ((FTColumn id: '#') width: 40);
		addColumn: ((FTColumn id: 'Name') width: 350);
		addColumn: ((FTColumn id: 'Protocol') width: 200);
		addColumn: ((FTColumn id: 'Origin') width: 200);
		intercellSpacing: 1;
		dataSource: (FTExampleMethodTableDataSource for: Morph);
		selectRowIndex: 1;
		showFirstRowSelection;
		onAnnouncement: FTSelectionChanged 
			do: [ :ann | ('rows selected: ', (ann newSelectedRowIndexes asString)) crLog ];
		onAnnouncement: FTStrongSelectionChanged 
			do: [ :ann | ('double-click on row: ', (ann selectedRowIndex asString)) crLog ];
		beMultipleSelection;
		yourself.
		
	^table openInWindow.