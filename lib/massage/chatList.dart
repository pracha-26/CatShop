import 'package:flutter/material.dart';

import '../main.dart';
import '../trolley/trolley.dart';
import 'chat.dart';

class ChatList extends StatelessWidget {
  final List<ChatMessage> chatMessages = [
    ChatMessage("John", "Hello", DateTime.now()),
    ChatMessage("Alice", "Hi there", DateTime.now()),
    ChatMessage("Bob", "How are you?", DateTime.now()),
    // เพิ่มรายการแชทเพิ่มเติมตามต้องการ
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat List"),
      ),
      body: ListView.builder(
        itemCount: chatMessages.length,
        itemBuilder: (BuildContext context, int index) {
          ChatMessage message = chatMessages[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(message.sender[0]),
              ),
              title: Text(message.sender),
              subtitle: Text(message.text),
              trailing: Text(message.time.toString()),
              onTap: () {
                // กำหนดการกระทำเมื่อคลิกที่รายการแชท
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context) => Chat())
                  );
                print("คุณคลิกที่รายการแชทของ ${message.sender}");
              },
            ),
          );
        },
      ),

      
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.search_sharp),
                onPressed: () {
                  // Navigator.push(
                  //   context,MaterialPageRoute(builder: (context) => ProductSearchPage()),
                  // );
                },
              ),
              IconButton(
                icon: Icon(Icons.message),
                onPressed: () {
                  // Navigator.push(
                  //   context,MaterialPageRoute(builder: (context) => ChatList()),
                  // );
                  // Handle search button press
                },
              ),
              SizedBox(width: 56.0),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context) => Trolley()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Navigator.push(
                  //   context,MaterialPageRoute(builder: (context) => UserProfilePage())
                  // );
                  // Handle settings button press
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popUntil(context, (route) => route.isFirst);
          // Handle FloatingActionButton press
        },
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

class ChatMessage {
  final String sender;
  final String text;
  final DateTime time;

  ChatMessage(this.sender, this.text, this.time);
}
