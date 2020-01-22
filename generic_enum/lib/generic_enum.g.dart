// GENERATED CODE - DO NOT MODIFY BY HAND

part of generic_enum;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericEnum<T> _$GenericEnumFromJson<T>(Map<String, dynamic> json) {
  return GenericEnum<T>(
    _Converter<T>().fromJson(json['value']),
  );
}

Map<String, dynamic> _$GenericEnumToJson<T>(GenericEnum<T> instance) =>
    <String, dynamic>{
      'value': _Converter<T>().toJson(instance.value),
    };
