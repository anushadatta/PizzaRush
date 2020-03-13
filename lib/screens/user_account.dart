import 'package:PizzaRush/screens/grading_rubric.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'challenge.dart';
import 'leaderboard.dart';
import 'login.dart';
import 'solvequestions.dart';


class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Player History'),
        centerTitle: true,
        backgroundColor: Colors.green[800],
        ),

      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 118.0, vertical: 10.0),
            child: Text(
              'ALGEBRA',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 40.0,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 12.5, vertical: 10.0),
                        padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
                        decoration: myBoxDecoration(),
                        child: Text(
                          '210',
                          style: TextStyle(
                            fontSize: 20.0,
                          )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                        child: Text(
                          'Current Points'
                        )
                      ),
                    ],
                  )
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
                        decoration: myBoxDecoration(),
                        child: Text(
                          '23.02.20',
                          style: TextStyle(
                            fontSize: 20.0,
                          )
                        )
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                        child: Text(
                            'Grading Deadline'
                        )
                      ),
                    ],
                  )
                ),

              ],
            ),
          ),
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
              primaryXAxis: NumericAxis(
                title: AxisTitle(
                  text: 'TIME'
                )
              ),
              primaryYAxis: NumericAxis(
                  title: AxisTitle(
                      text: 'POINTS'
                  )
              ),
              legend: Legend(isVisible: false),
              tooltipBehavior: TooltipBehavior(enable: true), // Enables the tooltip.
              series: <LineSeries<SalesData, double>>[
                LineSeries<SalesData, double>(
                  dataSource: [
                    SalesData(5.00, 35),
                    SalesData(10.00, 28),
                    SalesData(15.00, 34),
                    SalesData(20.00, 32),
                    SalesData(25.00, 40)
                  ],
                  xValueMapper: (SalesData sales, _) => sales.time,
                  yValueMapper: (SalesData sales, _) => sales.points,
                  dataLabelSettings: DataLabelSettings(isVisible: true) // Enables the data label.
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 53.0, vertical: 10.0),
            child: Text(
              'TRIGONOMETRY',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 40.0,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 12.5, vertical: 10.0),
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
                          decoration: myBoxDecoration(),
                          child: Text(
                              '560',
                              style: TextStyle(
                                fontSize: 20.0,
                              )
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                            child: Text(
                                'Current Points'
                            )
                        ),
                      ],
                    )
                ),
                Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
                            decoration: myBoxDecoration(),
                            child: Text(
                                '17.02.20',
                                style: TextStyle(
                                  fontSize: 20.0,
                                )
                            )
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                            child: Text(
                                'Grading Deadline'
                            )
                        ),
                      ],
                    )
                ),

              ],
            ),
          ),
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
              primaryXAxis: NumericAxis(
                  title: AxisTitle(
                      text: 'TIME'
                  )
              ),
              primaryYAxis: NumericAxis(
                  title: AxisTitle(
                      text: 'POINTS'
                  )
              ),
              legend: Legend(isVisible: false),
              tooltipBehavior: TooltipBehavior(enable: true), // Enables the tooltip.
              series: <LineSeries<SalesData, double>>[
                LineSeries<SalesData, double>(
                    dataSource: [
                      SalesData(5.00, 35),
                      SalesData(10.00, 28),
                      SalesData(15.00, 34),
                      SalesData(20.00, 32),
                      SalesData(25.00, 40)
                    ],
                    xValueMapper: (SalesData sales, _) => sales.time,
                    yValueMapper: (SalesData sales, _) => sales.points,
                    dataLabelSettings: DataLabelSettings(isVisible: true) // Enables the data label.
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 101.0, vertical: 10.0),
            child: Text(
              'GEOMETRY',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 40.0,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 12.5, vertical: 10.0),
                          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
                          decoration: myBoxDecoration(),
                          child: Text(
                              '560',
                              style: TextStyle(
                                fontSize: 20.0,
                              )
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                            child: Text(
                                'Current Points'
                            )
                        ),
                      ],
                    )
                ),
                Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
                            decoration: myBoxDecoration(),
                            child: Text(
                                '17.02.20',
                                style: TextStyle(
                                  fontSize: 20.0,
                                )
                            )
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                            child: Text(
                                'Grading Deadline'
                            )
                        ),
                      ],
                    )
                ),

              ],
            ),
          ),
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
              primaryXAxis: NumericAxis(
                  title: AxisTitle(
                      text: 'TIME'
                  )
              ),
              primaryYAxis: NumericAxis(
                  title: AxisTitle(
                      text: 'POINTS'
                  )
              ),
              legend: Legend(isVisible: false),
              tooltipBehavior: TooltipBehavior(enable: true), // Enables the tooltip.
              series: <LineSeries<SalesData, double>>[
                LineSeries<SalesData, double>(
                    dataSource: [
                      SalesData(5.00, 35),
                      SalesData(10.00, 28),
                      SalesData(15.00, 34),
                      SalesData(20.00, 32),
                      SalesData(25.00, 40)
                    ],
                    xValueMapper: (SalesData sales, _) => sales.time,
                    yValueMapper: (SalesData sales, _) => sales.points,
                    dataLabelSettings: DataLabelSettings(isVisible: true) // Enables the data label.
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 120.0, vertical: 0.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GradingRubric()));
              },
              child: Text('GRADING RUBRIC')
            )
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 70.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(170.0, 10.0, 30.0, 10.0),
                        child: Text(
                          'DATE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                          )
                        )
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                        child: Text(
                          'GRADE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                          )
                        )
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(30.0, 10.0, 5.0, 10.0),
                          child: Text(
                              'Algebra',
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          )
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(40.0, 10.0, 30.0, 10.0),
                          child: Text(
                              '03.02.2020',
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          )
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                          child: Text(
                              'A',
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(144.0, 10.0, 30.0, 10.0),
                          child: Text(
                              '20.01.2020',
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          )
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                          child: Text(
                              'B+',
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 10.0),
                          child: Text(
                              'Trigonometry',
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          )
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(19.0, 10.0, 30.0, 10.0),
                          child: Text(
                              '10.02.2020',
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          )
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                          child: Text(
                              'A-',
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(144.0, 10.0, 30.0, 10.0),
                          child: Text(
                              '07.02.2020',
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          )
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                          child: Text(
                              'C+',
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                          child: Text(
                              'Geometry',
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          )
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(37.0, 10.0, 30.0, 10.0),
                          child: Text(
                              '09.02.2020',
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          )
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                          child: Text(
                              'A+',
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(144.0, 10.0, 30.0, 10.0),
                          child: Text(
                              '31.01.2020',
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          )
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                          child: Text(
                              'A',
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          )
                      )
                    ],
                  ),
                ),
              ]
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        // Sign out, to LoginScreen()
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        label: Text('SIGN OUT'),
        icon: Icon(Icons.exit_to_app),
        backgroundColor: Colors.grey,

      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(),
    );
  }

}

class SalesData {
  SalesData(this.time, this.points);
  final double time;
  final int points;
}
