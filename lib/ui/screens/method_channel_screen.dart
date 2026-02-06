import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/repository/method_channel_counter.dart';

@RoutePage()
class MethodChannelScreen extends StatefulWidget {
  const MethodChannelScreen({super.key});

  @override
  State<MethodChannelScreen> createState() => _MethodChannelDemoState();
}

class _MethodChannelDemoState extends State<MethodChannelScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Method Channel Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton.icon(
                onPressed: () async {
                  try {
                    final value = await MethodChannelCounter.randomValue();
                    setState(() {
                      count = value;
                    });
                  } catch (error) {
                    if (!mounted) return;
                    showMessage(context, (error as PlatformException).message!);
                  }
                },
                icon: const Icon(Icons.auto_awesome),
                label: const Text("Random")),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                    onPressed: () async {
                      try {
                        final value = await MethodChannelCounter.increment(
                            counterValue: count);
                        setState(() {
                          count = value;
                        });
                      } catch (error) {
                        if (!mounted) return;
                        showMessage(
                            context, (error as PlatformException).message!);
                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Add")),
                Text(
                  count.toString(),
                  style: const TextStyle(fontSize: 42),
                ),
                OutlinedButton.icon(
                    onPressed: () async {
                      try {
                        final value = await MethodChannelCounter.decrement(
                            counterValue: count);
                        setState(() {
                          count = value;
                        });
                      } catch (error) {
                        if (!mounted) return;
                        showMessage(
                            context, (error as PlatformException).message!);
                      }
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text("Subtract")),
              ],
            ),
            OutlinedButton.icon(
                onPressed: () async {
                  try {
                    final value = await MethodChannelCounter.tryMe();
                    setState(() {
                      count = value;
                    });
                  } catch (error) {
                    if (!mounted) return;
                    if (error is MissingPluginException) {
                      showMessage(context, (error.message!));
                    } else if (error is PlatformException) {
                      showMessage(context, (error.message!));
                    }
                  }
                },
                icon: const Icon(Icons.error),
                label: const Text("Try me")),
          ],
        ),
      ),
    );
  }

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}