
import 'dart:developer';

import 'package:agc_conpany/model/categpry_model.dart';
import 'package:agc_conpany/model/product_model.dart';
import 'package:agc_conpany/servisers/firebase/firestore_helper.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier{

  ProductProvider();

  addCategory(BuildContext context,String categoryName,)async{
    log('start add product');

    ProductModel productModel  = ProductModel(wight50: false,wight100: false,imagePath: "",productName: "",description: "", category: '');
    try{
      productModel.id =
      await FirestoreHelper.firestoreHelper.addProduct(productModel);

    }catch (e){

    }

  }

}