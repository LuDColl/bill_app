import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> with WindowListener {
  bool isMaximized = false;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    _futureInit();
  }

  Future<void> _futureInit() async {
    final isMaximized = await windowManager.isMaximized();
    setState(() => this.isMaximized = isMaximized);
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DragToMoveArea(
      child: AppBar(
        title: const Text('Bill APP'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: windowManager.minimize,
            icon: const Icon(Icons.minimize),
          ),
          if (isMaximized)
            IconButton(
              onPressed: windowManager.unmaximize,
              icon: const Icon(Icons.filter_none),
            )
          else
            IconButton(
              onPressed: windowManager.maximize,
              icon: const Icon(Icons.check_box_outline_blank),
            ),
          IconButton(
            onPressed: windowManager.close,
            icon: const Icon(Icons.close),
          )
        ],
      ),
    );
  }

  @override
  void onWindowMaximize() {
    super.onWindowMaximize();
    setState(() => isMaximized = true);
  }

  @override
  void onWindowUnmaximize() {
    super.onWindowUnmaximize();
    setState(() => isMaximized = false);
  }
}
