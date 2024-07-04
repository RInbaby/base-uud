import 'package:equatable/equatable.dart';

import '../../domain/question_entities.dart';

class HomeState extends Equatable {
  final List<QuestionEntities> questions;

  const HomeState({required this.questions});

  factory HomeState.initial() => HomeState(questions: []);

  @override
  List<Object?> get props => [questions];

  HomeState copyWith({
    final List<QuestionEntities>? questions,
  }) {
    return HomeState(
      questions: questions ?? this.questions,
    );
  }
}
