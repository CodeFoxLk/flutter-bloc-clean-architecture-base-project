// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServerException implements Exception {
  final String message;
  int? statusCode;
  String? url;

  ServerException({required this.message, this.statusCode, this.url});

  @override
  String toString() => 'ServerException(message: $message, statusCode: $statusCode, url: $url)';
}
