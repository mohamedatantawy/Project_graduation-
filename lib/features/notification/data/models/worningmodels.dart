class Worningmodels {
  int? id;
  int? studentId;
  int? academicScheduleId;
  String? sessionType;
  int? warningNumber;
  String? warningContent;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? course_name;
/*        {
                "id": 7,
                "student_id": 11,
                "academic_schedule_id": 2,
                "session_type": "lecture",
                "warning_number": 1,
                "warning_content": "This is your first warning for 3 absences in networks lectures",
                "created_at": "2025-04-14T22:21:15.000000Z",
                "updated_at": "2025-04-14T22:21:15.000000Z",
                "course_name": "networks"
            }, */
  Worningmodels({
    this.course_name,
    this.id,
    this.studentId,
    this.academicScheduleId,
    this.sessionType,
    this.warningNumber,
    this.warningContent,
    this.createdAt,
    this.updatedAt,
  });

  factory Worningmodels.fromJson(Map<String, dynamic> json) => Worningmodels(
        id: json['id'] as int?,
        studentId: json['student_id'] as int?,
        academicScheduleId: json['academic_schedule_id'] as int?,
        sessionType: json['session_type'] as String?,
        warningNumber: json['warning_number'] as int?,
        warningContent: json['warning_content'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        course_name: json['course_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'student_id': studentId,
        'academic_schedule_id': academicScheduleId,
        'session_type': sessionType,
        'warning_number': warningNumber,
        'warning_content': warningContent,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'course_name': course_name,
      };
}
