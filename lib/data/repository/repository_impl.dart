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
      return (resp.$1!, null);
    } catch (err) {
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
}
