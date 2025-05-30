String? kEmailValidator(String? email) {
  final RegExp regExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  if (email == null || email.trim().isEmpty) {
    return 'Please enter an email address';
  } else if (!regExp.hasMatch(email.trim())) {
    return 'Enter a valid email address';
  }
  return null;
}

String? kPasswordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Please enter your password';
  } else if (password.length < 6) {
    return 'Password must be at least 6 characters long.';
  } else {
    return null;
  }
}
