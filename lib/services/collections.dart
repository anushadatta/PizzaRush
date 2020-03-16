import 'package:PizzaRush/models/question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Collections
{
  final databaseReference = Firestore.instance;

  Future<bool> isStudent(String email) async{

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
}