import '../../packages/default_packages.dart';
import '../../utils/components.dart';

extension SansText on Text {
  Widget applySansStyle({double? size, Color? color, FontWeight? fontWeight}) {
    return Sans(
      data ?? '',
      size ?? 14.0,
      color: color,
      fontWeight: fontWeight,
    );
  }

  Widget applySansBoldStyle({double? size}) {
    return SansBold(
      data ?? '',
      size ?? 14.0,
    );
  }
}
