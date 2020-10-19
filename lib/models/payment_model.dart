class PaymentModel {
  final String id;
  final String planId;
  final String planTitle;
  final String paymentMode;
  final String paymentChannel;
  final String transactionReference;
  final int amount;
  final DateTime paymentDate;

  PaymentModel({
    this.id,
    this.planId,
    this.planTitle,
    this.amount,
    this.paymentDate,
    this.paymentMode,
    this.paymentChannel,
    this.transactionReference,
  });
}
