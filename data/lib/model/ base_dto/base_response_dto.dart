class BaseResponseDto<T> {
  final T data;

  const BaseResponseDto({
    required this.data,
  });

  factory BaseResponseDto.fromMap(
    Map<String, dynamic> map,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return BaseResponseDto<T>(
      data: fromJsonT(map['data']),
    );
  }
}
