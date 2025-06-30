import 'package:flutter/material.dart';
import 'package:instagram/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String _userName = '';
  List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadPosts();
  }

  void _loadUserData() async {
    String? name = await AuthService.getUserName();
    setState(() {
      _userName = name ?? 'User';
    });
  }

  void _loadPosts() {
    setState(() {
      _posts = [
        Post(
          id: '1',
          username: 'john_doe',
          imageUrl: 'https://picsum.photos/400/400?random=1',
          caption: 'Beautiful sunset today! 🌅',
          likes: 45,
          comments: ['Amazing!', 'Love this photo'],
          timestamp: '2 hours ago',
        ),
        Post(
          id: '2',
          username: 'jane_smith',
          imageUrl: 'https://picsum.photos/400/400?random=2',
          caption: 'Coffee time ☕',
          likes: 23,
          comments: ['Need coffee too!'],
          timestamp: '4 hours ago',
        ),
        Post(
          id: '3',
          username: 'travel_lover',
          imageUrl: 'https://picsum.photos/400/400?random=3',
          caption: 'Adventure awaits! 🏔️',
          likes: 78,
          comments: ['Where is this?', 'So beautiful!'],
          timestamp: '1 day ago',
        ),
      ];
    });
  }

  void _logout() async {
    await AuthService.logout();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Media'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildHomeFeed();
      case 1:
        return _buildSearchScreen();
      case 2:
        return _buildAddPostScreen();
      case 3:
        return _buildLikesScreen();
      case 4:
        return _buildProfileScreen();
      default:
        return _buildHomeFeed();
    }
  }

  Widget _buildHomeFeed() {
    return RefreshIndicator(
      onRefresh: () async {
        _loadPosts();
      },
      child: ListView(
        children: [
          _buildStoriesSection(),
          Divider(),
          ..._posts.map((post) => PostWidget(post: post)).toList(),
        ],
      ),
    );
  }

  Widget _buildStoriesSection() {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/60/60?random=${index + 10}',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'User ${index + 1}',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 100, color: Colors.grey),
          Text('Search Screen', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }

  Widget _buildAddPostScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_a_photo, size: 100, color: Colors.grey),
          Text('Add Post Screen', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }

  Widget _buildLikesScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite, size: 100, color: Colors.grey),
          Text('Likes Screen', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }

  Widget _buildProfileScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            child: Icon(Icons.person, size: 50),
          ),
          SizedBox(height: 20),
          Text(
            _userName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Welcome to your profile!'),
        ],
      ),
    );
  }
}

// models/post_model.dart
class Post {
  final String id;
  final String username;
  final String imageUrl;
  final String caption;
  int likes;
  final List<String> comments;
  final String timestamp;

  Post({
    required this.id,
    required this.username,
    required this.imageUrl,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.timestamp,
  });
}

// widgets/post_widget.dart
class PostWidget extends StatefulWidget {
  final Post post;

  PostWidget({required this.post});

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _loadLikeStatus();
  }

  void _loadLikeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLiked = prefs.getBool('liked_${widget.post.id}') ?? false;
    });
  }

  void _toggleLike() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        widget.post.likes++;
      } else {
        widget.post.likes--;
      }
    });
    await prefs.setBool('liked_${widget.post.id}', _isLiked);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://picsum.photos/40/40?random=${widget.post.id}',
              ),
            ),
            title: Text(widget.post.username),
            subtitle: Text(widget.post.timestamp),
            trailing: Icon(Icons.more_vert),
          ),
          Image.network(
            widget.post.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        _isLiked ? Icons.favorite : Icons.favorite_border,
                        color: _isLiked ? Colors.red : null,
                      ),
                      onPressed: _toggleLike,
                    ),
                    IconButton(
                      icon: Icon(Icons.comment),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ],
                ),
                Text(
                  '${widget.post.likes} likes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: widget.post.username,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' ${widget.post.caption}'),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                if (widget.post.comments.isNotEmpty)
                  Text(
                    'View all ${widget.post.comments.length} comments',
                    style: TextStyle(color: Colors.grey),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}