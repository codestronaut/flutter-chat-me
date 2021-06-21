part of 'widgets.dart';

class UniqueBackground extends StatelessWidget {
  final double opacity;
  const UniqueBackground({required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Opacity(
        opacity: opacity,
        child: Image.asset(
          'assets/background.png',
        ),
      ),
    );
  }
}
