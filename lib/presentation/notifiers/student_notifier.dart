import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/domain/entity/student.dart';

class StudentNotifier extends StateNotifier<List<Student>> {
  StudentNotifier() : super([]);

  // getStudentList(){
  //   FutureProvider.autoDispose<(List<SubjectModel>?, String?)>((ref) async {
  // RemoteDataSourceImpl dataSource = RemoteDataSourceImpl(client: http.Client());
  // RepositoryImpl repo = RepositoryImpl(remoteDataSource: dataSource);
  // }
}
