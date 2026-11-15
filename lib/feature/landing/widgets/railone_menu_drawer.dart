import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class RailOneMenuDrawer extends StatelessWidget {
  const RailOneMenuDrawer({
    super.key,
    required this.onSelectItem,
  });

  final ValueChanged<String> onSelectItem;

  static const _menuItems = <(IconData, String)>[
    (Icons.train_outlined, 'Indian Railways Services'),
    (Icons.support_agent_outlined, 'Rail Madad Helpdesk'),
    (Icons.fastfood_outlined, 'IRCTC e-Catering'),
    (Icons.hotel_outlined, 'Retiring Rooms & Lounge'),
    (Icons.notifications_none, 'Notification Settings'),
    (Icons.security_outlined, 'Privacy & Terms'),
    (Icons.info_outline, 'About RailOne'),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 290,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'assets/railone.png',
                        height: 26,
                        fit: BoxFit.contain,
                        semanticLabel: 'RailOne',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 22),
                    color: AppColors.navy,
                    tooltip: 'Close menu',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: _menuItems.length,
                separatorBuilder: (_, _) => const SizedBox(height: 2),
                itemBuilder: (context, index) {
                  final (icon, title) = _menuItems[index];
                  return ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 2,
                    ),
                    leading: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F5F9),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Icon(
                        icon,
                        color: AppColors.primary,
                        size: 18,
                      ),
                    ),
                    title: Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'MyanmarKhyay',
                        fontWeight: FontWeight.w500,
                        fontSize: 13.5,
                        color: AppColors.navy,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      onSelectItem(title);
                    },
                  );
                },
              ),
            ),
            const Divider(height: 1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                'RailOne • Indian Railways',
                style: TextStyle(
                  fontFamily: 'MyanmarKhyay',
                  fontSize: 12,
                  color: AppColors.mutedText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
