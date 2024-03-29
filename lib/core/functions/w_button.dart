import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../assets/colors.dart';
import '../widgets/w_scale.dart';


class WButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color color;
  final Color textColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final Widget? child;
  final BoxBorder? border;
  final bool loading;
  final bool disabled;
  final double? borderRadius;
  final List<BoxShadow>? boxShadow;
  const WButton({
    required this.onTap,
    this.width,
    this.borderRadius,
    this.height,
    this.text = '',
    this.textStyle,
    this.margin,
    this.padding,
    this.border,
    this.child,
    this.boxShadow,
    this.color = const Color(0xff0062FF),
    this.textColor =   Colors.black,
    this.loading = false,
    this.disabled = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: () {
          if (!(loading || disabled)) {
            onTap();
          }
        },
        isDisabled: disabled,
        child: Container(
          width: width,
          height: height,
          margin: margin,
          padding: padding ?? const EdgeInsets.all(14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: disabled ? AppColors.secondary : color,
              borderRadius: BorderRadius.circular(borderRadius ?? 4),
              border: border,
              boxShadow: boxShadow),
          child: loading
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : child ??
                  Text(
                    text.trim(),
                    style: textStyle ??
                        Theme.of(context).textTheme.headline3!.copyWith(
                              color: textColor,
                              fontSize: 16,
                            ),
                  ),
        ),
      );
}
