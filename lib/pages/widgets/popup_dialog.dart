part of 'widgets.dart';

class PopupDialog extends StatelessWidget {
  final String? image;
  final String title;
  final Color? titleColor;
  final String description;
  final String? buttonText;
  final Function() onPressed;
  const PopupDialog({
    this.image,
    required this.title,
    this.titleColor,
    required this.description,
    this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image != null)
              Image(
                image: AssetImage(image!),
              ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              title,
              style: GoogleFonts.nunitoSans(
                color:
                    titleColor == null ? ChatMeStyles.primaryColor : titleColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                color: ChatMeStyles.secondaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            CustomButton(
              text: 'Okay',
              color: ChatMeStyles.secondaryColor,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
