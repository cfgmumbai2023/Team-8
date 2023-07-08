import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enums/enums.dart';


class Question {
  final String question;
  final List<String>? answers;
  final String name;
  final QuestionType type;
  final int? lessThan;
  final int? greaterThan;

  Question(
      {required this.question,
      this.answers,
      required this.name,
      required this.type,
      this.lessThan,
      this.greaterThan});
}

final questionListProvider =
    StateProvider<List<Question>>(((ref) => _questionList));

List<Question> _questionList = [
  Question(
    question: "The Child is suffering with:",
    answers: ['Attention Deficit Disorder', 'Epilepsy', 'Learning Disabilities','Neuromuscular Disorders','Cerebral Palsy','Autism'],
    name: QuestionName.disability.val,
    type: QuestionType.multichoice,
  ),
  Question(
    question: "Enter the level of severity of the disease",
    answers: ['Low', 'Moderate', 'Severe'],
    name: QuestionName.severity.val,
    type: QuestionType.multichoice,
  ),
  Question(
    question: "Gender",
    name: QuestionName.gender.val,
    answers:['Female','Male'],
    type: QuestionType.multichoice,
  ),
  Question(
    question: "Enter School Name ",
    name: QuestionName.schoolName.val,
    answers: ['GYAN MANDIR','SARASWATI SHISHU MANDIR'],
    type: QuestionType.multichoice,
  ),
  Question(
    question: "on a scale of 0 to 10 rank the child in 'Fraction'",
    name: QuestionName.subjectFraction.val,
    type: QuestionType.numerical,
    lessThan: 10,
    greaterThan: 0,
  ),
  Question(
    question: "on a scale of 0 to 10 rank the child in 'Addation'",
    name: QuestionName.subjectAddition.val,
    type: QuestionType.numerical,
    lessThan: 10,
    greaterThan: 0,
  ),
  Question(
    question: "on a scale of 0 to 10 rank the child in 'Vocabulary Building'",
    name: QuestionName.subjectVocab.val,
    type: QuestionType.numerical,
    lessThan: 10,
    greaterThan: 0,
  ),
  Question(
    question: "on a scale of 0 to 10 rank the child in 'Stamping the Design'",
    name: QuestionName.subjectStampDesign.val,
    type: QuestionType.numerical,
    lessThan: 10,
    greaterThan: 0,
  ),
  Question(
    question: "on a scale of 0 to 10 rank the child in 'Family Member Identificaton'",
    name: QuestionName.subjectFamilyTree.val,
    type: QuestionType.numerical,
    lessThan: 10,
    greaterThan: 0,
  ),
];
