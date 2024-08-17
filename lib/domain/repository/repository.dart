import 'package:school_app/data/model/classroom_model.dart';
import 'package:school_app/data/model/student_model.dart';
import 'package:school_app/data/model/subject_model.dart';

abstract class Repository {
  Future<(List<StudentModel>?, String?)> getStudents();
  Future<(List<SubjectModel>?, String?)> getSubjects();
  Future<(List<ClassRoomModel>?, String?)> getClasses();
}
