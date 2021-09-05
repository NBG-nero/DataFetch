
import 'package:flutter/material.dart';

import 'package:https/core/Providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'core/models/post.dart';

void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ], child: Https()),
    );

class Https extends StatefulWidget {
  const Https({Key key}) : super(key: key);

  @override
  _HttpsState createState() => _HttpsState();
}

class _HttpsState extends State<Https> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<UserProvider>(builder: (context, userProvider, child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              centerTitle: true,
              title: Text('HTTPs'),
            ),
            body: FutureBuilder(
                future: userProvider.getPosts(),
                
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: userProvider.post.length,
                    itemBuilder: (context, index) {
                      Post p = userProvider.post[index];

                      return Material(
                        child: Wrap(
                          children: [
                          //   FloatingActionButton(
                          //       backgroundColor: Colors.transparent,
                          //       child: Icon(Icons.post_add_rounded,
                          //           color: Colors.black),
                          //       onPressed: userProvider.postData),
                          //   Center(
                          //     child: ElevatedButton(
                          //       onPressed: () => userProvider.postData(),
                          //       child: Text('Send post'),
                          //     ),
                          //   ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                child: Text(
                                  " ${p.id} ${p.username} ${p.name} ${p.address.city}  ${p.address.street} ",
                                  // Title: ${post['title']}\n Body: ${post['body']}\n\n
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }));
      }),
      debugShowCheckedModeBanner: false,
    );
  }
}
