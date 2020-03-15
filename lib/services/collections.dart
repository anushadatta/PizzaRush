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


}