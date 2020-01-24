import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/type.dart';

class DartTypeReader {
  DartTypeReader._({this.dartType});
  final DartType dartType;

  static getInstance() async {
    // Get analysis context
    String path = 'package:sqlite_entity/src/column.dart';
    var context = AnalysisContextCollection(includedPaths: [
      path,
    ]).contextFor(path);
    var session = context.currentSession;
    ResolvedUnitResult result = await session.getResolvedUnit(path);
    CompilationUnit unit = result.unit;

    for (var member in unit.declarations) {
      if (member is ClassDeclaration) {
        return DartTypeReader._(dartType: member.name.staticType);
      } else {
        throw Exception('Column type not found in $path.');
      }
    }
  }
}
