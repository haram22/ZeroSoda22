import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zerosoda/Service/User/user.dart';

class UserProvider with ChangeNotifier {
  late CollectionReference usersReference;
  List<UsersName> _users = [];

  UserProvider({reference}) {
    usersReference = reference ?? FirebaseFirestore.instance.collection('users');
  }

  Future<void> UserFetch() async {
    _users = await usersReference.get().then( (QuerySnapshot results) {
      return results.docs.map( (DocumentSnapshot document) {
        return UsersName.fromSnapshot(document);
      }).toList();
    });
    notifyListeners();
  }
}
