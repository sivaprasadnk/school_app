import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:school_app/data/data_source/remote_data_source.dart';
import 'package:school_app/data/repository/repository_impl.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => RemoteDataSourceImpl(client: locator()));
  locator
      .registerLazySingleton(() => RepositoryImpl(remoteDataSource: locator()));
}
