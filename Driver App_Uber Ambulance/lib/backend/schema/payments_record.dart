import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'payments_record.g.dart';

abstract class PaymentsRecord
    implements Built<PaymentsRecord, PaymentsRecordBuilder> {
  static Serializer<PaymentsRecord> get serializer =>
      _$paymentsRecordSerializer;

  @nullable
  DocumentReference get paymentUser;

  @nullable
  DocumentReference get paymentProduct;

  @nullable
  DateTime get paymentDate;

  @nullable
  String get paymentAmount;

  @nullable
  String get paymentStatus;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PaymentsRecordBuilder builder) => builder
    ..paymentAmount = ''
    ..paymentStatus = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payments');

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PaymentsRecord._();
  factory PaymentsRecord([void Function(PaymentsRecordBuilder) updates]) =
      _$PaymentsRecord;

  static PaymentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPaymentsRecordData({
  DocumentReference paymentUser,
  DocumentReference paymentProduct,
  DateTime paymentDate,
  String paymentAmount,
  String paymentStatus,
}) =>
    serializers.toFirestore(
        PaymentsRecord.serializer,
        PaymentsRecord((p) => p
          ..paymentUser = paymentUser
          ..paymentProduct = paymentProduct
          ..paymentDate = paymentDate
          ..paymentAmount = paymentAmount
          ..paymentStatus = paymentStatus));
