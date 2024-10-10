import '../../../core/models/app_response.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/shared_preference_service.dart';
import '../models/user.dart';

abstract class AuthenticationProvider {
  final IS_AUTHENTICATED = 'is_authenticated';

  bool isAuthenticated();
  Future<AppResponse<User>> login(String username, String password);
  Future<AppResponse<void>> logout();
}

class AuthenticationDummyProvider extends AuthenticationProvider {
  final SharedPreferenceService sharedPreferenceService;

  AuthenticationDummyProvider({required this.sharedPreferenceService});

  @override
  bool isAuthenticated() {
    return sharedPreferenceService.getValue<bool>(IS_AUTHENTICATED) ?? false;
  }

  @override
  Future<AppResponse<User>> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 3));
    if (username == 'admin' && password == 'password') {
      sharedPreferenceService.setValue(IS_AUTHENTICATED, true);
      return AppResponse(
        success: true,
        data: User(
          username: username,
          name: "Admin",
        ),
      );
    } else {
      sharedPreferenceService.setValue(IS_AUTHENTICATED, false);
      return AppResponse(
        success: false,
        message: "Username or Password invalid !!!",
      );
    }
  }

  @override
  Future<AppResponse<void>> logout() async {
    await Future.delayed(const Duration(seconds: 3));
    return AppResponse(success: true);
  }
}

class AuthenticationApiProvider extends AuthenticationProvider {
  final ApiService apiService;

  AuthenticationApiProvider({required this.apiService});

  @override
  bool isAuthenticated() {
    // TODO: implement isAuthenticated
    throw UnimplementedError();
  }

  @override
  Future<AppResponse<User>> login(String username, String password) async {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<AppResponse<void>> logout() async {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
