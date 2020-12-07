import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class GridController extends GetxController {
  var stockData =  List<Stock>();
  var stockDataGridSource = StockDataGridSource(List<Stock>());

  @override
  void onInit() {
    stockData = generateStock(18);
    stockDataGridSource = StockDataGridSource(stockData);
    super.onInit();
  }

  final List<String> stockName = <String>[
    'EUR/USD',
    'Gold',
    'Brent',
    'Platinum',
    'Coffee',
    'Cotton',
    'Gas',
    'Copper',
    'AFLT.ME',
    'LKOH.ME',
    'BTC/USD',
    'LTC/USD',
    'ETH/USD',
    'DAX',
    'DOWJ',
    'FTSE 100',
    'N225',
    'SBUX',
  ];
  final List<double> price = <double>[
    93,
    82,
    76,
    77,
    52,
    84,
    82,
    81,
    70,
    65,
    97,
    77,
    72,
    68,
    66,
    93,
    82,
    76,
  ];
  final List<double> different = <double>[
    0,
    10,
    15.5,
    15.5,
    40.5,
    0,
    2,
    3,
    14.5,
    19,
    0,
    20,
    24.5,
    28.5,
    31,
    0,
    10,
    15.5,
  ];
  final List<double> differentPercent = <double>[
    .616,
    .550,
    .514,
    .513,
    .347,
    .560,
    .547,
    .540,
    .464,
    .433,
    .642,
    .510,
    .480,
    .453,
    .437,
    .616,
    .550,
    .514,
  ];
  List<Stock> generateStock(int count) {
    final List<Stock> stockData = <Stock>[];
    for (int i = 0; i < count; i++) {
      stockData.add(Stock(
        stockName[i],
        price[i],
        different[i],
        differentPercent[i],
        i
      ));
    }

    return stockData;
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class Stock {
  final String stockName;
  final double price;
  final double different;
  final double differentPercent;
  final int no;

  Stock(
      this.stockName,
      this.price,
      this.different,
      this.differentPercent,
      this.no,
      );
}

class StockDataGridSource extends DataGridSource<Stock> {
  final List<Stock> _stockData;
  StockDataGridSource(this._stockData);
  @override
  List<Stock> get dataSource => this._stockData;
  @override
  Object getValue(Stock stock, String columnName) {
    switch (columnName) {
      case 'stockName':
        return stock.stockName;
        break;
      case 'price':
        return stock.price;
        break;
      case 'different':
        return stock.different;
        break;
      case 'differentPercent':
        return stock.differentPercent;
        break;
      default:
        return 'empty';
        break;
    }
  }
}