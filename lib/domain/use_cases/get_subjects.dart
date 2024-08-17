import 'package:school_app/data/model/subject_model.dart';
import 'package:school_app/data/repository/repository_impl.dart';

class GetSubjects {
  GetSubjects({required this.repositoryImpl});
  final RepositoryImpl repositoryImpl;
  Future<(List<SubjectModel>?, String?)> call() async {
    var resp = await repositoryImpl.getSubjects();
    return (resp.$1, resp.$2);
  }
}
