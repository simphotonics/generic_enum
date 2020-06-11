import 'package:generic_enum/generic_enum.dart';

/// Sample generic enum without any const instances.
@GenerateFromJson()
@GenerateIdentifier()
class EmptyGenericEnum extends GenericEnum<bool> {
  const EmptyGenericEnum._(bool value) : super(value);
}
