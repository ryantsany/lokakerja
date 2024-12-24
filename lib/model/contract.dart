class Contract {
  int? _user_id;
  int? _id;
  String? _job;
  String? _jobDuration;
  String? _contractDuration;
  String? _salary;

  Contract(this._user_id,this._job, this._jobDuration, this._contractDuration, this._salary);

  static const String TABLE_CONTRACT = 'contract';
  static const String COLUMN_ID = 'id';
  static const String COLUMN_JOB = 'job';
  static const String COLUMN_JOB_DURATION = 'job_duration';
  static const String COLUMN_CONTRACT_DURATION = 'contract_duration';
  static const String COLUMN_SALARY = 'salary';
  static const String COLUMN_USER_ID = 'user_id';

  int get id => _id as int;
  int get userId => _user_id as int;
  String get job => _job as String;
  String get jobDuration => _jobDuration as String;
  String get contractDuration => _contractDuration as String;
  String get salary => _salary as String;

  Contract.fromMap(Map<String, dynamic> map) {
    _id = map[COLUMN_ID] as int?;
     _user_id = map[COLUMN_USER_ID] as int;
    _job = map[COLUMN_JOB] as String?;
    _jobDuration = map[COLUMN_JOB_DURATION] as String?;
    _contractDuration = map[COLUMN_CONTRACT_DURATION] as String?;
    _salary = map[COLUMN_SALARY] as String?;
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      COLUMN_JOB: _job,
      COLUMN_USER_ID: _user_id,
      COLUMN_JOB_DURATION: _jobDuration,
      COLUMN_CONTRACT_DURATION: _contractDuration,
      COLUMN_SALARY: _salary,
    };
    if (_id != null) {
      map[COLUMN_ID] = _id;
    }
    return map;
  }
}