import 'package:PizzaRush/models/question.dart';

class Challenges
{
  String id;
  List questions;
  String topic;
  String level;
  String outcome;
  String challenger;
  int challengee_score;
  int challengee_time;
  int challengers_score;
  int challengers_time;

  Challenges({
    this.id,
    this.questions,
    this.level,
    this.topic,
    this.outcome,
    this.challenger,
    this.challengee_score,
    this.challengee_time,
    this.challengers_score,
    this.challengers_time,
  });

}