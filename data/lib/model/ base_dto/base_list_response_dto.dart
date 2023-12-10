class BaseListResponseDto<T> {
  final List<T>? listData;

  const BaseListResponseDto({this.listData});

  factory BaseListResponseDto.fromMap(List<dynamic> list, T Function(Object? json) fromJsonT) {
    return BaseListResponseDto(listData: list.map(fromJsonT).toList());
  }

  BaseListResponseDto<U> toDomain<U>(U Function(T t) mapper) {
    final dataForMapping = listData ?? [];
    return BaseListResponseDto<U>(listData: dataForMapping.map(mapper).toList(growable: false));
  }
}
