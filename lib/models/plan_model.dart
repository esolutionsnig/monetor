class PlanModel {
  final String userId;
  final String title;
  final String subTitle;
  final String paymentType;
  final int paymentDuration;
  final int targetAmount;
  final int raisedAmount;
  final int proposedRepaymentAmount;
  final String status;
  final DateTime paymentDate;
  final int progress;

  PlanModel({
    this.userId,
    this.title,
    this.subTitle,
    this.paymentType,
    this.paymentDuration,
    this.targetAmount,
    this.raisedAmount,
    this.proposedRepaymentAmount,
    this.status,
    this.paymentDate,
    this.progress,
  });
}
