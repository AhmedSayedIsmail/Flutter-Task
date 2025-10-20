enum PaymentMethods {
  installment('تقسيط'),
  cash('كاش'),
  visa('فيزا');

  final String value;
  const PaymentMethods(this.value);
  @override
  String toString() => value;
}
