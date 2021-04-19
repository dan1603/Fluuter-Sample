abstract class ApiResponse {
  bool isSuccessful;
  String error;
  bool isSessionExpired;

  ApiResponse(this.isSuccessful, {this.error, this.isSessionExpired});
}