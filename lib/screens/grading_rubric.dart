import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class GradingRubric extends StatefulWidget {
  @override
  _GradingRubricState createState() => _GradingRubricState();
}

class _GradingRubricState extends State<GradingRubric> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grading Rubric'),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        child: Text(
                            'POINTS',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0
                            )
                        )
                    ),
                    Container(
                        child: Text(
                            'GRADE',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0
                            )
                        )
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(80.0, 10.0, 87.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Text(
                            '>3000',
                            style: TextStyle(
                                fontSize: 20.0
                            )
                        )
                    ),
                    Container(
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
                margin: EdgeInsets.fromLTRB(60.0, 10.0, 97.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Text(
                            '2500-3000',
                            style: TextStyle(
                                fontSize: 20.0
                            )
                        )
                    ),
                    Container(
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
                margin: EdgeInsets.fromLTRB(60.0, 10.0, 97.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Text(
                            '2000-2499',
                            style: TextStyle(
                                fontSize: 20.0
                            )
                        )
                    ),
                    Container(
                        child: Text(
                            'B',
                            style: TextStyle(
                                fontSize: 20.0
                            )
                        )
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(60.0, 10.0, 97.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Text(
                            '1500-1999',
                            style: TextStyle(
                                fontSize: 20.0
                            )
                        )
                    ),
                    Container(
                        child: Text(
                            'C',
                            style: TextStyle(
                                fontSize: 20.0
                            )
                        )
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(60.0, 10.0, 97.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Text(
                            '1000-1499',
                            style: TextStyle(
                                fontSize: 20.0
                            )
                        )
                    ),
                    Container(
                        child: Text(
                            'D',
                            style: TextStyle(
                                fontSize: 20.0
                            )
                        )
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(70.0, 10.0, 97.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Text(
                            '500-999',
                            style: TextStyle(
                                fontSize: 20.0
                            )
                        )
                    ),
                    Container(
                        child: Text(
                            'E',
                            style: TextStyle(
                                fontSize: 20.0
                            )
                        )
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(80.0, 10.0, 97.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Text(
                            '<500',
                            style: TextStyle(
                                fontSize: 20.0
                            )
                        )
                    ),
                    Container(
                        child: Text(
                            'F',
                            style: TextStyle(
                                fontSize: 20.0
                            )
                        )
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
