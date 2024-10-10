import 'package:flutter/material.dart';

class Granulebutton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool disabled;
  final bool loading;
  final Color? color;

  const Granulebutton({
    super.key,
    required this.text,
    required this.onTap,
    this.disabled = false,
    this.loading = false,
    this.color,
  });

  void noAction() {}

  @override
  Widget build(BuildContext context) {
    return Material(
      color: disabled
          ? Colors.grey.shade300
          : color ?? Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: loading ? Colors.white.withOpacity(0.3) : Colors.transparent,
        child: InkWell(
          onTap: disabled || loading ? noAction : onTap,
          splashColor: disabled || loading
              ? Colors.transparent
              : Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loading
                      ? Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.grey.shade200.withOpacity(0.3),
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        )
                      : Container(),
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
