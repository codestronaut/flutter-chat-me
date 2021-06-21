part of 'widgets.dart';

class CustomBackButton extends StatelessWidget {
  final Function() onPressed;
  const CustomBackButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 64.0,
      ),
      child: IconButton(
        onPressed: onPressed,
        splashRadius: 20.0,
        icon: Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
    );
  }
}
