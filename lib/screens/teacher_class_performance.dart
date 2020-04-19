import 'package:PizzaRush/services/collections.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class ClassPerformance extends StatefulWidget {
  @override
  _ClassPerformanceState createState() => _ClassPerformanceState();
}

class _ClassPerformanceState extends State<ClassPerformance> {

  Future<List> classDataAlgebra, classDataTrigonometry, classDataGeometry;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            leading: new Container(),
            title: Text('CLASS PERFORMANCE'),
            centerTitle: true,
            backgroundColor: Colors.green[800],
            bottom: TabBar(
              indicatorColor: Colors.green[800],
              tabs: [
                Tab(text: 'Algebra',),
                Tab(text: 'Geometry',),
                Tab(text: 'Trigonometry',),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              displayClassPerformance(classDataAlgebra),
              displayClassPerformance(classDataTrigonometry),
              displayClassPerformance(classDataGeometry)
            ],
          )
      ),

    );
  }

  Widget displayClassPerformance(apiData) => FutureBuilder<dynamic> (
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

        var pointsData = new List<PointsData>(snapshot.data[0][0].length);
        var classMean = new List<double>(snapshot.data[0][0].length);
        var classMedian = new List<double>(snapshot.data[0][0].length);
        var classSD = new List<double>(snapshot.data[0][0].length);
        var a = new List<int>(snapshot.data.length);

        for(var i = 0; i < snapshot.data[0][0].length; i++) {
          for(var j = 0; j < snapshot.data.length; j++) {
            a[j] = snapshot.data[j][0][i];
          }
          int count = a.length;
          double sum = 0;
          for (int value in a) {
            sum += value;
          }
          classMean[i] = sum / count;
          double sumOfSquaredDiffFromMean = 0;
          for (int value in a) {
            double squareDiffFromMean = pow(value - classMean[i], 2);
            sumOfSquaredDiffFromMean += squareDiffFromMean;
          }
          classSD[i] = sqrt(sumOfSquaredDiffFromMean / count);

          if (count % 2 == 1) {
            int middleIndex = (count / 2 - 0.5).toInt();
            classMedian[i] = (a[middleIndex]).toDouble();
          } else {
            int secondMiddle = count ~/ 2;
            int firstMiddle = secondMiddle - 1;
            classMedian[i] = (a[firstMiddle] + a[secondMiddle]) / 2.0;
          }

          pointsData[i] = PointsData(snapshot.data[0][1][i], classMean[i]);
        }

        return ListView(
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
                      dataSource: pointsData,
                      xValueMapper: (PointsData history, _) => history.date,
                      yValueMapper: (PointsData history, _) => history.points,
                      dataLabelSettings: DataLabelSettings(isVisible: true) // Enables the data label.
                  ),
                ],
              ),
            ),
            for(var i = 0; i < snapshot.data[0][0].length; i++)
            Container(
              child: Column(
                children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(160.0, 10.0, 0, 0),
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
                              '${classMean[i]}',
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
                          margin: EdgeInsets.fromLTRB(69.5, 0, 0, 0),
                          child: Text(
                            '${snapshot.data[0][1][i]}',
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
                            '${classMedian[i]}',
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
                          margin: EdgeInsets.fromLTRB(160.0, 0, 0, 20.0),
                          alignment: Alignment.center,
                          constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                          decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                          child: Text(
                            'S.D.',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                          alignment: Alignment.center,
                          constraints: BoxConstraints(minWidth: 100.00, minHeight: 40.00),
                          decoration: BoxDecoration(color: Colors.grey[200], border: Border.all(color: Colors.grey[300])),
                          child: Text(
                            '${classSD[i]}',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }
  );


  void initState() {
    super.initState();
    setState(() {
      classDataAlgebra = Collections().getClassData('algebra');
      classDataTrigonometry = Collections().getClassData('trigonometry');
      classDataGeometry = Collections().getClassData('geometry');
    });
  }

}

class PointsData {
  PointsData(this.date, this.points);
  final String date;
  final double points;
}
