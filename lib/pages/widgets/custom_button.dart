part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onPressed;
  final bool? revertColor;
  const CustomButton({
    required this.text,
    required this.color,
    required this.onPressed,
    this.revertColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 56.0,
          child: Text(
            text,
            style: ChatMeStyles.buttonTextStyle.copyWith(
              color: revertColor!
                  ? ChatMeStyles.secondaryColor
                  : ChatMeStyles.primaryTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
