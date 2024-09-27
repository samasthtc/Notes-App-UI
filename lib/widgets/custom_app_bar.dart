import 'package:flutter/material.dart';
import 'package:notes/theme/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool isPushed;
  final IconData? trailingBtnIcon;
  final Color? color;
  final void Function()? trailingBtnOnPressed;

  final Color splashColor = const Color.fromRGBO(37, 37, 37, 0.4);
  final Color highlightColor = const Color.fromRGBO(37, 37, 37, 0.2);

  const CustomAppBar({
    this.title = '',
    this.isPushed = false,
    this.trailingBtnIcon,
    this.color,
    this.trailingBtnOnPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title.isNotEmpty
              ? Text(
                  title,
                  style: TextStyle(
                    fontSize: 48,
                    color: inversePrimaryColor,
                  ),
                )
              : isPushed
                  ? Material(
                      color: const Color(0xff3b3b3b),
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        splashColor: splashColor,
                        highlightColor: highlightColor,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: inversePrimaryColor,
                          ),
                        ),
                      ),
                    )
                  : Container(),
          trailingBtnIcon != null
              ? Material(
                  color: const Color(0xff3b3b3b),
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    splashColor: splashColor,
                    highlightColor: highlightColor,
                    onTap: trailingBtnOnPressed,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        trailingBtnIcon,
                        color: color,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
