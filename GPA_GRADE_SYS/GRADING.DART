
import 'dart:io';

void main() {
  print("Student Grading System");
  print("---------------------");

  print("Enter student's name:");
  String? name = stdin.readLineSync();

  print("Enter student's score (0-100):");
  String? scoreInput = stdin.readLineSync();
  double? score = double.tryParse(scoreInput ?? '');

  if (score != null && score >= 0 && score <= 100) {
    String grade = calculateGrade(score);
    print("$name's grade is: $grade");
  } else {
    print("Invalid score. Please enter a score between 0 and 100.");
  }
}

String calculateGrade(double score) {
  if (score >= 90) {
    return 'A';
  } else if (score >= 80) {
    return 'B';
  } else if (score >= 70) {
    return 'C';
  } else if (score >= 60) {
    return 'D';
  } else {
    return 'F';
  }
}

