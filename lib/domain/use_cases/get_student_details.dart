import 'package:school_app/data/model/student_model.dart';
import 'package:school_app/data/repository/repository_impl.dart';

class GetStudentDetails {
  GetStudentDetails({required this.repositoryImpl});
  final RepositoryImpl repositoryImpl;
  Future<(StudentModel?, String?)> call(int id) async {
    var resp = await repositoryImpl.getStudentDetails(id);
    return (resp.$1, resp.$2);
  }
}
