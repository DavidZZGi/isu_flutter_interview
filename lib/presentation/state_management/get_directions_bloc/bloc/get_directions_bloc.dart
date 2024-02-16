import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_directions_event.dart';
part 'get_directions_state.dart';

class GetDirectionsBloc extends Bloc<GetDirectionsEvent, GetDirectionsState> {
  GetDirectionsBloc() : super(GetDirectionsInitial()) {
    on<GetDirectionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
