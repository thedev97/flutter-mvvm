part of values;

class AppTextStyles {
  static final TextStyle titleText = GoogleFonts.lato(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      shadows: [
        const Shadow(
            color: Colors.black, offset: Offset(0.0, 0.5), blurRadius: 0.5),
      ],
      color: Colors.black);

  static final TextStyle header = GoogleFonts.lato(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      shadows: [
        const Shadow(
            color: Colors.black, offset: Offset(0.0, 0.5), blurRadius: 0.5),
      ],
      color: Colors.white);

  static final TextStyle normalText = GoogleFonts.lato(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      shadows: [
        const Shadow(
            color: Colors.white, offset: Offset(0.0, 0.2), blurRadius: 0.2),
      ],
      color: Colors.black);

  static final TextStyle normalText2 = GoogleFonts.lato(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      shadows: [
        const Shadow(
            color: Colors.black, offset: Offset(0.0, 0.5), blurRadius: 0.5),
      ],
      color: Colors.white);

  static final TextStyle boldText = GoogleFonts.lato(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      shadows: [
        const Shadow(
            color: Colors.black, offset: Offset(0.0, 0.5), blurRadius: 0.5),
      ],
      color: Colors.black);

  static final labelText = GoogleFonts.lato(shadows: [
    const Shadow(
        color: Colors.black,
        offset: Offset(0.0, 1.0),
        blurRadius: 1.0),
  ], fontSize: 8, color: Colors.black);

  static final hintText = GoogleFonts.lato(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Colors.grey);

  static final errorText = GoogleFonts.abel(
      fontWeight: FontWeight.w400,
      fontSize: 11,
      color: Colors.brown);

  static final msgText = GoogleFonts.abel(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      shadows: [
        const Shadow(
            color: Colors.black,
            offset: Offset(0.0, 0.5),
            blurRadius: 0.5),
      ],
      color: Colors.white);
}
