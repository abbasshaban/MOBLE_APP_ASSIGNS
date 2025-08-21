
import 'dart:io';

void main() {
  print("Student GPA Calculator");
  print("------------------------");

  // number of courses
  stdout.write("Enter the number of courses: ");
  int numCourses = int.parse(stdin.readLineSync()!);

  double totalGradePoints = 0;
  int totalCredits = 0;

  
  for (int i = 0; i < numCourses; i++) {
    stdout.write("Enter grade for course ${i + 1} (A, B, C, D, F): ");
    String grade = stdin.readLineSync()!.toUpperCase();
    stdout.write("Enter credits for course ${i + 1}: ");
    int credits = int.parse(stdin.readLineSync()!);

   
    double gradePoints = getGradePoints(grade);
    totalGradePoints += gradePoints * credits;
    totalCredits += credits;

    print("Grade Points for Course ${i + 1}: $gradePoints");
  }

  // Calculate GPA
  double gpa = totalGradePoints / totalCredits;
  print("\nTotal Grade Points: $totalGradePoints");
  print("Total Credits: $totalCredits");
  print("GPA: ${gpa.toStringAsFixed(2)}");
}


double getGradePoints(String grade) {
  switch (grade) {
    case 'A':
      return 4.0;
    case 'B':
      return 3.0;
    case 'C':
      return 2.0;
    case 'D':
      return 1.0;
    case 'F':
      return 0.0;
    default:
      print("Invalid grade. Assuming 0.0 grade points.");
      return 0.0;
  }
}

