import 'package:school_app/data/model/classroom_model.dart';
import 'package:school_app/data/model/regn_model.dart';
import 'package:school_app/data/model/student_model.dart';
import 'package:school_app/data/model/subject_model.dart';

abstract class Repository {
  Future<(List<StudentModel>?, String?)> getStudents();
  Future<(StudentModel?, String?)> getStudentDetails(int id);
  Future<(List<SubjectModel>?, String?)> getSubjects();
  Future<(SubjectModel?, String?)> getSubjectDetails(int id);
  Future<(List<ClassRoomModel>?, String?)> getClasses();
  Future<(List<RegnModel>?, String?)> getRegns();
  Future<(String?, String?)> submitRegns(int studId, int subjId);
  Future<(String?, String?)> deleteRegn(int id);
}
