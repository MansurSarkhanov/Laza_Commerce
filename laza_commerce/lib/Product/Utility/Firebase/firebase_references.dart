import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseReference {
  users,
  products;

  CollectionReference get ref => FirebaseFirestore.instance.collection(name);
}
