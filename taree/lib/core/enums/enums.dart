enum QuestionType {
  numerical,
  multichoice,
}

enum QuestionName {
  subjectFraction('subjectFraction'),
  level('level'),
  subjectAddition('subjectAddition'),
  subjectVocab('subjectVocab'),
  subjectFamilyTree('subjectFamilyTree'),
  subjectStampDesign('subjectStampDesign'),
  reportGeneration('reportGeneration'),
  description('description'),
  gender('gender'),
  severity('severity'),
  dateOfBirth('dateOfBirth'),
  disability('disability'),
  studentName('studentName'),
  schoolName('schoolName');

  final String val;
  const QuestionName(this.val);
}
