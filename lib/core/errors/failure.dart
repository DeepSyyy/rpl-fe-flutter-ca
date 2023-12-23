abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class CacheFailure extends Failure {
  CacheFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class NotFoundFailure extends Failure {
  NotFoundFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class ClientFailure extends Failure {
  ClientFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
