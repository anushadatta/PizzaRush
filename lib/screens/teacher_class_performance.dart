import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ClassPerformance extends StatefulWidget {
  @override
  _ClassPerformanceState createState() => _ClassPerformanceState();
}

class _ClassPerformanceState extends State<ClassPerformance> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            leading: new Container(),
            title: Text('Performance Summary'),
            centerTitle: true,
            backgroundColor: Colors.green[800],
            bottom: TabBar(
              indicatorColor: Colors.green[800],
              tabs: [
                Tab(text: 'Algebra',),
                Tab(text: 'Trigonometry',),
                Tab(text: 'Geometry',),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 98.0, vertical: 20.0),
                    child: Text(
                      'PERFORMANCE',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(35.0, 0.0, 50.0, 0.0),
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                          title: AxisTitle(
                              text: 'DATE'
                          )
                      ),
                      primaryYAxis: NumericAxis(
                          title: AxisTitle(
                              text: 'AVERAGE CLASS POINTS'
                          )
                      ),
                      legend: Legend(isVisible: false),
                      tooltipBehavior: TooltipBehavior(enable: true), // Enables the tooltip.
                      series: <LineSeries<PointsData, String>>[
                        LineSeries<PointsData, String>(
                            dataSource: [
                              PointsData('03-02', 35),
                              PointsData('10-02', 28),
                              PointsData('17-02', 34),
                              PointsData('24-02', 32),
                              PointsData('02-03', 40)
                            ],
                            xValueMapper: (PointsData history, _) => history.date,
                            yValueMapper: (PointsData history, _) => history.points,
                            dataLabelSettings: DataLabelSettings(isVisible: true) // Enables the data label.
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(180.0, 10.0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'MEAN',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '2570',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(39.5, 0, 0, 0),
                                child: Text(
                                  '03-02-2020',
                                  style: TextStyle(fontSize: 20.0),),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(39.5, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'MEDIAN',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '2000',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(180.0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'S.D.',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '30',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(180.0, 10.0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'MEAN',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '2540',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(39.5, 0, 0, 0),
                                child: Text(
                                  '10-02-2020',
                                  style: TextStyle(fontSize: 20.0),),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(39.5, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'MEDIAN',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '1830',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(180.0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'S.D.',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '50',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 98.0, vertical: 20.0),
                    child: Text(
                      'PERFORMANCE',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(35.0, 0.0, 50.0, 0.0),
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                          title: AxisTitle(
                              text: 'DATE'
                          )
                      ),
                      primaryYAxis: NumericAxis(
                          title: AxisTitle(
                              text: 'AVERAGE CLASS POINTS'
                          )
                      ),
                      legend: Legend(isVisible: false),
                      tooltipBehavior: TooltipBehavior(enable: true), // Enables the tooltip.
                      series: <LineSeries<PointsData, String>>[
                        LineSeries<PointsData, String>(
                            dataSource: [
                              PointsData('03-02', 35),
                              PointsData('10-02', 28),
                              PointsData('17-02', 34),
                              PointsData('24-02', 32),
                              PointsData('02-03', 40)
                            ],
                            xValueMapper: (PointsData history, _) => history.date,
                            yValueMapper: (PointsData history, _) => history.points,
                            dataLabelSettings: DataLabelSettings(isVisible: true) // Enables the data label.
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(180.0, 10.0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'MEAN',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '2570',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(39.5, 0, 0, 0),
                                child: Text(
                                  '03-02-2020',
                                  style: TextStyle(fontSize: 20.0),),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(39.5, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'MEDIAN',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '2000',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(180.0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'S.D.',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '30',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(180.0, 10.0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'MEAN',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '2540',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(39.5, 0, 0, 0),
                                child: Text(
                                  '10-02-2020',
                                  style: TextStyle(fontSize: 20.0),),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(39.5, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'MEDIAN',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '1830',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(180.0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'S.D.',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '50',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 98.0, vertical: 20.0),
                    child: Text(
                      'PERFORMANCE',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(35.0, 0.0, 50.0, 0.0),
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                          title: AxisTitle(
                              text: 'DATE'
                          )
                      ),
                      primaryYAxis: NumericAxis(
                          title: AxisTitle(
                              text: 'AVERAGE CLASS POINTS'
                          )
                      ),
                      legend: Legend(isVisible: false),
                      tooltipBehavior: TooltipBehavior(enable: true), // Enables the tooltip.
                      series: <LineSeries<PointsData, String>>[
                        LineSeries<PointsData, String>(
                            dataSource: [
                              PointsData('03-02', 35),
                              PointsData('10-02', 28),
                              PointsData('17-02', 34),
                              PointsData('24-02', 32),
                              PointsData('02-03', 40)
                            ],
                            xValueMapper: (PointsData history, _) => history.date,
                            yValueMapper: (PointsData history, _) => history.points,
                            dataLabelSettings: DataLabelSettings(isVisible: true) // Enables the data label.
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(180.0, 10.0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'MEAN',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '2570',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(39.5, 0, 0, 0),
                                child: Text(
                                  '03-02-2020',
                                  style: TextStyle(fontSize: 20.0),),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(39.5, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'MEDIAN',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '2000',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(180.0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'S.D.',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '30',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(180.0, 10.0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'MEAN',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '2540',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(39.5, 0, 0, 0),
                                child: Text(
                                  '10-02-2020',
                                  style: TextStyle(fontSize: 20.0),),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(39.5, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'MEDIAN',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '1830',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(180.0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  'S.D.',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                                decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                                child: Text(
                                  '50',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
      ),

    );
  }
}

class PointsData {
  PointsData(this.date, this.points);
  final String date;
  final int points;
}
