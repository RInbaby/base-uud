
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/question_entities.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeInitEvent>(_onInit);
  }

  Future _onInit(HomeInitEvent event, Emitter<HomeState> emit) async{
    List<QuestionEntities> questions = QuestionEntities.mockDataQuestions();
    emit(state.copyWith(questions: questions));
  }
}
