import 'package:school_app/data/repository/repository_impl.dart';

class PostRegistrations {
  PostRegistrations({required this.repositoryImpl});
  final RepositoryImpl repositoryImpl;
  Future<(String?, String?)> call(int studId, int subjId) async {
    var resp = await repositoryImpl.submitRegns(studId, subjId);
    return (resp.$1, resp.$2);
  }
}
