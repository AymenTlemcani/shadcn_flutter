import '../../shadcn_flutter.dart';

class Basic extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? content;
  final Widget? trailing;
  final AlignmentGeometry? leadingAlignment;
  final AlignmentGeometry? trailingAlignment;
  final AlignmentGeometry? titleAlignment;
  final AlignmentGeometry? subtitleAlignment;
  final AlignmentGeometry? contentAlignment;
  final double contentSpacing;
  final double titleSpacing;
  final MainAxisAlignment mainAxisAlignment;

  const Basic({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.content,
    this.trailing,
    this.leadingAlignment,
    this.trailingAlignment,
    this.titleAlignment,
    this.subtitleAlignment,
    this.contentAlignment,
    this.contentSpacing = 16,
    this.titleSpacing = 4,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null)
              Align(
                alignment: leadingAlignment ?? Alignment.topCenter,
                child: leading!,
              ),
            if (leading != null &&
                (title != null || content != null || subtitle != null))
              SizedBox(width: contentSpacing),
            if (title != null || content != null || subtitle != null)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: mainAxisAlignment,
                  children: [
                    if (title != null)
                      mergeAnimatedTextStyle(
                          duration: kDefaultDuration,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          child: Align(
                            alignment: titleAlignment ?? Alignment.topLeft,
                            child: title!,
                          )),
                    if (title != null && subtitle != null)
                      const SizedBox(height: 2),
                    if (subtitle != null)
                      mergeAnimatedTextStyle(
                          duration: kDefaultDuration,
                          style: TextStyle(
                            fontSize: 12,
                            color: themeData.colorScheme.mutedForeground,
                          ),
                          child: Align(
                            alignment: subtitleAlignment ?? Alignment.topLeft,
                            child: subtitle!,
                          )),
                    if ((title != null || subtitle != null) && content != null)
                      SizedBox(height: titleSpacing),
                    if (content != null)
                      mergeAnimatedTextStyle(
                          duration: kDefaultDuration,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          // child: content!),
                          child: Align(
                            alignment: contentAlignment ?? Alignment.topLeft,
                            child: content!,
                          )),
                  ],
                ),
              ),
            if (trailing != null &&
                (title != null ||
                    content != null ||
                    leading != null ||
                    subtitle != null))
              SizedBox(width: contentSpacing),
            // if (trailing != null) trailing!,
            if (trailing != null)
              Align(
                alignment: trailingAlignment ?? Alignment.topCenter,
                child: trailing!,
              ),
          ],
        ),
      ),
    );
  }
}

/// Same as basic, but without forcing the text style
class BasicLayout extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? content;
  final Widget? trailing;
  final AlignmentGeometry? leadingAlignment;
  final AlignmentGeometry? trailingAlignment;
  final AlignmentGeometry? titleAlignment;
  final AlignmentGeometry? subtitleAlignment;
  final AlignmentGeometry? contentAlignment;
  final double contentSpacing;
  final double titleSpacing;

  const BasicLayout({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.content,
    this.trailing,
    this.leadingAlignment,
    this.trailingAlignment,
    this.titleAlignment,
    this.subtitleAlignment,
    this.contentAlignment,
    this.contentSpacing = 16,
    this.titleSpacing = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null)
              Align(
                alignment: leadingAlignment ?? Alignment.topCenter,
                child: leading!,
              ),
            if (leading != null &&
                (title != null || content != null || subtitle != null))
              SizedBox(width: contentSpacing),
            if (title != null || content != null || subtitle != null)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null)
                      Align(
                        alignment: titleAlignment ?? Alignment.topLeft,
                        child: title!,
                      ),
                    if (title != null && subtitle != null)
                      const SizedBox(height: 2),
                    if (subtitle != null)
                      Align(
                        alignment: subtitleAlignment ?? Alignment.topLeft,
                        child: subtitle!,
                      ),
                    if ((title != null || subtitle != null) && content != null)
                      SizedBox(height: titleSpacing),
                    if (content != null)
                      Align(
                        alignment: contentAlignment ?? Alignment.topLeft,
                        child: content!,
                      ),
                  ],
                ),
              ),
            if (trailing != null &&
                (title != null ||
                    content != null ||
                    leading != null ||
                    subtitle != null))
              SizedBox(width: contentSpacing),
            if (trailing != null)
              Align(
                alignment: trailingAlignment ?? Alignment.topCenter,
                child: trailing!,
              ),
          ],
        ),
      ),
    );
  }
}
