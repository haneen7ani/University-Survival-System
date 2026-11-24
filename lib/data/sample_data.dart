/// Sample data used until the backend is connected.
/// Everything here will later come from the API (per university, faculty,
/// program and level).

class Course {
  const Course({
    required this.code,
    required this.name,
    required this.credits,
    required this.type,
    required this.prerequisite,
  });

  final String code;
  final String name;
  final int credits;
  final String type;

  /// Empty string means no prerequisite.
  final String prerequisite;

  String get meta {
    final pre = prerequisite.isEmpty ? 'No prerequisites' : 'Prerequisite: $prerequisite';
    return '$credits credits · $type · $pre';
  }
}

const sampleCourses = <Course>[
  Course(code: 'CS201', name: 'Data Structures', credits: 3, type: 'Core', prerequisite: 'CS101'),
  Course(code: 'CS215', name: 'Database Systems', credits: 3, type: 'Core', prerequisite: 'CS101'),
  Course(code: 'MA210', name: 'Discrete Mathematics', credits: 3, type: 'Core', prerequisite: ''),
  Course(code: 'CS230', name: 'Computer Organization', credits: 3, type: 'Core', prerequisite: 'CS110'),
  Course(code: 'ST201', name: 'Probability & Statistics', credits: 3, type: 'Core', prerequisite: 'MA101'),
  Course(code: 'HU204', name: 'Technical Writing', credits: 2, type: 'University requirement', prerequisite: ''),
];

/// 4.0 scale. Each university can override this table later.
const gradePoints = <String, double>{
  'A+': 4.0,
  'A': 4.0,
  'A-': 3.7,
  'B+': 3.3,
  'B': 3.0,
  'B-': 2.7,
  'C+': 2.3,
  'C': 2.0,
  'C-': 1.7,
  'D+': 1.3,
  'D': 1.0,
  'F': 0.0,
};

/// Grades pre-filled in the GPA calculator demo, by course code.
const sampleGrades = <String, String>{
  'CS201': 'A',
  'CS215': 'A-',
  'MA210': 'B+',
  'CS230': 'B',
  'ST201': 'A',
  'HU204': 'A-',
};

/// Previous semesters, used for the cumulative GPA.
const previousCredits = 34;
const previousGpa = 3.32;

const universities = <String>['Example University'];
const faculties = <String>['Faculty of Computing', 'Faculty of Engineering', 'Faculty of Commerce'];
const programs = <String>['Computer Science', 'Information Systems', 'Software Engineering'];
const levels = <String>[
  'Level 1 · Semester 1',
  'Level 1 · Semester 2',
  'Level 2 · Semester 1',
  'Level 2 · Semester 2',
  'Level 3 · Semester 1',
  'Level 3 · Semester 2',
  'Level 4 · Semester 1',
  'Level 4 · Semester 2',
];
