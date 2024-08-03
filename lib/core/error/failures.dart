import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // final List properties;

  // Failure([this.properties = const <dynamic>[]]);

  @override
  List<Object> get props => [];
}

class NetworkFailure extends Failure {
  final String message;

  NetworkFailure({this.message = "Network Failure"});
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure({this.message = "Server Failure"});
}

class CacheFailure extends Failure {
  final String message;

  CacheFailure({this.message = "Cache Failure"});
}

class ResponseFailure extends Failure {
  final String message;

  ResponseFailure({this.message = "ResponseFailure Failure"});
}

