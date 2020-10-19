import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moneytor/models/models.dart';
import 'package:moneytor/models/profile_model.dart';

class DatabaseService {
  final String uid;
  final String reqId;
  DatabaseService({this.uid, this.reqId});

  // Collection reference
  final CollectionReference planCollection =
      FirebaseFirestore.instance.collection("plans");
  final CollectionReference profileCollection =
      FirebaseFirestore.instance.collection("profiles");
  final CollectionReference paymentCollection =
      FirebaseFirestore.instance.collection("payments");

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
    DateTime startDateTime,
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
      'startDateTime': startDateTime,
      'progress': progress,
      'status': status,
    });
    return await planCollection.doc().set(data);
  }

  // Update Plan
  Future updatePlanData(
      String planId, int raisedAmount, int progress, String status) async {
    var data = ({
      "planId": planId,
      "raisedAmount": raisedAmount,
      "progress": progress,
      "status": status,
    });
    return await planCollection.doc(planId).update(data);
  }

  // Add new payment
  Future addPayment(
    String planId,
    String planTitle,
    int amount,
    DateTime paymentDate,
    int currentRaisedAmount,
    int targetAmount,
    String paymentMode,
    String paymentChannel,
    String transactionReference,
  ) async {
    var data = ({
      'planId': planId,
      'planTitle': planTitle,
      'amount': amount,
      'paymentDate': paymentDate,
      'paymentMode': paymentMode,
      'paymentChannel': paymentChannel,
      'transactionReference': transactionReference,
    });

    var raisedAmount;
    var progress;
    var status;

    final DocumentReference documentReference =
        await paymentCollection.add(data);
    var resId = documentReference.id;
    if (resId != null) {
      // Total Amount Raised
      raisedAmount = currentRaisedAmount + amount;
      // Compute progress
      progress = ((raisedAmount / targetAmount) * 100).ceil();
      // Set status
      status = "Running";
      if (raisedAmount != targetAmount) {
        status = "Running";
      } else {
        status = "Completed";
      }

      // Update record
      await DatabaseService()
          .updatePlanData(planId, raisedAmount, progress, status);
    }

    return raisedAmount;
  }

  // plan list from snapshot
  List<PlanModel> _planListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return PlanModel(
        id: doc.id,
        title: doc.data()['title'] ?? '',
        subTitle: doc.data()['subTitle'] ?? '',
        paymentType: doc.data()['paymentType'] ?? '',
        paymentDuration: doc.data()['paymentDuration'] ?? 1,
        targetAmount: doc.data()['targetAmount'] ?? 0,
        raisedAmount: doc.data()['raisedAmount'] ?? 0,
        proposedRepaymentAmount: doc.data()['proposedRepaymentAmount'] ?? 0,
        status: doc.data()['status'] ?? '',
        paymentDate: doc.data()['startDate'] ?? DateTime.now(),
        startDateTime: doc.data()['startDate'] ?? DateTime.now(),
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
    return planCollection
        .orderBy('startDateTime')
        .snapshots()
        .map(_planListFromSnapshot);
  }

  // Plan for a single user
  Stream<List<PlanModel>> userPlanData(userId) {
    return planCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map(_planListFromSnapshot);
  }

  // Search plan
  Stream<List<PlanModel>> searchPlanData(title) {
    return planCollection
        .where('title', isGreaterThan: title)
        .snapshots()
        .map(_planListFromSnapshot);
  }

  // get plan doc stream
  Stream<PlanModel> get getPlan {
    return planCollection.doc(reqId).snapshots().map(_planFromSnapshot);
  }

  // data from snapshot
  PlanModel _planFromSnapshot(DocumentSnapshot snapshot) {
    return PlanModel(
      id: reqId,
      userId: snapshot.data()['userId'],
      title: snapshot.data()['title'],
      subTitle: snapshot.data()['subTitle'],
      paymentType: snapshot.data()['paymentType'],
      paymentDuration: snapshot.data()['paymentDuration'],
      targetAmount: snapshot.data()['targetAmount'],
      raisedAmount: snapshot.data()['raisedAmount'],
      proposedRepaymentAmount: snapshot.data()['proposedRepaymentAmount'],
      status: snapshot.data()['status'],
      // paymentDate: snapshot.data()['paymentDate'],
      // startDateTime: snapshot.data()['startDateTime'],
      progress: snapshot.data()['progress'],
    );
  }

  // Payment Data
  // payment list from snapshot
  List<PaymentModel> _paymentListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return PaymentModel(
        id: doc.id,
        planId: doc.data()['planId'] ?? '',
        planTitle: doc.data()['planTitle'] ?? '',
        amount: doc.data()['amount'] ?? 0,
        paymentDate: doc.data()['startDate'] ?? DateTime.now(),
        paymentMode: doc.data()['paymentMode'] ?? '',
        paymentChannel: doc.data()['paymentChannel'] ?? '',
        transactionReference: doc.data()['transactionReference'] ?? '',
      );
    }).toList();
  }

  // data from snapshot
  PaymentModel _paymentFromSnapshot(DocumentSnapshot snapshot) {
    return PaymentModel(
      id: reqId,
      planId: snapshot.data()['planId'],
      planTitle: snapshot.data()['planTitle'],
      amount: snapshot.data()['amount'],
      paymentChannel: snapshot.data()['paymentChannel'],
      paymentMode: snapshot.data()['paymentMode'],
      transactionReference: snapshot.data()['transactionReference'],
      paymentDate: snapshot.data()['paymentDate'],
    );
  }

  // Get payments stream
  Stream<List<PaymentModel>> get payments {
    return paymentCollection
        .orderBy('paymentDate')
        .snapshots()
        .map(_paymentListFromSnapshot);
  }

  // Get payments for a particular plan
  Stream<List<PaymentModel>> planPaymentData(planId) {
    return paymentCollection
        .where('planId', isEqualTo: planId)
        .snapshots()
        .map(_paymentListFromSnapshot);
  }

  // get payment doc stream
  Stream<PaymentModel> get getPayment {
    return paymentCollection.doc(reqId).snapshots().map(_paymentFromSnapshot);
  }

  // get user doc stream
  Stream<ProfileModel> get userData {
    return profileCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}

// // Get Percentage
// var perc =         ((widget.plan.raisedAmount / widget.plan.targetAmount) * 100).ceil();
