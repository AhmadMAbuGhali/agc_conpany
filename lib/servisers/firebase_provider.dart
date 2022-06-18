import 'dart:developer';
import 'dart:io';
import 'package:agc_conpany/model/categpry_model.dart';
import 'package:agc_conpany/model/product_model.dart';
import 'package:agc_conpany/model/users.dart';
import 'package:agc_conpany/servisers/firebase/firestore_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model/customer_model.dart';

class FireBaseProvider extends ChangeNotifier {
  FireBaseProvider() {
    getAllCustomerWaiting();
    getAllWaitingUser();
    getAllUser();
    getAllCustomer();
    getAllCategory();
  }
  File? file;
  List<UserApp> watingUser = [];
  List<CustomerModel> watingCustomer = [];
  List<UserApp> allUser = [];
  List<CustomerModel> allCustomer = [];
  List<CategoryModel> allCategory = [];
  List<ProductModel> allProduct = [];
  getAllWaitingUser() async {
    watingUser = await FirestoreHelper.firestoreHelper.getAllUsersWaiting();
    log(watingUser.length.toString());
    notifyListeners();
  }

  getAllUser() async {
    allUser = await FirestoreHelper.firestoreHelper.getAllUsers();
    log(allUser.length.toString());
    notifyListeners();
  }


  disableUser(String userId) async {
    await FirestoreHelper.firestoreHelper.disableUser(userId);
    notifyListeners();
  }

  acceptedUser(UserApp userApp) async {
    await FirestoreHelper.firestoreHelper.acceptedUser(userApp);
    getAllWaitingUser();
    notifyListeners();
  }



  rejectedUser(UserApp userApp) async {
    await FirestoreHelper.firestoreHelper.rejectedUser(userApp);
    getAllWaitingUser();
    notifyListeners();
  }

  deleteFromWating(String userId) async {
    await FirestoreHelper.firestoreHelper.deletefromUsersAwaiting(userId);
    notifyListeners();
  }

  getAllCustomerWaiting() async {
    watingCustomer =
        await FirestoreHelper.firestoreHelper.getAllCustomerWaiting();
    log(watingCustomer.length.toString());
    notifyListeners();
  }

  getAllCustomer() async {
    allCustomer = await FirestoreHelper.firestoreHelper.getAllCustomer();
    log(allUser.length.toString());
    notifyListeners();
  }

  acceptedCustomer(CustomerModel customerModel) async {
    await FirestoreHelper.firestoreHelper.acceptedCustomer(customerModel);
    getAllWaitingUser();
    notifyListeners();
  }

  rejectedCustomer(CustomerModel customerModel) async {
    await FirestoreHelper.firestoreHelper.rejectedCustomer(customerModel);
    getAllWaitingUser();
    notifyListeners();
  }

  deleteFromWatingCustomer(String userId) async {
    await FirestoreHelper.firestoreHelper.deletefromCustomerAwaiting(userId);
    notifyListeners();
  }



  getAllCategory() async {
    allCategory = await FirestoreHelper.firestoreHelper.getAllCategory();
    log(allCategory.length.toString());
    notifyListeners();
  }

  getAllProduct() async {
    allProduct= await FirestoreHelper.firestoreHelper.getAllProduct();
    log(allProduct.length.toString());
    notifyListeners();
  }
  AllProduct(ProductModel productModel) async {
    await FirestoreHelper.firestoreHelper.getAllProduct();
    getAllProduct();
    notifyListeners();
  }
  addProduct(ProductModel productModel)async{
    log('start add product');
     try{
       if(file !=null){
       String imageUrl =  await FirestoreHelper.firestoreHelper.uploadImage(file!);
       productModel.imagePath=imageUrl;
       }
      await FirestoreHelper.firestoreHelper.addProduct(productModel);
      notifyListeners();
    }catch (e){
      print(e);
    }
  }

  addCategory(String name)async{
    log('start add category');
    // String docId =  FirestoreHelper.firestoreHelper.doc().id;
    CategoryModel categoryModel  = CategoryModel(categoryName: name,id:'1234');
    try{
      await FirestoreHelper.firestoreHelper.addCategory(categoryModel);
      getAllCategory();
      notifyListeners();
    }catch (e){
      print(e);
    }
  }

}
