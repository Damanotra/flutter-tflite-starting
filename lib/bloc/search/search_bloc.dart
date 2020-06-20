import '../../services/user_service.dart';
import '../../locator.dart';
import '../../services/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search.dart';

class SearchBloc extends Bloc<SearchEvent,SearchState>{
  final UserService _userService = locator<UserService>();

  @override
  // TODO: implement initialState
  SearchState get initialState => SearchState.initial();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    // TODO: implement mapEventToState
    if(event is LoadUserEvent){
      yield* _mapLoadUserEventToState(event);
    } else if(event is SelectUserEvent){
      yield* _mapSelectUserEventToState(event);
    }
  }

  Stream<SearchState> _mapLoadUserEventToState(LoadUserEvent event) async* {
    yield SearchState.isLoading();
    try{
      print("IT IS HERE");
      final res = await _userService.getByGender(event.gender);
      yield SearchState.isLoaded(res);
      print("IT NOW HERE");
    } on Exception catch(error){
      print(error.toString());
      yield SearchState.failure();
    }
    
  }

  Stream<SearchState> _mapSelectUserEventToState(SelectUserEvent event) async* {
    print("IT IS NEXT");
    yield SearchState.swiped(event.index);
  }
}