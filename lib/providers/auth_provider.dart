import 'package:app_dipendente_merendels/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;

  AuthState({this.user, this.isLoading = false, this.error});

  AuthState copyWith({User? user, bool? isLoading, String? error}) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  bool get isAuthenticated => user != null;
}

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider() : super(AuthState());
}

final authProvider = StateNotifierProvider<AuthProvider, AuthState>(
  (ref) => AuthProvider(),
);
