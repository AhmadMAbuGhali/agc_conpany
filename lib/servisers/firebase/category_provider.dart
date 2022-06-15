
import 'dart:developer';

import 'package:agc_conpany/model/categpry_model.dart';
import 'package:agc_conpany/servisers/firebase/firestore_helper.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier{

  CategoryProvider();

  addCategory(BuildContext context,String categoryName,)async{
    log('start add category');

    CategoryModel categoryModel  = CategoryModel(categoryName: "");
    try{
      categoryModel.id =
      await FirestoreHelper.firestoreHelper.addCategory(categoryModel);

    }catch (e){

    }

  }

}