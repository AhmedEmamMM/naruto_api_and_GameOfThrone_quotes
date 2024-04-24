part of 'got_cubit.dart';

@immutable
sealed class GotState {}

final class GotInitial extends GotState {}

class GOTquoteLoaded extends GotState {
  final List<GOTquote> randomQuotes;
  GOTquoteLoaded(this.randomQuotes);
}
