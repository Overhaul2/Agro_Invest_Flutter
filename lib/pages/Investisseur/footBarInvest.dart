import 'package:flutter/cupertino.dart';

class FooterDrawers extends StatefulWidget {
  const FooterDrawers({Key? key}) : super(key: key);

  @override
  State<FooterDrawers> createState() => _FooterDrawersState();
}

class _FooterDrawersState extends State<FooterDrawers> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 58.0),
      child: Container(
        height: 250,
        child: Image.asset("asset/images/logo.png"),
      ),
    );
  }
}
