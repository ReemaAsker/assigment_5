class Student {
  static int uid = 0;
  final int id;
  String _name;
  double _grade;
  String? _email;
  String? _address;
  String? _phone;

  Student(this._name, this._grade) : this.id = ++uid;

  String get name => _name;
  double get grade => _grade;
  String get email => _email ?? "";
  String get address => _address ?? "";
  String get phone => _phone ?? "";

  set name(String name) => _name = name;
  set grade(double grade) =>
      _grade = (grade >= 0 && grade <= 100) ? grade : _grade;

  set email(String email) => _email = email;
  set address(String address) => _address = address;
  set phone(String phone) => _phone = phone;

  @override
  String toString() {
    return "Name:${this.name} | ID : ${this.id}  | grade : ${this.grade}  | email : ${this.email} | address: ${this.address} | phone : ${this.phone}\n";
  }

  bool isPass() => this._grade >= 60;
}

void main() {
  List<Student> students = [];
  Student std1 = Student("Reema Asker", 85);
  Student std2 = Student("Omar Asker", 70);
  Student std3 = Student("Salem Saleh", 59);
  Student std4 = Student("Ahmed Asker", 99);
  students.add(std1);
  students.add(std2);
  students.add(std3);
  students.add(std4);

  std1.email = "reema@.com";
  std1.phone = "052369854";
  std1.address = "Gaza";

  std2.email = "omar@.com";
  std2.phone = "056243589";
  std2.address = "West Bank";

  std3.email = "salem@.com";
  std3.phone = "059874123";
  std3.address = "Jerusalem";

  std4.email = "ahmed@.com";
  std4.phone = "056632147";
  std4.address = "Jenin";

  print(students);
  print(
    " ******************* Students with grade more than 70 ******************* ",
  );
  print(search_student_with_grade(students, 70, true));
  std1.address = "Egypt";
  std2.phone = "0123456789";

  print(
    " ******************* Students after changing an optional property. ******************* ",
  );
  print(students);

  print(
    " ******************* Students descending order based on their grades ******************* ",
  );
  /*
 this(num).compareTo(other(num)) :
Returns a negative number if this is less than other, zero if they are equal, and a positive number if this is greater than other.
 in descending order >> i want the student with the highest grade to be first ( this grade - other grade  > 0)

  */
  students.sort(
    (studnet1, studnet2) => studnet2.grade.compareTo(studnet1.grade),
  );
  print(students);
  print(" ******************* Students who passed ******************* ");
  allStudents_with_pass(students);
}

List<Student> search_student_with_grade(
  List<Student> students,
  double grade,
  bool isGreaterThan,
) {
  List<Student> allStudents_afterSearch = [];
  if (isGreaterThan) {
    for (Student student in students) {
      if (student.grade >= grade) allStudents_afterSearch.add(student);
    }
  } else {
    for (Student student in students)
      if (student.grade <= grade) allStudents_afterSearch.add(student);
  }
  return allStudents_afterSearch;
}

void allStudents_with_pass(List<Student> students) {
  for (Student student in students) {
    if (student.isPass()) print(student);
  }
}
