import 'package:flutter/foundation.dart';

// ── Enums ────────────────────────────────────────────────────────
enum UserRole { buyer, seller }

enum SignupStatus { idle, loading, success, failure }

// ── ViewModel ────────────────────────────────────────────────────
class SignupViewModel extends ChangeNotifier {
  // ── Form Controllers ─────────────────────────────────────────
  // Declared here so the View can bind them without owning them.
  // Dispose is handled below.
  // ignore: prefer_final_fields — mutated externally via binding
  // (If you switch to Riverpod, move controllers into a Provider.)

  // ── State ────────────────────────────────────────────────────
  UserRole _role = UserRole.buyer;
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _agreedToTerms = false;
  SignupStatus _status = SignupStatus.idle;
  String? _errorMessage;

  // ── Getters (View reads these) ────────────────────────────────
  UserRole get role => _role;
  bool get obscurePassword => _obscurePassword;
  bool get obscureConfirm => _obscureConfirm;
  bool get agreedToTerms => _agreedToTerms;
  SignupStatus get status => _status;
  String? get errorMessage => _errorMessage;

  // ── Intents (View calls these) ────────────────────────────────

  void onRoleChanged(UserRole role) {
    if (_role == role) return;
    _role = role;
    notifyListeners();
  }

  void onTogglePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void onToggleConfirm() {
    _obscureConfirm = !_obscureConfirm;
    notifyListeners();
  }

  void onTermsChanged(bool? value) {
    _agreedToTerms = value ?? false;
    notifyListeners();
  }

  // ── Private Helpers ──────────────────────────────────────────

  // ── Validators (pure functions — easy to unit-test) ──────────

  static String? validateFullName(String? v) {
    if (v == null || v.trim().isEmpty) return 'Full name is required.';
    if (v.trim().length < 2) return 'Name is too short.';
    return null;
  }

  static String? validateEmail(String? v) {
    if (v == null || v.isEmpty) return 'Email is required.';
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(v)) return 'Enter a valid email.';
    return null;
  }

  static String? validatePhone(String? v) {
    if (v == null || v.isEmpty) return 'Phone number is required.';
    if (v.trim().length < 7) return 'Phone number is too short.';
    return null;
  }

  static String? validatePassword(String? v) {
    if (v == null || v.isEmpty) return 'Password is required.';
    if (v.length < 8) return 'At least 8 characters required.';
    return null;
  }

  String? validateConfirm(String? v, String password) {
    if (v == null || v.isEmpty) return 'Please confirm your password.';
    if (v != password) return 'Passwords do not match.';
    return null;
  }

  @override
  void dispose() {
    // Dispose TextEditingControllers here if you move them into the ViewModel.
    super.dispose();
  }
}
