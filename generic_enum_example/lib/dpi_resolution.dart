// import 'package:generic_enum/generic_enum.dart';
// import 'package:generic_enum_annotation/generic_enum_annotation.dart';

// ///   0. Add a part instruction pointing to generated file.
// part 'dpi_resolution.g.dart';

// /// 1. Extend GenericEnum<T>
// /// 2. Annotate class
// @GenerateValueMap()
// @GenerateFromJson()

// /// Sample generic_enum class supporting json-serialization.
// class DpiResolution extends GenericEnum<int> {
//   /// 3. Define a private const constructor that calls the super constructor
//   ///   and passes on the value of type int.
//   const DpiResolution._(int value) : super(value);

//   /// 4. Define static constant instances of type DpiResolution.
//   static const DpiResolution LOW = DpiResolution._(90);
//   static const DpiResolution MEDIUM = DpiResolution._(300);
//   static const DpiResolution HIGH = DpiResolution._(600);

//   /// 5. Give access to _$DpiResolutionValueMap.
//   static Map<int, DpiResolution> get valueMap => _$DpiResolutionValueMap;

//   /// 6. Define factory constructor .fromJson.
//   factory DpiResolution.fromJson(Map<String, dynamic> json) =>
//       _$DpiResolutionFromJson(json);
// }

import 'package:generic_enum/generic_enum.dart';
import 'package:generic_enum_annotation/generic_enum_annotation.dart';
//   1. Add a part statement pointing to the generated file.
part 'dpi_resolution.g.dart';

//   2. Annotate with @GenerateFromJson()
//   3. Extend GenericEnum<T>
@GenerateFromJson()
class DpiResolution extends GenericEnum<int> {
  // 4. Define a private const constructor that calls the super constructor
  //    and passes on the value of type int.
  const DpiResolution._(int value) : super(value);
  // 5. Define static constant instances of type DpiResolution
  static const DpiResolution LOW = DpiResolution._(90);
  static const DpiResolution MEDIUM = DpiResolution._(300);
  static const DpiResolution HIGH = DpiResolution._(600);
  // 6. Give access to _valueMap and
  static Map<int, DpiResolution> get valueMap => _$DpiResolutionValueMap;
  // 7. Define the named factory constructor .fromJson:
  factory DpiResolution.fromJson(Map<String, dynamic> json) =>
      _$DpiResolutionFromJson(json);
}
