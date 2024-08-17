import 'package:flutter/material.dart';
import 'package:school_app/data/data_source/remote_data_source.dart';
import 'package:school_app/data/model/classroom_model.dart';
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
      debugPrint("getStudents @ repo_impl ${resp.$1!.length}");

      return (resp.$1!, null);
    } catch (err) {
      debugPrint("getStudents error @ repo_impl");

      return (null, 'error @');
    }
  }

  @override
  Future<(List<SubjectModel>?, String?)> getSubjects() async {
    try {
      var resp = await remoteDataSource.getSubjectsList();
      debugPrint("getSubjects @ repo_impl ${resp.$1!.length}");

      return (resp.$1!, null);
    } catch (err) {
      debugPrint("getSubjects error @ repo_impl");

      return (null, 'error @');
    }
  }

  @override
  Future<(List<ClassRoomModel>?, String?)> getClasses() async {
    try {
      var resp = await remoteDataSource.getClassRooms();
      debugPrint("getClasses @ repo_impl ${resp.$1!.length}");

      return (resp.$1!, null);
    } catch (err) {
      debugPrint("getClasses error @ repo_impl");

      return (null, 'error @');
    }
  }
}
