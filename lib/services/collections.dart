import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:PizzaRush/models/challenges.dart';
import 'package:PizzaRush/models/question.dart';
import 'package:PizzaRush/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:PizzaRush/models/leaderboardClass.dart';
import 'package:PizzaRush/screens/sent_challenges.dart';

class Collections
{
  final databaseReference = Firestore.instance;
  static String username;

  Future<bool> isStudent(String email) async{
    username = email;

    var document = databaseReference.collection('users').document(email);
    bool isStudent = true;
    await document
        .get()
        .then((DocumentSnapshot snapshot) {
      isStudent = snapshot.data['uid'];

    });
    return isStudent;
  }

  Future<List> getQuestions(String levelselected, String topicselected) async {

    List <Question> questions = [];

    var topicRef = await databaseReference.collection('questions/$levelselected/$topicselected');

    await topicRef
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((q) =>
          questions.add(
              Question(
                  id: q['id'],
                  question: q['question'],
                  level: levelselected,
                  topic: topicselected,
                  storyContext: q['storyContext'],
                  character: q['character'],
                  answer1: q['answer1'],
                  answer2: q['answer2'],
                  answer3: q['answer3'],
                  answer4: q['answer4'],
                  correctanswer: q['correctanswer'],
                  imageUrl: q['imageUrl'],
                  hint: q['hint'],
                  points: q['points'],
                  type: q['type'],
              )
          ));
    });
    return questions;
  }

  Future<List> getChallengeQuestions(String levelselected, String topicselected) async {

    List <Question> questions = [];

    var topicRef = await databaseReference.collection('challenges/$levelselected/$topicselected');

    await topicRef
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((q) =>
          questions.add(
              Question(
                question: q['question'],
                level: levelselected,
                topic: topicselected,
                answer1: q['answer1'],
                answer2: q['answer2'],
                answer3: q['answer3'],
                answer4: q['answer4'],
                correctanswer: q['correctanswer'],
              )
          ));
    });
    return questions;
  }

  void updatePoints(String topic, int points) async{
    var usertopicRef = await databaseReference.document('users/$username/points/$topic');

      await usertopicRef
          .updateData({'points': points});


      await databaseReference.collection('users').document(username)
          .updateData({'points_$topic': points});

  }

  Future<int> getPreviousAttempts(String topic, String level) async{
    var usertopicRef = await databaseReference.document('users/$username/points/$topic');
    int attempts;
    await usertopicRef
        .get()
        .then((DocumentSnapshot snapshot) {
      attempts = snapshot.data['question_$level'];

    });
    return attempts;
  }

  void updateQuestionDone(String topic, String level) async{
    var usertopicRef = await databaseReference.document('users/$username/points/$topic');
    var previousAttempts = await getPreviousAttempts(topic, level);
    try {
      await usertopicRef
          .updateData({'question_$level': (previousAttempts+1)});
    } catch (e) {
      print(e.toString());
    }
  }

  Future<int> getScore(String topic) async {
    var usertopicRef = await databaseReference.document('users/$username/points/$topic');
    int points;
    await usertopicRef
        .get()
        .then((DocumentSnapshot snapshot) {
      points = snapshot.data['points'];

    });

    return points;
  }

  Future<List<Challenges>> getChallenges() async{

    List<Challenges> challenges = [];
    var challengesRef = await databaseReference.collection('users/$username/received_challenges');

    await challengesRef
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((q) =>
          challenges.add(
              Challenges(
                id: q['id'],
                challenger: q['challenger'],
                level: q['level'],
                topic: q['topic'],
                challengersTime: q['challengers_time'],
                challengersScore: q['challengers_score'],
                challengeeTime: q['challengee_time'],
                challengeeScore: q['challengee_score'],
                questions: q['questions'],
              )
          ));
    });
    return challenges;
  }
  
  Future<List<Challenges>> getSentChallenges() async{

    List<Challenges> challengesSent = [];
    var challengesRef = await databaseReference.collection('users/$username/sent_challenges');

    await challengesRef
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((q) =>
          challengesSent.add(
              Challenges(
                id: q['id'],
                challenger: q['challenger'],
                level: q['level'],
                topic: q['topic'],
                challengersTime: q['challengers_time'],
                challengersScore: q['challengers_score'],
                challengeeTime: q['challengee_time'],
                challengeeScore: q['challengee_score'],
                questions: q['questions'],
                outcome: q['outcome'],

              )
          ));
    });
    return challengesSent;
  }

  Future<List> getLeaderboardData(String topic) async {
    List<Leaderboard> leaderboardData = [];

    await databaseReference
        .collection("users")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((user) =>
          leaderboardData.add(
              Leaderboard(
                  name: user['firstname'],
                  points: user['points_$topic'],
                  uid: user['uid']
              )
          )
      );
    } );

    for(int i=0; i<leaderboardData.length; i++){
      if(leaderboardData[i].uid==false){
        leaderboardData.removeAt(i);
      }
    }
    return leaderboardData;
  }

  void uploadTeacherQuestion(Question q) async {

    await databaseReference.collection("questions")
        .document(q.level).collection(q.topic).document(q.id)
        .setData({

      'id': q.id,
      'question': q.question,
      'topic': q.topic,
      'level': q.level,
      'storyContext': q.storyContext,
      'character': q.character,
      'answer1': q.answer1,
      'answer2': q.answer2,
      'answer3': q.answer3,
      'answer4': q.answer4,
      'correctanswer': q.correctanswer,
      'imageUrl': q.imageUrl,
      'hint': q.hint,
      'points': q.points,
    });
  }
  
  Future<List> getScoreHistory(String topic) async {
    var userTopicRef = databaseReference.document('users/$username/history/$topic');
    List scoreHistory = [];
    await userTopicRef
        .get()
        .then((DocumentSnapshot snapshot) {
      scoreHistory.add(snapshot.data['points']);
      scoreHistory.add(snapshot.data['deadline']);
    });
    return scoreHistory;
  }

  Future<List> getClassData(String topic) async {
    var studentRef = databaseReference.document('users/$username');
    List studentId = [];
    await studentRef
        .get()
        .then((DocumentSnapshot snapshot) {
          studentId = snapshot.data['students'];
    });

    List classData = new List(studentId.length);

    for(var i = 0; i < studentId.length; i++) {
      List scoreHistory = [];
      var userTopicRef = databaseReference.document('users/${studentId[i]}/history/$topic');
      await userTopicRef
          .get()
          .then((DocumentSnapshot snapshot) {
            scoreHistory.add(snapshot.data['points']);
            scoreHistory.add(snapshot.data['deadline']);
      });
      classData[i] = scoreHistory;
    }
    return classData;
  }

}
