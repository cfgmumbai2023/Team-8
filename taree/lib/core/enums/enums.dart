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
  description('description'),
  // gender('gender'),
  // severity('severity'),
  // dateOfBirth('dateOfBirth'),
  // disability('disability'),
  // studentName('studentName'),
  schoolId('schoolId');

  final String val;
  const QuestionName(this.val);
}
