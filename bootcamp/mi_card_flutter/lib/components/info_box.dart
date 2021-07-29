import 'package:flutter/widgets.dart';

class InfoBox extends StatelessWidget {
  final Widget icon;
  final String content;
  final Color backgroundColor;
  final Color color;

  const InfoBox({
    Key? key,
    this.icon = const SizedBox(),
    this.content = '',
    this.backgroundColor = const Color(0xffffffff),
    this.color = const Color(0xff000000),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 15.0,
      ),
      child: Row(
        children: [
          this.icon,
          SizedBox(
            width: 10.0,
          ),
          Text(
            this.content,
            style: TextStyle(
              color: this.color,
              fontFamily: 'Source Sans Pro',
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
