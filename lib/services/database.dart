import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moneytor/models/models.dart';
import 'package:moneytor/models/profile_model.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // Collection reference
  final CollectionReference planCollection =
      FirebaseFirestore.instance.collection("plans");
  final CollectionReference profileCollection =
      FirebaseFirestore.instance.collection("profiles");

  Future updateUserData(String name, String gender) async {
    return await profileCollection.doc(uid).set({
      "name": name,
      "gender": gender,
    });
  }

  // Add new plan
  Future addPlan(
    String userId,
    String title,
    String subTitle,
    String paymentType,
    int paymentDuration,
    int targetAmount,
    int raisedAmount,
    int proposedRepaymentAmount,
    String status,
    DateTime paymentDate,
    int progress,
  ) async {
    var data = ({
      'userId': userId,
      'title': title,
      'subTitle': subTitle,
      'paymentType': paymentType,
      'paymentDuration': paymentDuration,
      'targetAmount': targetAmount,
      'raisedAmount': raisedAmount,
      'proposedRepaymentAmount': proposedRepaymentAmount,
      'paymentDate': paymentDate,
      'progress': progress,
      'status': status,
    });
    return await planCollection.doc().set(data);
  }

  // plan list from snapshot
  List<PlanModel> _planListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return PlanModel(
        title: doc.data()['title'] ?? '',
        subTitle: doc.data()['subTitle'] ?? '',
        paymentType: doc.data()['paymentType'] ?? '',
        paymentDuration: doc.data()['paymentDuration'] ?? 1,
        targetAmount: doc.data()['targetAmount'] ?? 0,
        raisedAmount: doc.data()['raisedAmount'] ?? 0,
        proposedRepaymentAmount: doc.data()['proposedRepaymentAmount'] ?? 0,
        status: doc.data()['status'] ?? '',
        paymentDate: doc.data()['startDate'] ?? DateTime.now(),
        progress: doc.data()['progress'] ?? 0,
      );
    }).toList();
  }

  // user data from snapshot
  ProfileModel _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return ProfileModel(
      uid: uid,
      name: snapshot.data()['name'],
      gender: snapshot.data()['gender'],
    );
  }

  // Get plans stream
  Stream<List<PlanModel>> get plans {
    return planCollection.snapshots().map(_planListFromSnapshot);
  }

  // get user doc stream
  Stream<ProfileModel> get userData {
    return profileCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
