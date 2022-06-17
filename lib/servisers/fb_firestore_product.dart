import 'package:agc_conpany/model/categpry_model.dart';
import 'package:agc_conpany/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FbFireStoreProduct{
  final CollectionReference<Map<String, dynamic>> _collectionReference=FirebaseFirestore.instance.collection('Product');
  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;

  Future<bool> createProduct({required ProductModel productModel}) async {
    return await _firebaseFirestore
        .collection('Product')
        .add(productModel.toMap())
        .then((DocumentReference value) {
      print(value.id);
      return true;
    }).onError((error, stackTrace) => false);
  }











  Stream<QuerySnapshot<ProductModel>> getProduct() async* {
    yield* _firebaseFirestore
        .collection('ProductModel')
        .withConverter<ProductModel>(
        fromFirestore: (snapshot, options) =>
            ProductModel.fromMap(snapshot.data()!),
        toFirestore: (ProductModel value, options) => value.toMap())
        .snapshots();
  }

}