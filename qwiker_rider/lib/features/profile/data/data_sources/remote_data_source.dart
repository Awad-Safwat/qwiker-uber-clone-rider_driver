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

  Future<UserModel> getUserProfileData(String userId) async {
    final docRef = _firestoreUsersCollection
        .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, options) => user.toFirestore(user),
        )
        .doc(
          userId,
        );

    final docSnap = await docRef.get();
    final userData = docSnap.data();
    return userData!;
  }

  Future<void> updateUserProfileData(UserModel user) async {
    final docRef = _firestoreUsersCollection
        .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, options) => user.toFirestore(user),
        )
        .doc(
          user.userId,
        );
    final updates = user.toFirestore(user);
    await docRef.update(updates);
  }
}
