import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:school_app/data/data_source/remote_data_source.dart';
import 'package:school_app/data/model/student_model.dart';
import 'package:school_app/data/model/subject_model.dart';
import 'package:school_app/data/repository/repository_impl.dart';

class HomeScreenNotifier extends StateNotifier<bool> {
  HomeScreenNotifier() : super(false);

  void toggleView() {
    state = !state;
  }

  submitRegn(int studId, int subjId) async {
    RemoteDataSourceImpl dataSource =
        RemoteDataSourceImpl(client: http.Client());
    RepositoryImpl repo = RepositoryImpl(remoteDataSource: dataSource);
    await repo.submitRegns(studId, subjId);
  }

  Future<(StudentModel?, String?)> getStudentDetails(int studId) async {
    RemoteDataSourceImpl dataSource =
        RemoteDataSourceImpl(client: http.Client());
    RepositoryImpl repo = RepositoryImpl(remoteDataSource: dataSource);
    return await repo.getStudentDetails(studId);
  }

  Future<(SubjectModel?, String?)> getSubjectDetails(int id) async {
    RemoteDataSourceImpl dataSource =
        RemoteDataSourceImpl(client: http.Client());
    RepositoryImpl repo = RepositoryImpl(remoteDataSource: dataSource);
    return await repo.getSubjectDetails(id);
  }

  Future<(String?, String?)> deleteRegn(int id) async {
    RemoteDataSourceImpl dataSource =
        RemoteDataSourceImpl(client: http.Client());
    RepositoryImpl repo = RepositoryImpl(remoteDataSource: dataSource);
    return await repo.deleteRegn(id);
  }
}
