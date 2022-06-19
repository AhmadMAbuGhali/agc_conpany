import 'dart:developer';
import 'dart:io';
import 'package:agc_conpany/model/categpry_model.dart';
import 'package:agc_conpany/model/product_model.dart';
import 'package:agc_conpany/model/users.dart';
import 'package:agc_conpany/servisers/firebase/firestore_helper.dart';
import 'package:flutter/foundation.dart';
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
    getAllProduct();
  }
  String? dropdownValue = 'اختر التصنيف' ;
  changeDrobDown(String value){
    dropdownValue=value;
    notifyListeners();
  }
  List<String> wigthw=[  'اختر وزن',
      '٥٠ كيلو غرام ',
     '١٠٠ كيلو غرام ',
  ];
  String? dropdownValue2 = 'اختر وزن' ;
  changeDrobDown2(String value){
    dropdownValue2=value;
    notifyListeners();
  }
  File? file;
  List<UserApp> watingUser = [];
  List<CustomerModel> watingCustomer = [];
  List<UserApp> allUser = [];
  List<CustomerModel> allCustomer = [];
  List<CategoryModel> allCategory = [];
  List<String> allCategoryname = [];
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
  updateCatogryname(String catName,String catId) async{
    await FirestoreHelper.firestoreHelper.updateCatogryname(catName,catId);
    getAllCategory();
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
    allCategoryname=[];
    allCategoryname.add('اختر التصنيف');
    for(CategoryModel item in allCategory){
      allCategoryname.add(item.categoryName!);
    }

    notifyListeners();
  }

  getAllProduct() async {
    allProduct= await FirestoreHelper.firestoreHelper.getAllProduct();
    log(allProduct.length.toString());
    notifyListeners();
  }
  updateProduct({required String name,required String disc,required String imagePath,required String productId}) async{
    if(file !=null){
      log('add image');
      imagePath=  await FirestoreHelper.firestoreHelper.uploadImage(file!);
    }
    await FirestoreHelper.firestoreHelper.updateProduct(name: name,disc: disc,imagePath: imagePath,productId: productId);
    getAllProduct();
    notifyListeners();
  }
  updateProductQuntity({required String quantity,required String productId}) async{

    await FirestoreHelper.firestoreHelper.updateProductQuntity(quantity:quantity,productId: productId);
    getAllProduct();
    notifyListeners();
  }

  addProduct(ProductModel productModel)async{
    log('start add product');
     try{
       if(file !=null){
         log('add image');
       String imageUrl =  await FirestoreHelper.firestoreHelper.uploadImage(file!);
       productModel.imagePath=imageUrl;
       }
      await FirestoreHelper.firestoreHelper.addProduct(productModel);
       getAllProduct();
      notifyListeners();
    }catch (e){
      print(e);
    }
  }

  addCategory(String name)async{
    log('start add category');
    try{
      await FirestoreHelper.firestoreHelper.addCategory(name);
      getAllCategory();
      notifyListeners();
    }catch (e){
      print(e);
    }
  }
  pickNewImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(file!.path);
    print('ad  d image ');
    notifyListeners();
  }

}
