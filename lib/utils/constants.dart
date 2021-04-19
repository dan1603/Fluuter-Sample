class Constant {
  static const String prefAuthenticated = "isLoggedIn";
  static const String prefUserId = "prefUserId";
  static const String prefUsername = "prefUsername";
  static const String prefPassword = "prefPassword";
}

class Strings {
  // Splash screen
  static const String splashText = "Splash Demo";
  // LogIn screen
  static const String headerLogin = "Log In to app";
  static const String fieldUsername = "Username";
  static const String fieldPassword = "Password";
  static const String actionLogin = "Log In";
  static const String actionSignUp = "Sign Up";
  static const String hintNoAccount = "Don\'t have an Account? ";
  // Home bottom tabs
  static const String tabHome = "Home";
  static const String tabWallet = "Wallet";
  static const String tabProfile = "Profile";
}

class Assets {
  static const String logo = "images/logo.png";
}

class Api {
  static const String baseUrl = "https://dev.moroz.cc";
  static const String login = baseUrl + "/fin-api/api.php/login";

  static String getWallets(int userId) {
    return baseUrl +
        "/fin-api/api.php/records/wallet?filter=user_id,eq,$userId&join=currency";
  }

  static const int codeSuccess = 200;
  static const int codeSessionExpired = 401;
}

class Error {
  static const String errorLogin = "LogIn failed!";

  static const String validationUsername = "Username is not valid";
  static const String validationPassword = "Password is not valid";
}