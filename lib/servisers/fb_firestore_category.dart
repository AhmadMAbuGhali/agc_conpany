import 'package:agc_conpany/model/categpry_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FbFireStoreCategory{
  final CollectionReference<Map<String, dynamic>> _collectionReference=FirebaseFirestore.instance.collection('Category');
  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;

  Future<bool> createCategory({required CategoryModel categoryModel}) async {
    return await _firebaseFirestore
        .collection('Category')
        .add(categoryModel.toMap())
        .then((DocumentReference value) {
      print(value.id);
      return true;
    }).onError((error, stackTrace) => false);
  }











  Stream<QuerySnapshot<CategoryModel>> getCategory() async* {
    yield* _firebaseFirestore
        .collection('CategoryModel')
        .withConverter<CategoryModel>(
        fromFirestore: (snapshot, options) =>
            CategoryModel.formMap(snapshot.data()!),
        toFirestore: (CategoryModel value, options) => value.toMap())
        .snapshots();
  }

}