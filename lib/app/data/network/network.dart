class ConnectToServer {
  static String baseUrlAndroid = 'http://10.0.2.2:9090/';
  static String baseUrlIos = 'http://localhost:9090/';
  static String signIn = '/auth/sign-in';
  static String listNotes = '/notes';
  static String createNote = '/post-note';
  static String deleteNote = '/delete/{id}';
  static String rewriteNote = '/edit-note/{id}';
}
