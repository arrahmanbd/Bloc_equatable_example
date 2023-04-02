import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String message;
  final VoidCallback action;
  const ErrorPage({
    Key? key,
    required this.message,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/error.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 ElevatedButton(onPressed: action, child: const Text('Retry')),
                   const SizedBox(
                  height: 45,
                ),
                // Container(
                //   margin: const EdgeInsets.symmetric(vertical: 24),
                //   width: 200, height: 200,
                //     decoration: BoxDecoration(
                //         image: const DecorationImage(
                //           image: AssetImage(
                //             'images/error.png',
                //           ),
                //           fit: BoxFit.fill,
                //         ),
                // border: Border.all(
                //   color: Colors.grey.withOpacity(.2),
                //   width: 5,
                // ),
                //         borderRadius: BorderRadius.circular(100)),
                //   ),
                // const Icon(Icons.error_outline_rounded),
                Text('Error: $message',softWrap:true,style:const  TextStyle(fontSize: 24),),
                const SizedBox(
                  height: 45,
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
