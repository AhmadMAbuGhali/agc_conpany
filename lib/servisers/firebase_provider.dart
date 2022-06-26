import 'dart:developer';
import 'dart:io';
import 'package:agc_conpany/model/categpry_model.dart';
import 'package:agc_conpany/model/order.dart';
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
    getOrderSalesPerson();
    getOrderSalesPersontoAccountent();
    getOrderAccountant();
    getOrderStoreKeeper();
    getOrderDriver();
    getOrderStoreKeeperOrderAccept();
    getOrderDriverpinding();
    getCompletedOrder();

    getOrderStoreKeeperOrderAccept();
  }

  String? dropdownValue = 'اختر التصنيف';

  changeDrobDown(String value) {
    dropdownValue = value;
    notifyListeners();
  }

  List<String> wigthw = [
    'اختر وزن',
    '25 كيلو غرام ',
    '50 كيلو غرام ',
  ];
  String? dropdownValue2 = 'اختر وزن';

  changeDrobDown2(String value) {
    dropdownValue2 = value;
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
  List<Order> orderSalesPerson = [];
  List<Order> orderSalesPersontoAccountent = [];
  List<Order> orderAccountent = [];
  List<Order> orderStoreKeeper = [];
  List<Order> StoreKeeperOrderAccept = [];
  List<Order> orderStoreKeeperToDriver = [];
  List<Order> orderDriver = [];
  List<Order> orderDriverpinding = [];
  List<Order> completedOrder = [];

  //product order
  List<ProductModel> productOrder = [];

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

  updateCatogryname(String catName, String catId) async {
    await FirestoreHelper.firestoreHelper.updateCatogryname(catName, catId);
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

  deleteFromWatingCustomer(String userId) async {
    await FirestoreHelper.firestoreHelper.deletefromCustomerAwaiting(userId);
    notifyListeners();
  }

  getAllCustomerWaiting() async {
    watingCustomer =
        await FirestoreHelper.firestoreHelper.getAllCustomerWaiting();
    log(watingCustomer.length.toString());
   await getAllCustomerWaiting();
    notifyListeners();
  }

  getAllCustomer() async {
    allCustomer = await FirestoreHelper.firestoreHelper.getAllCustomer();
    log(allUser.length.toString());
    await getAllCustomer();
    notifyListeners();
  }

  rejectedCustomer(CustomerModel customerModel) async {
    await FirestoreHelper.firestoreHelper.rejectedCustomer(customerModel);
    await getAllWaitingUser();
    notifyListeners();
  }

  acceptedCustomer(CustomerModel customerModel) async {
    await FirestoreHelper.firestoreHelper.acceptedCustomer(customerModel);
    await   getAllWaitingUser();
    notifyListeners();
  }

  getAllCategory() async {
    allCategory = await FirestoreHelper.firestoreHelper.getAllCategory();
    allCategoryname = [];
    allCategoryname.add('اختر التصنيف');
    for (CategoryModel item in allCategory) {
      allCategoryname.add(item.categoryName!);
    }
    await getAllCategory();
    notifyListeners();
  }

  getAllProduct() async {
    allProduct = await FirestoreHelper.firestoreHelper.getAllProduct();
    log(allProduct.length.toString());
    await  getAllProduct();
    notifyListeners();
  }

  updateProduct(
      {required String name,
      required String disc,
      required String imagePath,
      required String productId}) async {
    if (file != null) {
      log('add image');
      imagePath = await FirestoreHelper.firestoreHelper.uploadImage(file!);
    }
    await FirestoreHelper.firestoreHelper.updateProduct(
        name: name, disc: disc, imagePath: imagePath, productId: productId);
    await getAllProduct();
    notifyListeners();
  }

  updateProductQuntity(
      {required String quantity, required String productId}) async {
    await FirestoreHelper.firestoreHelper
        .updateProductQuntity(quantity: quantity, productId: productId);
    await   getAllProduct();
    notifyListeners();
  }

  addProduct(ProductModel productModel) async {
    log('start add product');
    try {
      if (file != null) {
        log('add image');
        String imageUrl =
            await FirestoreHelper.firestoreHelper.uploadImage(file!);
        productModel.imagePath = imageUrl;
      }
      await FirestoreHelper.firestoreHelper.addProduct(productModel);
      await  getAllProduct();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  addCategory(String name) async {
    log('start add category');
    try {
      await FirestoreHelper.firestoreHelper.addCategory(name);
     await  getAllCategory();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  pickNewImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(file!.path);
    print('ad  d image ');
    notifyListeners();
  }

  acceptedOrder(Order order) async {
    await FirestoreHelper.firestoreHelper.acceptedOrder(order);
   await getOrderSalesPerson();
    notifyListeners();
  }

  acceptedOrdertoAccountent(Order order) async {
    await FirestoreHelper.firestoreHelper.acceptedOrdertoAccountent(order);
    await getOrderSalesPersontoAccountent();
    notifyListeners();
  }

  OrdertoStoreKeper(Order order) async {
    await FirestoreHelper.firestoreHelper.orderAccountentToStoreKeeper(order);
   await getOrderSalesPerson();
    notifyListeners();
  }

  OrdertoStoreKeperAccept(Order order) async {
    await FirestoreHelper.firestoreHelper.orderStoreKeeperAccept(order);
    getOrderSalesPerson();
    notifyListeners();
  }

  OrdertoDriver(Order order) async {
    await FirestoreHelper.firestoreHelper.orderStoreKeeperToDriver(order);
    await   getOrderDriver();
    notifyListeners();
  }

  OrdertriverPinding(Order order) async {
    await FirestoreHelper.firestoreHelper.orderDriverPinding(order);
    await   getOrderDriverpinding();
    notifyListeners();
  }

  getOrderSalesPerson() async {
    orderSalesPerson =
        await FirestoreHelper.firestoreHelper.getOrderSalesPerson();
    await getOrderSalesPerson();
    notifyListeners();
  }

  deleteFromOrderSalesPerson(String orderId) async {
    await FirestoreHelper.firestoreHelper.deletefromOrderSalesPerson(orderId);
    notifyListeners();
  }

  getOrderStoreKeeperOrderAccept() async {
    StoreKeeperOrderAccept =
        await FirestoreHelper.firestoreHelper.getOrderStoreKeeperOrderAccept();
    await getOrderStoreKeeperOrderAccept();

    notifyListeners();
  }

  deleteFromStoreKeeperOrderAccept(String orderId) async {
    await FirestoreHelper.firestoreHelper
        .deletefromStoreKeeperOrderAccept(orderId);
    notifyListeners();
  }

  getOrderSalesPersontoAccountent() async {
    orderSalesPersontoAccountent =
        await FirestoreHelper.firestoreHelper.getOrderSalesPersontoAccountent();
    await getOrderSalesPersontoAccountent();
    notifyListeners();
  }

  deleteFromOrderSalesPersontoAccountent(String orderId) async {
    await FirestoreHelper.firestoreHelper
        .deletefromOrderSalesPersontoAccountent(orderId);
    notifyListeners();
  }

  getOrderAccountant() async {
    orderAccountent =
        await FirestoreHelper.firestoreHelper.getOrderAccountant();

    await getOrderAccountant();
    notifyListeners();
  }

  deleteFromOrderAccountant(String orderId) async {
    await FirestoreHelper.firestoreHelper.deletefromOrderAccountant(orderId);
    notifyListeners();
  }

  getOrderStoreKeeper() async {
    orderStoreKeeper =
        await FirestoreHelper.firestoreHelper.getOrderStoreKeeper();

    await getOrderStoreKeeper();
    notifyListeners();
  }

  deleteFromOrderStoreKeeper(String orderId) async {
    await FirestoreHelper.firestoreHelper.deletefromOrderStoreKeeper(orderId);
    notifyListeners();
  }

  getOrderDriver() async {
    orderDriver = await FirestoreHelper.firestoreHelper.getOrderDriver();
    await getOrderDriver();
    notifyListeners();
  }

  deleteFromOrderDriver(String orderId) async {
    await FirestoreHelper.firestoreHelper.deletefromOrderDriver(orderId);
    notifyListeners();
  }

  getOrderDriverpinding() async {
    orderDriverpinding =
        await FirestoreHelper.firestoreHelper.getOrderDriverPinding();
    await getOrderDriverpinding();
    notifyListeners();
  }

  deleteFromOrderDriverpinding(String orderId) async {
    await FirestoreHelper.firestoreHelper.deletefromOrderDriverPinding(orderId);
    notifyListeners();
  }

  getProductFromOrder(List<LineItemsPost> lineItemsPost) {
    for (int i = 0; i < lineItemsPost.length; ++i) {
      ProductModel productModel = allProduct
          .where((element) => element.id == lineItemsPost[i].productId)
          .toList()
          .first;
      productModel.quantity = lineItemsPost[i].quantity!;
      productOrder.add(productModel);
    }
    notifyListeners();
  }

  addToCompleteOrder(Order order) async {
    await FirestoreHelper.firestoreHelper.CompletedOrder(order);
    await getCompletedOrder();
    notifyListeners();
  }

  getCompletedOrder() async {
    completedOrder = await FirestoreHelper.firestoreHelper.getCompletedOrder();
    notifyListeners();
  }
}
