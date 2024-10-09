import 'dart:math';
import 'dart:ui';

class DiaryColorGenerator {
  static final Random _random = Random();

  // Predefined color palettes for light and dark modes
  static const List<Color> _lightModeColors = [
    Color(0xFFE57373), // Red
    Color(0xFF81C784), // Green
    Color(0xFF64B5F6), // Blue
    Color(0xFFFFB74D), // Orange
    Color(0xFFBA68C8), // Purple
    Color(0xFF4DB6AC), // Teal
    Color(0xFFFFD54F), // Amber
    Color(0xFF7986CB), // Indigo
  ];

  static const List<Color> _darkModeColors = [
    Color(0xFF512DA8), // Deep Purple
    Color(0xFF00796B), // Teal
    Color(0xFF0277BD), // Light Blue
    Color(0xFF558B2F), // Light Green
    Color(0xFFC62828), // Red
    Color(0xFF6A1B9A), // Purple
    Color(0xFFEF6C00), // Orange
    Color(0xFF4527A0), // Deep Purple
  ];

  static Color getRandomColor(bool isDarkMode) {
    final colors = isDarkMode ? _darkModeColors : _lightModeColors;
    return colors[_random.nextInt(colors.length)];
  }
}
