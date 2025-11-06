import 'package:dio/dio.dart';

import '../../features/shared/models/repo_model.dart';
import '../../features/shared/models/user_model.dart';
import '../utils/logger.dart';

class GithubService {
  late final Dio _dio;

  GithubService() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://api.github.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/vnd.github+json',
        'X-GitHub-Api-Version': '2022-11-28',
      },
    );

    _dio = Dio(options);

    /// ✅ Optional: Add interceptors for logging / debugging
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          Logger().w('➡️ Request: ${options.method} ${options.uri}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          Logger().i('✅ Response ${response.statusCode}: ${response.requestOptions.uri}');
          handler.next(response);
        },
        onError: (e, handler) {
          Logger().e('❌ Error: ${e.message}');
          handler.next(e);
        },
      ),
    );
  }

  /// ✅ Fetch GitHub user (used in Login Screen)
  Future<UserModel> fetchUser(String username) async {
    try {
      final response = await _dio.get('/users/$username');
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  /// ✅ Fetch repositories (used on Home Screen)
  Future<List<RepoModel>> fetchRepos(String username) async {
    try {
      final response = await _dio.get(
        '/users/$username/repos',
        queryParameters: {'per_page': 100},
      );

      return (response.data as List)
          .map((e) => RepoModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  /// ✅ Centralized error handler
  String _handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return 'Connection timeout. Check your internet.';
    }
    if (e.type == DioExceptionType.receiveTimeout) {
      return 'Server is taking too long to respond.';
    }

    if (e.response != null) {
      switch (e.response?.statusCode) {
        case 404:
          return 'User not found!';
        case 403:
          return 'API limit reached. Try again later.';
        default:
          return 'Error: ${e.response?.statusMessage}';
      }
    }

    return 'Unexpected error: ${e.message}';
  }
}
