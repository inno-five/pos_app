import 'package:equatable/equatable.dart';
import 'package:pos_app/enums/app_page.dart';

class AppState extends Equatable {
  final AppPage page;

  const AppState({required this.page});

  @override
  List<Object> get props => [page];
}
