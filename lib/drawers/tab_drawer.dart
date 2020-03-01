import 'package:flutter/material.dart';

class TabDrawer extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function onTap;

  const TabDrawer(
      {Key key,
      @required this.icon,
      @required this.isSelected,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey,
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
