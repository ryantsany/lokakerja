class Worker {
  int? _id;
  String? _name;
  String? _job;
  String? _workHour;
  String? _contractDuration;
  String? _salary;

  Worker(this._name, this._job, this._workHour, this._contractDuration, this._salary);

  static const String TABLE_WORKER = 'worker';
  static const String COLUMN_ID = 'id';
  static const String COLUMN_NAME = 'name';
  static const String COLUMN_JOB = 'job';
  static const String COLUMN_WORK_HOUR = 'work_hour';
  static const String COLUMN_CONTRACT_DURATION = 'contract_duration';
  static const String COLUMN_SALARY = 'salary';

  int get id => _id as int;
  String get name => _name as String;
  String get job => _job as String;
  String get workHour => _workHour as String;
  String get contractDuration => _contractDuration as String;
  String get salary => _salary as String;

  Worker.fromMap(Map<String, dynamic> map) {
    _id = map[COLUMN_ID] as int;
    _name = map[COLUMN_NAME] as String;
    _job = map[COLUMN_JOB] as String;
    _workHour = map[COLUMN_WORK_HOUR] as String;
    _contractDuration = map[COLUMN_CONTRACT_DURATION] as String;
    _salary = map[COLUMN_SALARY] as String;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      COLUMN_NAME: _name,
      COLUMN_JOB: _job,
      COLUMN_WORK_HOUR: _workHour,
      COLUMN_CONTRACT_DURATION: _contractDuration,
      COLUMN_SALARY: _salary,
    };
    if (_id != null) {
      map[COLUMN_ID] = _id;
    }
    return map;
  }
}