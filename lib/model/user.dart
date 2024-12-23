class User {
  int? _id;
  String? _username;
  String? _email;
  String? _password;
  String? _role;

  User(this._username, this._email, this._password, this._role);

  static const String TABLE_USER = 'user';
  static const String COLUMN_ID = 'id';
  static const String COLUMN_USERNAME = 'username';
  static const String COLUMN_EMAIL = 'email';
  static const String COLUMN_PASSWORD = 'password';
  static const String COLUMN_ROLE = 'role';

  int get id => _id as int;
  String get username => _username as String;
  String get email => _email as String;
  String get password => _password as String;
  String get role => _role as String;


  User.fromMap(Map<String, dynamic> map) {
    _id = map[COLUMN_ID] as int;
    _username = map[COLUMN_USERNAME] as String;
    _email = map[COLUMN_EMAIL] as String;
    _password = map[COLUMN_PASSWORD] as String;
    _role = map[COLUMN_ROLE] as String;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      COLUMN_USERNAME: _username,
      COLUMN_EMAIL: _email,
      COLUMN_PASSWORD: _password,
      COLUMN_ROLE: _role,
    };
    if (_id != null) {
      map[COLUMN_ID] = _id;
    }
    return map;
  }
}