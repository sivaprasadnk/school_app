import 'package:school_app/domain/entity/regn.dart';

class RegnModel extends Regn {
  RegnModel({
    required super.id,
    required super.student,
    required super.subject,
  });

  factory RegnModel.fromJson(Map<String, dynamic> json) {
    return RegnModel(
      id: json['id'],
      student: json['student'],
      subject: json['subject'],
    );
  }
}
