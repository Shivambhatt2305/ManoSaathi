import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

// Custom AppBar Widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;

  const CustomAppBar({
    required this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            )
          : null,
      actions: actions,
      backgroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

// Quick Action Card
class QuickActionCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color iconColor;

  const QuickActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.backgroundColor = AppColors.primary,
    this.iconColor = AppColors.white,
    Key? key,
  }) : super(key: key);

  @override
  State<QuickActionCard> createState() => _QuickActionCardState();
}

class _QuickActionCardState extends State<QuickActionCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
    widget.onTap();
  }

  void _onTapCancel() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 1.0, end: 0.95).animate(_animationController),
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: Card(
          color: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  widget.backgroundColor,
                  widget.backgroundColor.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(widget.icon, size: 40, color: widget.iconColor),
                const SizedBox(height: 12),
                Column(
                  children: [
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Module Card
class ModuleCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;
  final String? badgeCount;

  const ModuleCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
    this.badgeCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border(
              left: BorderSide(color: AppColors.primary, width: 4),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.accentLight.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppColors.accentLight, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.mediumGray,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (badgeCount != null)
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    badgeCount!,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              const SizedBox(width: 12),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.mediumGray,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Chat Bubble Widget
class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final DateTime timestamp;

  const ChatBubble({
    required this.message,
    required this.isUser,
    required this.timestamp,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser ? AppColors.primary : AppColors.lightGray,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isUser ? 16 : 0),
            bottomRight: Radius.circular(isUser ? 0 : 16),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: isUser
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isUser ? AppColors.white : AppColors.darkGray,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _formatTime(timestamp),
              style: TextStyle(
                color: isUser
                    ? AppColors.white.withOpacity(0.7)
                    : AppColors.mediumGray,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}

// Mood Selector Widget
class MoodSelector extends StatefulWidget {
  final Function(int, String) onMoodSelected;

  const MoodSelector({required this.onMoodSelected, Key? key})
    : super(key: key);

  @override
  State<MoodSelector> createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  int? selectedMood;

  final moods = [
    {'emoji': '😄', 'label': 'Excellent', 'score': 10},
    {'emoji': '😊', 'label': 'Good', 'score': 8},
    {'emoji': '😐', 'label': 'Okay', 'score': 5},
    {'emoji': '😕', 'label': 'Bad', 'score': 3},
    {'emoji': '😢', 'label': 'Terrible', 'score': 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'How are you feeling?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.darkGray,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(moods.length, (index) {
            final mood = moods[index];
            final isSelected = selectedMood == index;

            return GestureDetector(
              onTap: () {
                setState(() => selectedMood = index);
                widget.onMoodSelected(
                  mood['score'] as int,
                  mood['emoji'] as String,
                );
              },
              child: AnimatedScale(
                scale: isSelected ? 1.2 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? AppColors.primary.withOpacity(0.1)
                        : transparent,
                    border: Border.all(
                      color: isSelected ? AppColors.primary : transparent,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        mood['emoji'] as String,
                        style: const TextStyle(fontSize: 32),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        mood['label'] as String,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.mediumGray,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

// Crisis Alert Widget
class CrisisAlert extends StatelessWidget {
  final VoidCallback onCallHelpline;
  final VoidCallback onContactEmergency;

  const CrisisAlert({
    required this.onCallHelpline,
    required this.onContactEmergency,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.danger,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.danger.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            children: [
              Icon(Icons.warning_rounded, color: AppColors.white, size: 24),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'We\'re concerned about your safety',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Please reach out to someone who can help immediately.',
            style: TextStyle(color: AppColors.white, fontSize: 14),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onCallHelpline,
                  icon: const Icon(Icons.phone),
                  label: const Text('Call Helpline'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    foregroundColor: AppColors.danger,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onContactEmergency,
                  icon: const Icon(Icons.contact_emergency),
                  label: const Text('Emergency Contact'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.white,
                    side: const BorderSide(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const transparent = Color(0x00000000);
