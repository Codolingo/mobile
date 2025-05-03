import 'dart:math';
import 'dart:ui';

class CodolingoColors {
  static const Primary = Color(0xFFF2F2F7);

  static const White = Color(0xFFFFFFFF);

  static const Black = Color(0xFF000000);

  static const Blue50 = Color(0xFFF1F3FF);
  static const Blue100 = Color(0xFF8FA0F7);
  static const Blue200 = Color(0xFF000000);
  static const Blue300 = Color(0xFF6981F5);
  static const Blue400 = Color(0xFF000000);
  static const Blue500 = Color(0xFF4461F2);
  static const Blue600 = Color(0xFF000000);
  static const Blue700 = Color(0xFF364EC2);
  static const Blue800 = Color(0xFF000000);
  static const Blue900 = Color(0xFF293A91);

  static const Red50 = Color(0xFFFFEBEB);
  static const Red100 = Color(0xFFF78F8F);
  static const Red200 = Color(0xFF000000);
  static const Red300 = Color(0xFFF56969);
  static const Red400 = Color(0xFF000000);
  static const Red500 = Color(0xFFF24444);
  static const Red600 = Color(0xFF000000);
  static const Red700 = Color(0xFFC23636);
  static const Red800 = Color(0xFF000000);
  static const Red900 = Color(0xFF912929);

  static const Green50 = Color(0xFFEBFFEB);
  static const Green100 = Color(0xFF92E98B);
  static const Green200 = Color(0xFF000000);
  static const Green300 = Color(0xFF6EE164);
  static const Green400 = Color(0xFF000000);
  static const Green500 = Color(0xFF4ADA3D);
  static const Green600 = Color(0xFF000000);
  static const Green700 = Color(0xFF3BAE31);
  static const Green800 = Color(0xFF000000);
  static const Green900 = Color(0xFF2C8325);

  static const Grey50 = Color(0xFF000000);
  static const Grey100 = Color(0xFFF7F7F7);
  static const Grey200 = Color(0xFF000000);
  static const Grey300 = Color(0xFFF2F2F2);
  static const Grey400 = Color(0xFF000000);
  static const Grey500 = Color(0xFFC2C2C2);
  static const Grey600 = Color(0xFF000000);
  static const Grey700 = Color(0xFF919191);
  static const Grey800 = Color(0xFF000000);
  static const Grey900 = Color(0xFF616161);

  static const Gold50 = Color(0xFFFFFEF5);
  static const Gold100 = Color(0xFFf7e88f);
  static const Gold200 = Color(0xFF000000);
  static const Gold300 = Color(0xFFf5e069);
  static const Gold400 = Color(0xFF000000);
  static const Gold500 = Color(0xFFf2d844);
  static const Gold600 = Color(0xFF000000);
  static const Gold700 = Color(0xFFc2ad36);
  static const Gold800 = Color(0xFF000000);
  static const Gold900 = Color(0xFF918229);

  static const Orange50 = Color(0xFFFFF8F1);
  static const Orange100 = Color(0xFF000000);
  static const Orange200 = Color(0xFF000000);
  static const Orange300 = Color(0xFF000000);
  static const Orange400 = Color(0xFF000000);
  static const Orange500 = Color(0xFFFAAE58);
  static const Orange600 = Color(0xFF000000);
  static const Orange700 = Color(0xFFE49E4F);
  static const Orange800 = Color(0xFF000000);
  static const Orange900 = Color(0xFF000000);

  static const Pink50 = Color(0xFFFFF6FF);
  static const Pink100 = Color(0xFF000000);
  static const Pink200 = Color(0xFF000000);
  static const Pink300 = Color(0xFF000000);
  static const Pink400 = Color(0xFF000000);
  static const Pink500 = Color(0xFFFF9EFD);
  static const Pink600 = Color(0xFF000000);
  static const Pink700 = Color(0xFFE072DE);
  static const Pink800 = Color(0xFF000000);
  static const Pink900 = Color(0xFF000000);

  static const Yellow50 = Color(0xFFFFFFF5);
  static const Yellow100 = Color(0xFF000000);
  static const Yellow200 = Color(0xFF000000);
  static const Yellow300 = Color(0xFF000000);
  static const Yellow400 = Color(0xFF000000);
  static const Yellow500 = Color(0xFFF5E069);
  static const Yellow600 = Color(0xFF000000);
  static const Yellow700 = Color(0xFFE4E036);
  static const Yellow800 = Color(0xFF000000);
  static const Yellow900 = Color(0xFF000000);

  static Color getRandomColor() {
    final colors = [
      CodolingoColors.Blue300,
      CodolingoColors.Red300,
      CodolingoColors.Green300,
      CodolingoColors.Yellow500,
      CodolingoColors.Orange500,
      CodolingoColors.Pink500,
      CodolingoColors.Gold500,
    ];
    final random = Random();
    return colors[random.nextInt(colors.length)];
  }

}
