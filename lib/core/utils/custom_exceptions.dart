abstract class CustomExceptions implements Exception {
  final String message;

  CustomExceptions({
    required this.message,
  });
}

class NetworkException extends CustomExceptions {
  NetworkException({required super.message});
}

class ServerException extends CustomExceptions {
  ServerException({required super.message});
}

class NoDataException extends CustomExceptions {
  NoDataException({required super.message});
}
