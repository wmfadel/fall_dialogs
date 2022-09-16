part of fall_dialogs;

extension Dialogs on ScaffoldMessengerState {
  showLineDialog({required DialogType type, required String message}) {
    clearSnackBars();
    showSnackBar(
      SnackBar(
        clipBehavior: Clip.none,
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
        content: LineDialog(type: type, message: message)
            .animate()
            .slide(
              duration: 300.ms,
              begin: const Offset(-1, 0),
              end: Offset.zero,
            )
            .then(delay: 2.5.seconds)
            .slide(
              duration: 300.ms,
              begin: Offset.zero,
              end: const Offset(-1.1, 0),
            ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

class LineDialog extends StatelessWidget {
  final DialogType type;
  final String message;

  const LineDialog({
    required this.type,
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        child: Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Color(0xFF23262F),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
        constraints: const BoxConstraints(minHeight: 80),
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              type.color.withOpacity(0.8),
              type.color.withOpacity(0.4),
              type.color.withOpacity(0.2),
              Colors.transparent,
              Colors.transparent,
            ],
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: type.color.withOpacity(0.8),
              ),
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(right: 8),
              width: 46,
              height: 46,
              child: Center(
                child: Icon(
                  type.icon,
                  color: type.bubbleColor,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    type.message,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Flexible(
                    child: Text(
                      message,
                      style: Theme.of(context)
                          .textTheme
                          .overline!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: ScaffoldMessenger.of(context).clearSnackBars,
              icon: const Icon(Icons.close_rounded, color: Colors.white),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 8, minHeight: 8),
            )
          ],
        ),
      ),
    ));
  }
}
