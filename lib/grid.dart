/// Package imports
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:get/get.dart';

// import controller
import 'controller/gridController.dart';

class GridView extends StatelessWidget {
  final GridController _gridController = Get.put(GridController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white
        ),
        title: Text(
          'Data Grid',
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 0, left: 5, right: 5, bottom: 5),
        child: SfDataGrid(
          source: _gridController.stockDataGridSource,
          columnWidthMode: ColumnWidthMode.fill,
          cellBuilder: (BuildContext context, GridColumn column, int rowIndex) =>
              Container(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Text((rowIndex + 1).toString()),
                    ],
                  ),
              ),
          rowHeight: 50,
          columns: <GridColumn>[
            GridWidgetColumn(mappingName: 'no')
              ..width = 51
              ..headerText = 'No'
              ..padding = const EdgeInsets.all(8.0),
            GridTextColumn(mappingName: 'stockName')
              ..columnWidthMode = ColumnWidthMode.cells
              ..headerText = 'Name'
              ..headerTextAlignment = Alignment.centerLeft,
            GridNumericColumn(mappingName: 'price')
              ..headerText = 'Price'
              ..padding = const EdgeInsets.all(8)
              ..headerTextAlignment = Alignment.center
              ..textAlignment = Alignment.center,
            GridNumericColumn(mappingName: 'different')
              ..padding = const EdgeInsets.all(8)
              ..textAlignment = Alignment.center
              ..headerTextAlignment = Alignment.center
              ..headerText = 'D',
            GridNumericColumn(mappingName: 'differentPercent')
              ..headerText = 'DP'
              ..padding = const EdgeInsets.all(8)
              ..textAlignment = Alignment.center
              ..headerTextAlignment = Alignment.center
              ..columnWidthMode = ColumnWidthMode.auto,
          ],
        ),
      ),
    );
  }
}