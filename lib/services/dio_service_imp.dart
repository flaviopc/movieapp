import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:movieapp/services/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZTcxODg1ODM4NTI3NWZiNTQxYTZhZWI0YTRmMDVlMCIsInN1YiI6IjYxZTgxMzEyZWEzN2UwMDBkY2I1ZTJmMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QTrPPc4zZz3wqPqnxjTtd8czHnSqj4Z-kozeA0CxOT4'
        },
      ),
    );
  }
}
