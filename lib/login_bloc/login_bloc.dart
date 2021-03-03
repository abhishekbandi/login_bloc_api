import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_yourdoctors/api_service.dart';
import 'package:flutter_yourdoctors/data/model/model_class.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<FormScreenEvent, FormScreenState> {
  Services services;

  LoginBloc(this.services) : super(FormScreenState(isTrue: true));

  @override
  Stream<FormScreenState> mapEventToState(
    FormScreenEvent event,
  ) async* {
    if (event is FormScreenEvent) {
      AuthenticateUser authenticateUser =
          await services.postApiMethod(event.email, event.password);
      print("My Email is ${event.email}");

      print(authenticateUser);
      if (authenticateUser.header.statusCode == "200") {
        print('HomeScreen');
        yield FormScreenState(isTrue: true);
      } else if (authenticateUser.header.statusCode == "401") {
        print('ShowSnackbar');
        yield FormScreenState(isTrue: false);
      }
    }
  }
}
