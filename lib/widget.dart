import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  final Map<String, dynamic> post;
  PostWidget({required this.post});

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLiked = false;
  int likesCount = 0;
  final TextEditingController _commentController = TextEditingController();
  List<String> comments = [];

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        comments.add(_commentController.text);
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(widget.post["user"], style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Image.network(widget.post["image"], fit: BoxFit.cover, width: double.infinity, height: 300),
        Row(
          children: [
            IconButton(
              icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border, color: isLiked ? Colors.red : Colors.black),
              onPressed: () => setState(() {
                isLiked = !isLiked;
                isLiked ? likesCount++ : likesCount--;
              }),
            ),
            Text("$likesCount curtidas", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(widget.post["caption"]),
        ),


        ...comments.map((c) => Padding(
          padding: EdgeInsets.only(left: 10, top: 5),
          child: Text("Comentário: $c", style: TextStyle(fontSize: 12, color: Colors.grey[700])),
        )),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(hintText: "Adicione um comentário..."),
                ),
              ),
              IconButton(icon: Icon(Icons.send), onPressed: _addComment),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}