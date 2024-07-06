import 'package:flutter/material.dart';
import 'package:flutter_pos/app/themes/app_sizes.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? fontSize;
  final BorderRadius? borderRadius;
  final EdgeInsets padding;
  final bool enabled;
  final String? text;
  final Color? buttonColor;
  final Color? disabledButtonColor;
  final Color? borderColor;
  final Color? textColor;
  final Widget? child;
  final Alignment alignment;
  final Function()? onTap;

  const AppButton({
    super.key,
    this.width,
    this.height,
    this.fontSize,
    this.borderRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
    this.enabled = true,
    this.buttonColor,
    this.disabledButtonColor,
    this.borderColor,
    this.textColor,
    this.child,
    this.alignment = Alignment.center,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radius),
      child: InkWell(
        onTap: enabled ? onTap : null,
        splashFactory: InkRipple.splashFactory,
        borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radius),
        child: Ink(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: enabled
                ? buttonColor ?? Theme.of(context).colorScheme.primary
                : disabledButtonColor ?? Theme.of(context).colorScheme.surfaceDim,
            borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radius),
            border: Border.all(width: 1, color: borderColor ?? buttonColor ?? Theme.of(context).colorScheme.primary),
          ),
          child: Align(
            alignment: alignment,
            child: child ??
                Text(
                  text ?? '',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: fontSize,
                        color: enabled
                            ? textColor ?? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.outline,
                      ),
                ),
          ),
        ),
      ),
    );
  }
}
