import 'package:fake_store_api_package/domain/models.dart';
import 'package:fake_store_api_package/methods/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserApiResponse {
  final bool isLoading;
  final String? errorMessage;
  final List<User> users;

  UserApiResponse({
    this.isLoading = false,
    this.errorMessage,
    this.users = const [],
  });

  UserApiResponse copyWith({
    bool? isLoading,
    String? errorMessage,
    List<User>? users,
  }) {
    return UserApiResponse(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      users: users ?? this.users,
    );
  }
}

class UserNotifier extends StateNotifier<UserApiResponse> {
  UserNotifier() : super(UserApiResponse());

  final ApiServices _apiServices = ApiServices();

  Future<void> fetchAllUsers() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final userResult = await _apiServices.fetchUsers();
    state = userResult.fold(
      (failure) =>
          state.copyWith(isLoading: false, errorMessage: failure.message),
      (users) => state.copyWith(isLoading: false, users: users),
    );
  }
}

final userInfoProvider = StateNotifierProvider<UserNotifier, UserApiResponse>((
  ref,
) {
  return UserNotifier();
});
