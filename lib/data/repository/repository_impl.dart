import 'package:school_app/data/data_source/remote_data_source.dart';
import 'package:school_app/data/model/classroom_model.dart';
import 'package:school_app/data/model/regn_model.dart';
import 'package:school_app/data/model/student_model.dart';
import 'package:school_app/data/model/subject_model.dart';
import 'package:school_app/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl({required this.remoteDataSource});
  final RemoteDataSourceImpl remoteDataSource;
  @override
  Future<(List<StudentModel>?, String?)> getStudents() async {
    try {
      var resp = await remoteDataSource.getStudentsList();
      return (resp.$1!, null);
    } catch (err) {
      print(" error :$err");

      return (null, 'error');
    }
  }

  @override
  Future<(List<SubjectModel>?, String?)> getSubjects() async {
    try {
      var resp = await remoteDataSource.getSubjectsList();
      return (resp.$1!, null);
    } catch (err) {
      return (null, 'error');
    }
  }

  @override
  Future<(List<ClassRoomModel>?, String?)> getClasses() async {
    try {
      var resp = await remoteDataSource.getClassRooms();
      return (resp.$1!, null);
    } catch (err) {
      return (null, 'error');
    }
  }

  @override
  Future<(List<RegnModel>?, String?)> getRegns() async {
    try {
      var resp = await remoteDataSource.getRegistrations();
      return (resp.$1!, null);
    } catch (err) {
      return (null, 'error');
    }
  }

  @override
  Future<(String?, String?)> submitRegns(int studId, int subjId) async {
    try {
      var resp = await remoteDataSource.submitRegn(studId, subjId);
      return (resp.$1!, null);
    } catch (err) {
      return (null, 'error');
    }
  }

  @override
  Future<(StudentModel?, String?)> getStudentDetails(int id) async {
    try {
      var resp = await remoteDataSource.getStudentDetails(id);
      return (resp.$1!, null);
    } catch (err) {
      return (null, 'error');
    }
  }

  @override
  Future<(SubjectModel?, String?)> getSubjectDetails(int id) async {
    try {
      var resp = await remoteDataSource.getSubjectDetails(id);
      return (resp.$1!, null);
    } catch (err) {
      return (null, 'error');
    }
  }

  @override
  Future<(String?, String?)> deleteRegn(int id) async {
    try {
      var resp = await remoteDataSource.deleteRegn(id);
      return (resp.$1!, null);
    } catch (err) {
      return (null, 'error');
    }
  }
}
