import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';
import '../resources/apicaller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FutureBuilder(
                future: ApiCaller().fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('FutureBuilder: ${snapshot.data}');
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              GetBuilder<Controller>(
                builder: (_) => controller.isLoading
                    ? CircularProgressIndicator()
                    : Text('GetBuilder: ${controller.data}'),
              ),
              ElevatedButton(
                onPressed: () => controller.updateData(),
                child: Text('Update GetBuilder'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
