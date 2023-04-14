import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provide_example/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('StateLess Widget Built');
    return Scaffold(
      appBar: AppBar(
        title: Text('State Managment'),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 245,
            child: ChangeNotifierProvider<HomeProvider>(
              create: (context) => HomeProvider(),
              child: Consumer<HomeProvider> (
                builder: (context, provider, child) {
            log('Consumer Widget is Building');
             return  Column(

                    children: [
                    Text(provider.message.toString() ?? '', style: TextStyle(
                      color: provider.isElgible == true ? Colors.green : Colors.red
                    ),),
                      TextField(
                        onChanged: (value) {
                          if(value == '') {
                            provider.setMessage('Tell me yo age granpda.');
                          }
                          provider.checkAge(int.parse(value));
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  );
                },
              ),

            ),
          ),
        ),
      ),
    );
  }
}
