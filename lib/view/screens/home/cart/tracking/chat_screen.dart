import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/model/chat_message_model.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Hello chatGPT how are you today?",
      isUser: true,
      time: "9:41",
    ),
    ChatMessage(
      text: "Hello. I'm fine, how can I help you?",
      isUser: false,
      time: "9:41",
    ),
    ChatMessage(
      text: "What is the best programming language?",
      isUser: true,
      time: "9:41",
    ),
    ChatMessage(
      text: "There are many programming languages in the market that are used in designing and building websites, various applications and other tasks. All these languages are popular in their place and in the way they are used, and many programmers learn and use them.",
      isUser: false,
      time: "9:41",
    ),
    ChatMessage(
      text: "So explain to me more",
      isUser: true,
      time: "9:41",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 18.h,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.sp),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        AppLocalizations.of(context)!.chat, // Translated
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1.h,
                  thickness: 1.h,
                  color: Color(0xFFECECEC),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessage(ChatMessage message) {
    return Column(
      crossAxisAlignment: message.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 4.h),
          child: Row(
            mainAxisAlignment: message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: 0.75.sw,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: message.isUser
                      ? Color(0xFF4CAF50)
                      : Color(0xFFEEEEEE),
                  borderRadius: _getBorderRadius(message.isUser),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.text,
                      style: TextStyle(
                        color: message.isUser ? Colors.white : Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      message.time,
                      style: TextStyle(
                        color: message.isUser ? Colors.white : Colors.black,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  BorderRadius _getBorderRadius(bool isUser) {
    return BorderRadius.only(
      topLeft: Radius.circular(20.r),
      topRight: Radius.circular(20.r),
      bottomLeft: isUser ? Radius.circular(20.r) : Radius.circular(4.r),
      bottomRight: isUser ? Radius.circular(4.r) : Radius.circular(20.r),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
      child: Center(
        child: Container(
          width: 0.79.sw,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, -1),
              )
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.writeYourMessage, // Translated
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xFFA1A1A1),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(6.r),
                child: IconButton(
                  icon: Icon(Icons.send,
                    color: Color(0xFF25AE4B),
                    size: 24.sp,
                  ),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      setState(() {
                        _messages.add(ChatMessage(
                          text: _messageController.text,
                          isUser: true,
                          time: "now",
                        ));
                        _messageController.clear();
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}