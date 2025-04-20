import 'package:collection/collection.dart';
import 'package:example/domain/models/user_entity.dart';
import 'package:example/presentation/providers/api_response/authentication_provider.dart';
import 'package:fake_store_api_package/methods/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infraestructure/helppers/users/users_mapper.dart';

class UserApiResponse {
  final bool isLoading;
  final String? errorMessage;
  final User? user;

  UserApiResponse({this.user, this.isLoading = false, this.errorMessage});

  UserApiResponse copyWith({
    bool? isLoading,
    String? errorMessage,
    User? user,
  }) {
    return UserApiResponse(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }
}

class UserNotifier extends StateNotifier<UserApiResponse> {
  final Ref ref;
  UserNotifier(this.ref) : super(UserApiResponse());

  final ApiServices _apiServices = ApiServices();

  Future<void> fetchAllUsers() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final userResult = await _apiServices.fetchUsers();
    state = userResult.fold(
      (failure) =>
          state.copyWith(isLoading: false, errorMessage: failure.message),
      (users) {
        final userAuthenticated = ref.watch(authenticationProvider);
        final loggedInUser = users.firstWhereOrNull(
          (user) =>
              user.username == userAuthenticated.username &&
              user.password == userAuthenticated.password,
        );
        return state.copyWith(
          isLoading: false,
          errorMessage: null,
          user: UsersMapper.userFakeStoreToUser(loggedInUser!),
        );
      },
    );
  }

  void logOutUser() {
    state = state.copyWith(user: null);
  }
}

final userInfoProvider = StateNotifierProvider<UserNotifier, UserApiResponse>((
  ref,
) {
  return UserNotifier(ref);
});
