import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/got_quote.dart';
import '../../../data/repository/got_repo.dart';

part 'got_state.dart';

class GotCubit extends Cubit<GotState> {
  final GOTrepo goTrepo;
  GotCubit(this.goTrepo) : super(GotInitial());

  void randomQuotes() {
    goTrepo.getRandomQuotes().then((randomQuotes) {
      emit(GOTquoteLoaded(randomQuotes));
    });
  }
}
