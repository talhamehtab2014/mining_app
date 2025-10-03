part of '../r.dart';

class Assets {
  final IconsData _icons;
  final Graphics _graphics;

  Assets._() : _icons = const IconsData._(), _graphics = Graphics._();

  IconsData get icons => _icons;

  Graphics get graphics => _graphics;
}

class IconsData {
  const IconsData._();

  Icon get allTales => const Icon(Icons.add);
}

class Graphics {
  final SvgAssets _svgIcons;

  Graphics._() : _svgIcons = const SvgAssets._();

  SvgAssets get svgIcons => _svgIcons;
}

class SvgAssets {
  const SvgAssets._();
}
