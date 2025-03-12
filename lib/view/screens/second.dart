import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/second_controller.dart';

class Second extends GetView<SecondController> {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second To Get The News'), centerTitle: true),
      body: Center(
        child: GetBuilder<SecondController>(
          builder: (controller) {
            if (controller.newsApi == null) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: controller.newsApi!.articles.length,
                itemBuilder:
                    (context, index) => ListTile(
                      title: Text(
                        controller.newsApi!.articles[index].title,
                        style: Theme.of(context).textTheme.labelLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Column(
                        children: [
                          Text(
                            controller.newsApi!.articles[index].description ??
                                'No description available',
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 2,
                            height: 6,
                            endIndent: 0,
                            indent: 0,
                          ),
                        ],
                      ),

                      leading: SizedBox(
                        width: 160,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          child: Image(
                            image: NetworkImage(
                              controller.newsApi!.articles[index].urlToImage!,
                            ),
                          ),
                        ),
                      ),
                      // trailing: Text(''),
                    ),
              );
            }
          },
        ),
      ),
    );
  }
}
