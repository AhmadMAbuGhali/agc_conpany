
class Order{
  String? id;
  List<LineItemsPost>? lineItems;
  String? customerId;
  String? date;
  String? status;
  String? customerName;
  String? company;
  String? phone;
  bool?  isQuantityFull = false;
  bool?  isCompleteOrder = false;
  int? orderNumber=0;
  Order(
      {this.id,
        this.lineItems,
        this.customerId,
        this.date,
        this.status,
        this.company,
        this.phone,
        this.orderNumber,
        this.customerName,
        this.isQuantityFull =false,
        this.isCompleteOrder =false,
      });
  Order.fromMap(Map<String, dynamic> map) {
    id=map['id'];
    customerId = map['customerId'];
    customerName = map['customerName'];
    company = map['company'];
    date = map['date'];
    status = map['status'];
    phone = map['phone'];
    isQuantityFull = map['isQuantityFull'];
    orderNumber = map['orderNumber'];
    isCompleteOrder = map['isCompleteOrder'];
    if(map['lineItems'] !=null){
      map['lineItems']?.forEach((v){
        lineItems?.add(LineItemsPost.fromMap(v));
      });
    }
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id']=id;
    map['customerId'] = customerId;
    map['customerName'] = customerName;
    map['date'] = date;
    map['status'] = status;
    map['company'] = company;
    map['phone'] = phone;
    map['customerName'] = customerName;
    map['isQuantityFull']= isQuantityFull;
    map['orderNumber']= orderNumber;
    map['isCompleteOrder']= isCompleteOrder;
    if(lineItems != null){
      map['lineItems']=lineItems!.map((e) => e.toMap()).toList();
    }
    return map;
  }


}

class LineItemsPost {
  String? productId;
  int? quantity;
  LineItemsPost({this.productId, this.quantity});
  LineItemsPost.fromMap(Map<String, dynamic> map) {
    productId=map['productId'];
    quantity = map['quantity'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['quantity']=quantity;
    map['productId'] = productId;
    return map;
  }

}


