import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final String imageUrl;
  final String username;

  StoryWidget({
    required this.imageUrl,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullScreenStory(
              highResImageUrl: imageUrl,
              username: username,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            username,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class FullScreenStory extends StatelessWidget {
  final String highResImageUrl;
  final String username;

  FullScreenStory({
    required this.highResImageUrl,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              child: Center(
                child: Image.network(
                  highResImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 16.0,
              left: 16.0,
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final String postImageUrl;
  final String username;
  final String avatarUrl;
  final int likesCount;
  final int commentsCount;

  PostWidget({
    required this.postImageUrl,
    required this.username,
    required this.avatarUrl,
    required this.likesCount,
    required this.commentsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                radius: 16.0,
              ),
              SizedBox(width: 8.0),
              Text(
                username,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Image.network(
            postImageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Icon(Icons.favorite, color: Colors.red),
              SizedBox(width: 4.0),
              Text('$likesCount'),
              SizedBox(width: 16.0),
              Icon(Icons.comment, color: Colors.blue),
              SizedBox(width: 4.0),
              Text('$commentsCount'),
            ],
          ),
        ],
      ),
    );
  }
}

class StoriesPage extends StatelessWidget {
  final List<Map<String, String>> stories = [
    {
      'imageUrl': 'assets/images/uib.png',
      'username': '2010890',
    },
    {
      'imageUrl': 'assets/images/stud.jpeg',
      'username': '2011273',
    },
    {
      'imageUrl': 'assets/images/uib-512.png',
      'username': '1714039',
    },
    {
      'imageUrl': 'https://placekitten.com/800/700',
      'username': '1811273',
    },
    {
      'imageUrl': 'https://placekitten.com/800/800',
      'username': '1911273',
    },
    {
      'imageUrl': 'https://placekitten.com/700/800',
      'username': '2211273',
    },
    {
      'imageUrl': 'https://placekitten.com/200/300',
      'username': '2311273',
    },
  ];

  final List<Map<String, dynamic>> posts = [
    {
      'postImageUrl': 'assets/images/dipl.jpeg',
      'username': '2011273',
      'avatarUrl': 'https://placekitten.com/700/801',
      'likesCount': 78,
      'commentsCount': 21,
    },
    {
      'postImageUrl': 'assets/images/sbor.jpeg',
      'username': '2010378',
      'avatarUrl': 'https://placekitten.com/702/801',
      'likesCount': 95,
      'commentsCount': 30,
    },
    {
      'postImageUrl': 'assets/images/dom.jpg',
      'username': '1810308',
      'avatarUrl': 'https://placekitten.com/702/801',
      'likesCount': 112,
      'commentsCount': 39,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stories and Posts'),
        backgroundColor: Color(0xFF1C7E66),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: stories.asMap().entries.map((entry) {
                  final index = entry.key;
                  final story = entry.value;
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: index % 2 == 0 ? Colors.white : null,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: StoryWidget(
                        imageUrl: story['imageUrl']!,
                        username: story['username']!,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return PostWidget(
                  postImageUrl: post['postImageUrl'],
                  username: post['username'],
                  avatarUrl: post['avatarUrl'],
                  likesCount: post['likesCount'],
                  commentsCount: post['commentsCount'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stories App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoriesPage(),
    );
  }
}
