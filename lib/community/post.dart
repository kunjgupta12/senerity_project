import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/community/add_post.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          clipBehavior: Clip.hardEdge,
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewPostPage()));
          },
          tooltip: 'Increment',
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        body: PostList());
  }
}

class PostList extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        var posts = snapshot.data?.docs;
        List<Widget> postWidgets = [];
        for (var post in posts!) {
          var text = post['text'];
          var imageUrl = post['image_url'];
          // Create widgets to display posts
          // You can use ListTile, Card, or your custom widgets here
          var postWidget = YourPostWidget(text: text, imageUrl: imageUrl);
          postWidgets.add(postWidget);
        }
        return ListView(
          children: postWidgets,
        );
      },
    );
  }
}

void _vote(String pollId, String option) {
  FirebaseFirestore.instance.collection('posts').doc(pollId).update({
    'votes.$option': FieldValue.increment(1),
  });
}

class Poll extends StatelessWidget {
  const Poll({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('polls').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            final polls = snapshot.data?.docs;

            // Display the polls and their options, along with vote buttons
            return ListView.builder(
              itemCount: polls?.length,
              itemBuilder: (context, index) {
                var poll = polls?[index].data();
                var pollId = polls?[index].id;
                poll?['votes'] ??= {};
                return ListTile(
                  title: Text(poll?['question']),
                  subtitle: Column(
                    children: poll?['options'].map<Widget>((option) {
                      var voteCount = poll['votes'][option] ?? 0;
                      return Row(
                        children: [
                          Text('$option: $voteCount votes'),
                          ElevatedButton(
                            onPressed: () => _vote(pollId!, option),
                            child: Text('Vote'),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class YourPostWidget extends StatelessWidget {
  final String text;
  final String imageUrl;

  YourPostWidget({required this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          SizedBox(height: 200, child: Image.network(imageUrl)),
          Text(text),
          // Implement like, comment buttons, and functionality here
        ],
      ),
    );
  }
}
