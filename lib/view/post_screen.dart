import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test_api_flutter_app/api/todo_api_controller.dart';
import 'package:test_api_flutter_app/model/post_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<PostModel> listPost = [];
  getPostData() async {
    await FullAPIController().getPosts().then((value) {
      setState(() {
        listPost = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('POST Model'),
      ),
      body: ListView.builder(
        itemCount: listPost.length,
        itemBuilder: (context, index) {
          return buildPostWidget(post: listPost[index]);
        },
      ),
    );
  }

  Widget buildPostWidget({required PostModel post}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    maxRadius: 20,
                    backgroundImage: NetworkImage(
                        'https://sb.kaleidousercontent.com/67418/1920x1281/0e9f02a048/christian-buehner-ditylc26zvi-unsplash.jpg'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        post.title.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                post.body.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 8,
              ),
            )
          ],
        ),
      ),
    );
  }
}
