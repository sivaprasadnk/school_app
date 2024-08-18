import 'package:school_app/data/model/subject_model.dart';
import 'package:school_app/data/repository/repository_impl.dart';

class GetSubjectDetails {
  GetSubjectDetails({required this.repositoryImpl});
  final RepositoryImpl repositoryImpl;
  Future<(SubjectModel?, String?)> call(int id) async {
    var resp = await repositoryImpl.getSubjectDetails(id);
    return (resp.$1, resp.$2);
  }
}
