import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_app/bloc/app/app_event.dart';
import 'package:pos_app/bloc/app/app_state.dart';
import 'package:pos_app/enums/app_page.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState(page: AppPage.splash)) {
    // NOTE:May use in future
    // on<AppEventGoToLogin>((event, emit) {
    //   emit(const AppState(page: AppPage.login));
    // });
  }
}
