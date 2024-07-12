class ApiPath {
  //baseurl
  static const String baseUrl = 'https://lequydon.hvg.edu.vn/api';
  //
  static const String refreshToken = '$baseUrl/refresh_token.php';
  static const String login = '$baseUrl/login';
  static const String home = '$baseUrl/home';
  static const String changePass = '$baseUrl/change_password';
  static const String subject = '$baseUrl/subject';
  static const String detailSubject = '$baseUrl/detail_subject';
  static const String lesson = '$baseUrl/chi_tiet_buoi_hoc';
  static const String calender = '$baseUrl/lich_hoc';
  static const String oneSignal =
      'https://api.onesignal.com/notifications?app_id=1f643336-9d73-4c65-ac00-38d499b8c462';
}
