import 'package:dart_mappable/dart_mappable.dart';

part '../generated/response.mapper.dart';

@MappableClass(
  discriminatorKey: 'success',
  includeSubClasses: [ResponseSuccess, ResponseFailure],
)
sealed class Response<T> with ResponseMappable {
  const Response({
    required this.statusCode,
    required this.success,
    this.data,
  });

  final int statusCode;

  final bool success;

  final T? data;

  static const fromMap = ResponseMapper.fromMap;
  static const fromJson = ResponseMapper.fromJson;
}

@MappableClass(discriminatorValue: true)
final class ResponseSuccess<T> extends Response<T>
    with ResponseSuccessMappable {
  const ResponseSuccess({
    required super.statusCode,
    required super.success,
    required super.data,
  });
}

@MappableClass(discriminatorValue: false)
final class ResponseFailure<T> extends Response<T>
    with ResponseFailureMappable {
  const ResponseFailure({
    required super.statusCode,
    required super.success,
    required this.message,
  });

  final String message;
}
