import 'package:school_app/domain/entity/subject.dart';

class SubjectModel extends Subject {
  SubjectModel({
    required super.credits,
    required super.id,
    required super.name,
    required super.teacher,
  });
  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      credits: json['credits'],
      name: json['name'],
      id: json['id'],
      teacher: json['teacher'],
    );
  }
}
