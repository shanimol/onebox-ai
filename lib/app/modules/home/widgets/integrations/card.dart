import 'package:flutter/material.dart';
import 'package:google_sign_in_web/web_only.dart' as web;

class IntegrationCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isConnected;
  final Widget icon;
  final VoidCallback onConnectPressed;
  final bool isGoogle;

  const IntegrationCard({
    Key? key,
    required this.title,
    required this.description,
    required this.isConnected,
    required this.onConnectPressed,
    required this.icon,
    this.isGoogle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                icon,
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (isConnected)
                  Row(
                    children: [
                      const Icon(Icons.check, color: Colors.green),
                      const SizedBox(width: 4),
                      const Text('Connected',
                          style: TextStyle(color: Colors.green)),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Handle disconnect action
                        },
                        child: const Text('Disconnect'),
                      ),
                    ],
                  )
                else if (isGoogle)
                  buildSignInButton()
                else
                  ElevatedButton(
                    onPressed: onConnectPressed,
                    child: const Text('Connect'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSignInButton() {
    return web.renderButton();
  }
}
