import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class SMSScreen extends StatefulWidget {
  const SMSScreen({Key? key}) : super(key: key);

  @override
  State<SMSScreen> createState() => _SMSScreenState();
}

class _SMSScreenState extends State<SMSScreen> {
  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _fetchMessages();
  }

  Future<void> _fetchMessages() async {
    var permissionStatus = await Permission.sms.status;
    if (permissionStatus.isGranted) {
      final messages = await _query.querySms(
        kinds: [
          SmsQueryKind.inbox,
          SmsQueryKind.sent,
        ],
      );
      setState(() => _messages = messages);
    } else {
      if (permissionStatus.isDenied) {
        _showPermissionDeniedDialog();
      }
      var permissionRequest = await Permission.sms.request();
      if (permissionRequest.isGranted) {
        await _fetchMessages();
      }
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Permission Denied'),
          content: const Text('SMS permission is required to read messages.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: _messages.isNotEmpty
            ? _MessagesListView(
                messages: _messages,
              )
            : const Center(
                child: Text(
                  'No messages to show.\n Tap refresh button...',
                  textAlign: TextAlign.center,
                ),
              ),
      ),
    );
  }
}

class _MessagesListView extends StatelessWidget {
  _MessagesListView({
    Key? key,
    required this.messages,
  }) : super(key: key);

  final List<SmsMessage> messages;
  final datetoday = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: messages.length,
      itemBuilder: (BuildContext context, int i) {
        var message = messages[i];

        return Card(
          elevation: 2.0,
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: ListTile(
              contentPadding: const EdgeInsets.all(10.0),
              title: Text(
                '${message.sender}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                '${message.body}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14.0),
              ),
              trailing: Column(
                children: [
                  Text(
                    '${message.date?.day}/${message.date?.month}/${message.date?.year}',
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Icon(
                    Icons.message,
                    color: Colors.blue,
                  ),
                ],
              ),
              onTap: () async {
                Uri sms = Uri.parse('sms:${message.sender}');
                if (await canLaunchUrl(sms)) {
                  await launchUrl(sms);
                  // print("URL clicked");
                } else {
                  // print("URL launch failed");
                }
              }),
        );
      },
    );
  }
}
