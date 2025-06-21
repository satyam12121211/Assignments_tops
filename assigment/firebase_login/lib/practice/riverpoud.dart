import 'package:firebase_login/practice/statechange.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

class Riverpoudp extends ConsumerWidget {
  const Riverpoudp({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
   final SliderProvider=ref.watch(sliderprovider);
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Consumer(
              builder: (context, ref, child) {
                return Container(
                  height: 200,
                  width: 200,
                  color: Colors.red.withOpacity(SliderProvider),
                );
              }
            ),
            Slider(value: SliderProvider, onChanged:(value){
              ref.read(sliderprovider.notifier).state=value;
            })
          ],
        ),
      ),
    );
  }
}
