import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orderly/models/order.dart';
import 'package:orderly/models/user.dart';

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

  // Userdata from snapshot
  Userdata _userDataFromSnapshot(DocumentSnapshot ds) {
    return Userdata(
      uid: uid,
      name: ds.data['name'],
      type: ds.data['type'],
      amount: ds.data['amount'],
    );
  }

  // Get orders stream
  Stream<List<Order>> get orders {
    return orderCollectionRef.snapshots().map(_orderListFromSnapshot);
  }

  Stream<Userdata> get userData {
    return orderCollectionRef
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
