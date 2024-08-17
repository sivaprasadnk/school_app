import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:school_app/data/data_source/remote_data_source.dart';
import 'package:school_app/data/model/classroom_model.dart';
import 'package:school_app/data/model/student_model.dart';
import 'package:school_app/data/model/subject_model.dart';
import 'package:school_app/data/repository/repository_impl.dart';
import 'package:school_app/domain/use_cases/get_classes.dart';
import 'package:school_app/domain/use_cases/get_students.dart';
import 'package:school_app/domain/use_cases/get_subjects.dart';
import 'package:school_app/presentation/home_screen_notifier.dart';

final homeScreenNotifierProvider =
    StateNotifierProvider<HomeScreenNotifier, bool>(
        (ref) => HomeScreenNotifier());

final getStudentsProvider =
    FutureProvider<(List<StudentModel>?, String?)>((ref) async {
  RemoteDataSourceImpl dataSource = RemoteDataSourceImpl(client: http.Client());
  RepositoryImpl repo = RepositoryImpl(remoteDataSource: dataSource);
  return GetStudents(repositoryImpl: repo).call();
});

final getSubjectsProvider =
    FutureProvider<(List<SubjectModel>?, String?)>((ref) async {
  RemoteDataSourceImpl dataSource = RemoteDataSourceImpl(client: http.Client());
  RepositoryImpl repo = RepositoryImpl(remoteDataSource: dataSource);
  return GetSubjects(repositoryImpl: repo).call();
});

final getClassProvider =
    FutureProvider<(List<ClassRoomModel>?, String?)>((ref) async {
  RemoteDataSourceImpl dataSource = RemoteDataSourceImpl(client: http.Client());
  RepositoryImpl repo = RepositoryImpl(remoteDataSource: dataSource);
  return GetClasses(repositoryImpl: repo).call();
});
