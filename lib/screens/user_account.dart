import 'package:PizzaRush/screens/grading_rubric.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'challenge.dart';
import 'leaderboard.dart';
import 'login.dart';
import 'solvequestions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:PizzaRush/services/collections.dart';


class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {

  Future<List> scoreHistoryAlgebra, scoreHistoryTrigonometry, scoreHistoryGeometry;

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
          displayCurrentScores(scoreHistoryAlgebra),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 98.0, vertical: 20.0),
            child: Text(
              'PERFORMANCE',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          displayScoreHistory(scoreHistoryAlgebra),
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
          displayCurrentScores(scoreHistoryTrigonometry),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 98.0, vertical: 20.0),
            child: Text(
              'PERFORMANCE',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          displayScoreHistory(scoreHistoryTrigonometry),
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
          displayCurrentScores(scoreHistoryGeometry),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 98.0, vertical: 20.0),
            child: Text(
              'PERFORMANCE',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          displayScoreHistory(scoreHistoryGeometry),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 120.0, vertical: 0.0),
            child: OutlineButton(
              borderSide: BorderSide(color: Colors.green[800]),
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
                Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(190.0, 10.0, 30.0, 10.0),
                        child: Text(
                            'DATE',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0
                            )
                        )
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(30.0, 10.0, 26.0, 10.0),
                        child: Text(
                            'Algebra',
                            style: TextStyle(
                                fontSize: 20.0
                            )
                        )
                    ),
                    displayDates(scoreHistoryAlgebra),
                    displayGrades(scoreHistoryAlgebra)
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    displayDates(scoreHistoryTrigonometry),
                    displayGrades(scoreHistoryTrigonometry)
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(20.0, 10.0, 18.0, 10.0),
                        child: Text(
                            'Geometry',
                            style: TextStyle(
                                fontSize: 20.0
                            )
                        )
                    ),
                    displayDates(scoreHistoryGeometry),
                    displayGrades(scoreHistoryGeometry)
                  ],
                ),
              ],
            )
          )
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        // Sign out, to LoginScreen()
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        label: Text('SIGN OUT'),
        icon: Icon(Icons.exit_to_app),
        backgroundColor: Colors.grey,

      ),
    );
  }

  Widget displayCurrentScores(apiData) => FutureBuilder<dynamic> (
    future: apiData,
    builder: (context, snapshot) {
      if (!snapshot.hasData) return Container(
          height: 300,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.all(5),
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.green)),
                ),
              ),
            ],
          )
      );

      return Container(
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
                          '${snapshot.data[0][snapshot.data[0].length - 1]}',
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
                            '${snapshot.data[1][snapshot.data[1].length - 1]}-20',
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
      );
    }
  );

  Widget displayScoreHistory(apiData) => FutureBuilder<dynamic> (
      future: apiData,
      builder: (context, snapshot) {

        if (!snapshot.hasData) return Container(
            height: 300,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(5),
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.green)),
                  ),
                ),
              ],
            )
        );

        var pointsData = new List<PointsData>(snapshot.data[0].length);
        for(var i = 0; i < snapshot.data[0].length; i++) {
          pointsData[i] = PointsData(snapshot.data[1][i], snapshot.data[0][i]);
        }

        return Container(
          padding: EdgeInsets.fromLTRB(35.0, 0.0, 50.0, 0.0),
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(
                title: AxisTitle(
                    text: 'DATE'
                )
            ),
            primaryYAxis: NumericAxis(
                title: AxisTitle(
                    text: 'POINTS'
                )
            ),
            legend: Legend(isVisible: false),
            tooltipBehavior: TooltipBehavior(enable: true), // Enables the tooltip.
            series: <LineSeries<PointsData, String>>[
              LineSeries<PointsData, String>(
                  dataSource: pointsData,
                  xValueMapper: (PointsData history, _) => history.date,
                  yValueMapper: (PointsData history, _) => history.points,
                  dataLabelSettings: DataLabelSettings(isVisible: true) // Enables the data label.
              ),
            ],
          ),
        );
      }
  );

  Widget displayGrades(apiData) => FutureBuilder<dynamic>(
    future: apiData,
    builder: (context, snapshot) {
      if (!snapshot.hasData) return Container(
          height: 300,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.all(5),
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.green)),
                ),
              ),
            ],
          )
      );

      var grade = new List(snapshot.data[0].length);
      for(var i = 0; i < snapshot.data[0].length; i++) {
        if(snapshot.data[0][i] < 500)
          grade[i] = 'F ';
        else if(snapshot.data[0][i] < 999)
          grade[i] = 'E ';
        else if(snapshot.data[0][i] < 1499)
          grade[i] = 'D ';
        else if(snapshot.data[0][i] < 1999)
          grade[i] = 'C ';
        else if(snapshot.data[0][i] < 2499)
          grade[i] = 'B ';
        else if(snapshot.data[0][i] < 3000)
          grade[i] = 'A ';
        else
          grade[i] = 'A+';
      }

      return Column(
        children: <Widget>[
          for(var i = 0; i < snapshot.data[0].length; i++)
            Container(
                margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                child: Text(
                    '${grade[i]}',
                    style: TextStyle(
                        fontSize: 20.0
                    )
                )
            )
        ],
      );
    }
  );

  Widget displayDates(apiData) => FutureBuilder<dynamic>(
      future: apiData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container(
            height: 300,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(5),
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.green)),
                  ),
                ),
              ],
            )
        );

        return Column(
          children: <Widget>[
            for(var i = 0; i < snapshot.data[1].length; i++)
              Container(
                  margin: EdgeInsets.fromLTRB(40.0, 10.0, 30.0, 10.0),
                  child: Text(
                      '${snapshot.data[1][i]}-2020',
                      style: TextStyle(
                          fontSize: 20.0
                      )
                  )
              )
          ],
        );
      }
  );

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(),
    );
  }

  void initState() {
    super.initState();
    setState(() {
      scoreHistoryAlgebra = Collections().getScoreHistory('algebra');
      scoreHistoryTrigonometry = Collections().getScoreHistory('trigonometry');
      scoreHistoryGeometry = Collections().getScoreHistory('geometry');
    });
  }

}

class PointsData {
  PointsData(this.date, this.points);
  final String date;
  final int points;
}
