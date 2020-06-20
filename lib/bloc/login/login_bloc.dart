import '../../locator.dart';
import '../../services/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  final LoginService _loginService = locator<LoginService>();

  @override
  // TODO: implement initialState
  LoginState get initialState => LoginState.initial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // TODO: implement mapEventToState
    if(event is Submitted){
      yield* _mapSubmittedToState(event);
    }
  }

  Stream<LoginState> _mapSubmittedToState(Submitted event) async* {
    yield LoginState.loading();
    try{
      final authenticated =  await _loginService.isAuthenticated(event.email, event.password);
      if(authenticated){
        yield LoginState.success();
      } else {
        yield LoginState.failure();
      }
    } on Exception catch(error){
      yield LoginState.noconnection();
    }
  }
  
}