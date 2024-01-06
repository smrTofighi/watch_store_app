import 'package:flutter/material.dart';

import '../components/text_style.dart';
import '../res/strings.dart';

class RegisterationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RegisterationAppBar({
    super.key,
    required this.size,
  });
  final Size size;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(size.width, size.height * 1),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          const Text(
            AppString.register,
            style: LightAppTextStyles.title,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size.height * 1);
}
