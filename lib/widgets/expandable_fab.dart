/// courtesy of https://github.com/valentindrolet
/// https://github.com/flutter/flutter/issues/104393#issuecomment-1793471727
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExpandableFloatingActionButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final ScrollController scrollController;
  final void Function() onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const ExpandableFloatingActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.scrollController,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  State<ExpandableFloatingActionButton> createState() =>
      _ExpandableFloatingActionButtonState();
}

class _ExpandableFloatingActionButtonState
    extends State<ExpandableFloatingActionButton> {
  bool _extended = true;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    bool maxScrollReached = widget.scrollController.position.maxScrollExtent ==
        widget.scrollController.position.pixels;
    bool scrollUp = widget.scrollController.position.userScrollDirection ==
        ScrollDirection.forward;

    setState(() => _extended = maxScrollReached || scrollUp);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      extendedIconLabelSpacing: _extended ? 10 : 0,
      extendedPadding:
          _extended ? null : const EdgeInsets.symmetric(horizontal: 16),
      onPressed: widget.onPressed,
      icon: Icon(widget.icon),
      backgroundColor: widget.backgroundColor,
      foregroundColor: widget.foregroundColor,
      label: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        child: _extended ? Text(widget.label) : Container(),
      ),
    );
  }
}
