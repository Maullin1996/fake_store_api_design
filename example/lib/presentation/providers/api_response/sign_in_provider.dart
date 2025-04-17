import 'package:collection/collection.dart';
import 'package:example/presentation/providers/api_response/user_provider.dart';
import 'package:fake_store_api_package/domain/models.dart';
import 'package:fake_store_api_package/methods/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInApiResponse {
  final bool isLoading;
  final String? errorMessage;
  final String? token;
  final User? userInfo;

  SignInApiResponse({
    this.isLoading = false,
    this.errorMessage,
    this.token,
    this.userInfo,
  });

  SignInApiResponse copyWith({
    bool? isLoading,
    String? errorMessage,
    String? token,
    User? userInfo,
  }) {
    return SignInApiResponse(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      token: token ?? this.token,
      userInfo: userInfo ?? this.userInfo,
    );
  }
}

class SignInNotifier extends StateNotifier<SignInApiResponse> {
  final Ref ref;
  SignInNotifier(this.ref) : super(SignInApiResponse());

  final ApiServices _apiServices = ApiServices();

  Future<void> fetchAuthentication(String username, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final signInResult = await _apiServices.fetchAuth(
      username: username,
      password: password,
    );
    state = signInResult.fold(
      (failure) =>
          state.copyWith(isLoading: false, errorMessage: failure.message),
      (token) {
        final usersState = ref.read(userInfoProvider);
        if (!usersState.isLoading && usersState.errorMessage == null) {
          final loggedInUser = usersState.users.firstWhereOrNull(
            (user) => user.username == username && user.password == password,
          );
          return state.copyWith(
            token: token.token,
            userInfo: loggedInUser,
            isLoading: false,
            errorMessage: null,
          );
        } else {
          return state.copyWith(
            token: token.token,
            isLoading: false,
            errorMessage:
                usersState.errorMessage ??
                'Error al obtener la información del usuario.',
          );
        }
      },
    );
  }
}

final authenticationProvider =
    StateNotifierProvider<SignInNotifier, SignInApiResponse>((ref) {
      return SignInNotifier(ref); // Pasar el Ref al constructor
    });
