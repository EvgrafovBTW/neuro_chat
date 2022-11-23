import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:neuro_chat/colors.dart';

class ChatAppBar extends StatelessWidget with PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white70,
      leading: Container(
        decoration: BoxDecoration(
            color: appPrimaryColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: PopupMenuButton(
          icon: const Icon(Icons.menu),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: const Center(child: Text("Logout")),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            PopupMenuItem(
              child: const Center(child: Text("Settings")),
              onTap: () {
                // Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 80,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12,
                    ),
                    child: const Icon(Icons.person),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Чат-бот',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.lock_person))
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
