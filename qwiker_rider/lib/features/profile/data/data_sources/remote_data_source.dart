import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_rider/features/profile/data/user_model/user_model.dart';

class RemoteUsersData {
  final CollectionReference<Map<String, dynamic>> _firestoreUsersCollection =
      FirebaseFirestore.instance.collection('riders');

  Future<void> addNewUser(UserModel user) async {
    final docRef = _firestoreUsersCollection
        .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, options) => user.toFirestore(user),
        )
        .doc(
          user.userId,
        );
    await docRef.set(user);
  }

  Future<bool> checkUserExistans({required String userId}) async {
    final docRef = await _firestoreUsersCollection.doc(userId).get();

    if (docRef.exists) {
      return true;
    } else {
      return false;
    }
  }
}
