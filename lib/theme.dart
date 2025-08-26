import 'package:flutter/material.dart';

class Palette {
  // Primary colors with hex codes
  static const Color primary = Color(0xFF8BC34A); // #8BC34A
  static const Color secondary = Color(0xFFFF9800); // #FF9800
  static const Color shadow = Color(0x1A000000); // #1A000000
}

class TextSizes {
  /// Extra small text - 8px for secondary labels and captions
  static double xsmall = 10;

  /// Small text - 10px for helper text and footnotes
  static double small = 12;

  /// Medium text - 12px for body text and descriptions
  static double medium = 14;

  /// Large text - 14px for main body text and inputs
  static double large = 16;

  /// Extra large text - 16px for section titles and important buttons
  static double xlarge = 20;

  /// Double extra large text - 20px for subtitles and secondary headers
  static double xxlarge = 24;

  /// Subitle text - 24px for secondary titles and headers
  static double subtitle = 28;

  /// Title text - 32px for main titles and headers
  static double title = 32;
}

class BorderRadiuses {
  static final all = _AllBorderRadiuses();
}

class _AllBorderRadiuses {
  /// Extra small radius - 8px for small elements and chips
  BorderRadiusGeometry get xsmall => BorderRadiusDirectional.circular(8);

  /// Small radius - 12px for standard buttons and inputs
  BorderRadiusGeometry get small => BorderRadiusDirectional.circular(12);

  /// Medium radius - 16px for cards and containers
  BorderRadiusGeometry get medium => BorderRadiusDirectional.circular(16);

  /// Large radius - 24px for modals and main sections
  BorderRadiusGeometry get large => BorderRadiusDirectional.circular(24);

  /// Extra large radius - 32px for decorative elements and highlights
  BorderRadiusGeometry get xlarge => BorderRadiusDirectional.circular(32);

  /// Double extra large radius - 48px for highly rounded elements
  BorderRadiusGeometry get xxlarge => BorderRadiusDirectional.circular(48);
}

class Paddings {
  static final all = _AllPaddings();
}

class _AllPaddings {
  /// Extra small padding - 4px all sides
  EdgeInsetsGeometry get xsmall => EdgeInsets.all(4.0);

  /// Small padding - 8px all sides
  EdgeInsetsGeometry get small => EdgeInsets.all(8.0);

  /// Medium padding - 12px all sides
  EdgeInsetsGeometry get medium => EdgeInsets.all(12.0);

  /// Large padding - 16px all sides for labels and buttons
  EdgeInsetsGeometry get large => EdgeInsets.all(16.0);

  /// Extra large padding - 20px all sides
  EdgeInsetsGeometry get xlarge => EdgeInsets.all(20.0);

  /// Double extra large padding - 24px all sides
  EdgeInsetsGeometry get xxlarge => EdgeInsets.all(24.0);
}

class BoxShadows {
  /// Standard box shadows - List of BoxShadow for all directions
  static final all = _AllBoxShadows();
}

class _AllBoxShadows {
  /// Extra small shadow - 2px offset, 4px blur, subtle depth
  List<BoxShadow> get xsmall => [
    BoxShadow(
      color: Palette.shadow,
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  /// Small shadow - 4px offset, 8px blur, light elevation
  List<BoxShadow> get small => [
    BoxShadow(
      color: Palette.shadow,
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  /// Medium shadow - 6px offset, 12px blur, moderate elevation
  List<BoxShadow> get medium => [
    BoxShadow(
      color: Palette.shadow,
      offset: Offset(0, 6),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  /// Large shadow - 8px offset, 16px blur, high elevation for cards
  List<BoxShadow> get large => [
    BoxShadow(
      color: Palette.shadow,
      offset: Offset(0, 8),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ];

  /// Extra large shadow - 12px offset, 20px blur, very high elevation for modals
  List<BoxShadow> get xlarge => [
    BoxShadow(
      color: Palette.shadow,
      offset: Offset(0, 12),
      blurRadius: 20,
      spreadRadius: 0,
    ),
  ];

  /// Double extra large shadow - 16px offset, 24px blur, maximum elevation
  List<BoxShadow> get xxlarge => [
    BoxShadow(
      color: Palette.shadow,
      offset: Offset(0, 16),
      blurRadius: 24,
      spreadRadius: 0,
    ),
  ];

  /// No shadow - Empty list for removing shadows
  List<BoxShadow> get none => [];
}
