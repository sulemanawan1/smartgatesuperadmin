class Api {
  static const String imageBaseUrl = 'https://www.smartgate.pk/storage/';
  static const String baseUrl = 'https://www.smartgate.pk/api/';
  // static const String baseUrl = 'http://192.168.100.7:8000/api/';
  // static String imageBaseUrl = 'http://192.168.100.7:8000/storage/';
  static const String login = baseUrl + "login";
  static const String resetpassword = baseUrl + "resetpassword";
  static const String signup = baseUrl + "registeruser";
  static const String add_society = baseUrl + "society/addsociety";
  static const String view_all_societies = baseUrl + "society/viewallsocieties";
  static const String view_society = baseUrl + "society/viewsociety";
  static const String delete_society = baseUrl + "society/deletesociety";
  static const String update_society = baseUrl + "society/updatesociety";
  static const String search_society = baseUrl + "society/searchsociety";
  static const String filter_societybuilding =
      baseUrl + "society/filtersocietybuilding";
  static const String viewsubadmin = baseUrl + "viewsubadmin";
  static const String registersubadmin = baseUrl + "registersubadmin";
  static const String deletesubadmin = baseUrl + "deletesubadmin";
  static const String updatesubadmin = baseUrl + "updatesubadmin";
  static const String viewallresidents = baseUrl + "viewresidents";
  static const String view_gatekeepers = baseUrl + "viewgatekeepers";
  static const String viewallnotices = baseUrl + "viewallnotices";
  static const String viewallevents = baseUrl + "event/events";
  static const String fcmtokenrefresh = baseUrl + "fcmtokenrefresh";
}
