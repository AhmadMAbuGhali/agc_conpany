import 'package:agc_conpany/model/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FbFirestoreWaitingUser{

  final CollectionReference<Map<String, dynamic>> _collectionReference=FirebaseFirestore.instance.collection('waitinguser');

  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;

  Future<bool> createAccount ({required UserApp user})async{


    return await _firebaseFirestore.collection('waitinguser')
        .add(user.toMap())
        .then((value) => true)
        .onError((error, stackTrace) => false);



  }





  }