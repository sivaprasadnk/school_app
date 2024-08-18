import 'package:school_app/domain/entity/classroom.dart';
import 'package:school_app/domain/entity/student.dart';
import 'package:school_app/domain/entity/subject.dart';

class ClassroomData {
  Subject? subject;
  ClassRoom? classroom;
  Student? student;
  ClassroomData({
    required this.subject,
    required this.classroom,
    required this.student,
  });
}
