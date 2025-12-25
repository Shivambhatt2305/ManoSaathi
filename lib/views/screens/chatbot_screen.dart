import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';
import '../../widgets/custom_widgets.dart';
import '../../controllers/app_controllers.dart';
import '../../models/app_models.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final ChatController _chatController = ChatController();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _sendInitialGreeting();
  }

  void _sendInitialGreeting() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final greeting = await _chatController.sendMessage("Hi");
    // Override with custom greeting
    _chatController.messages.clear();
    _chatController.messages.add(
      ChatMessage(
        id: '1',
        content:
            'नमस्ते! Welcome to Manoसाथी. I\'m here to support you. How are you feeling today?',
        timestamp: DateTime.now(),
        isUser: false,
      ),
    );
    setState(() {});
  }

  void _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    setState(() => _isSending = true);

    final userText = _messageController.text;
    _messageController.clear();

    final response = await _chatController.sendMessage(userText);

    // Check for crisis
    if (_chatController.detectCrisis(userText)) {
      if (mounted) {
        _showCrisisAlert();
      }
    }

    setState(() => _isSending = false);
    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _showCrisisAlert() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: CrisisAlert(
          onCallHelpline: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Calling helpline: 1800-273-8255')),
            );
          },
          onContactEmergency: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Notifying emergency contact...')),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Mano',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'साथी',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.accentVeryLight,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Your AI Wellness Companion',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppColors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(child: Text('Clear History')),
              const PopupMenuItem(child: Text('Export Chat')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _chatController.messages.isEmpty
                ? Center(
                    child: Text(
                      'Start a conversation',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: _chatController.messages.length,
                    itemBuilder: (context, index) {
                      final message = _chatController.messages[index];
                      return Column(
                        children: [
                          ChatBubble(
                            message: message.content,
                            isUser: message.isUser,
                            timestamp: message.timestamp,
                          ),
                          if (message.sentiment != null && !message.isUser)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Detected: ${message.sentiment} (Stress: ${message.stressScore?.toStringAsFixed(0)}%)',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: AppColors.mediumGray.withOpacity(
                                      0.7,
                                    ),
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        12 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.mediumGray.withOpacity(0.2),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Tell me what\'s on your mind...',
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.mediumGray.withOpacity(0.6),
                        ),
                      ),
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                      maxLines: null,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.mic),
                    color: AppColors.primary,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Voice input coming soon!'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: _isSending
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.white,
                        ),
                      ),
                    )
                  : const Icon(Icons.send),
              color: AppColors.white,
              onPressed: _isSending ? null : _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
