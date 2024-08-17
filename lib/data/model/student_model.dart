import 'package:school_app/domain/entity/student.dart';

class StudentModel extends Student {
  StudentModel({
    required super.age,
    required super.name,
    required super.id,
    required super.email,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      age: json['age'],
      name: json['name'],
      id: json['id'],
      email: json['email'],
    );
  }
}
