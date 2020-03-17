import 'package:PizzaRush/models/question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:PizzaRush/screens/login.dart';

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
    print(levelselected);
    print(topicselected);

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
                  points: q['points']
          )
      ));
    });
    print(questions);
    return questions;
  }

  void updatePoints(String topic, int points) async{
    var usertopicRef = await databaseReference.document('users/$username/history/$topic');

    try {
      await usertopicRef
          .updateData({'points': points});
    } catch (e) {
      print(e.toString());
    }
  }

  Future<int> getScore(String topic) async {
    var usertopicRef = await databaseReference.document('users/$username/history/$topic');
    int points;
      await usertopicRef
          .get()
          .then((DocumentSnapshot snapshot) {
        points = snapshot.data['points'];

      });

    return points;
  }
}