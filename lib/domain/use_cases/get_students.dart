import 'package:school_app/data/model/student_model.dart';
import 'package:school_app/data/repository/repository_impl.dart';

class GetStudents {
  GetStudents({required this.repositoryImpl});
  final RepositoryImpl repositoryImpl;
  Future<(List<StudentModel>?, String?)> call() async {
    var resp = await repositoryImpl.getStudents();
    return (resp.$1!, resp.$2!);
  }
}
