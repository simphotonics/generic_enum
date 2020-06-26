import 'package:generic_enum/generic_enum.dart';

/// Sample generic enum without any const instances.
@GenerateFromToJson()
@GenerateIdentifier()
class EmptyGenericEnum extends GenericEnum<bool> {
  const EmptyGenericEnum._(bool value) : super(value);

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
