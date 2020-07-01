import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orderly/models/order.dart';

class DatabaseService {
  final String uid;
  final CollectionReference orderCollectionRef =
      Firestore.instance.collection('prefs');

  DatabaseService({this.uid});

  Future updateUserData(String name, String type, int amount) async {
    return await orderCollectionRef.document(uid).setData({
      'name': name,
      'type': type,
      'amount': amount,
    });
  }

  List<Order> _orderListFromSnapshot(QuerySnapshot ss) {
    return ss.documents.map((doc) {
      return Order(
        name: doc.data['name'] ?? '',
        type: doc.data['type'] ?? '',
        amount: doc.data['amount'] ?? 0,
      );
    }).toList();
  }

  // Get orders stream
  Stream<List<Order>> get orders {
    return orderCollectionRef.snapshots().map(_orderListFromSnapshot);
  }
}
