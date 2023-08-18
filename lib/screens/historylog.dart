import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CallLogScreen extends StatefulWidget {
  @override
  _CallLogScreenState createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen> {
  List<CallLogEntry> callLogs = [];

  @override
  void initState() {
    super.initState();
    _getCallLogs();
  }

  Future<void> _getCallLogs() async {
    if (await Permission.contacts.request().isGranted) {
      Iterable<CallLogEntry> entries = await CallLog.query();
      setState(() {
        callLogs = entries.toList();
      });
    } else {
      // Handle permission denied scenario
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: callLogs.length,
      itemBuilder: (context, index) {
        CallLogEntry entry = callLogs[index];
        return ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/personavt.webp'),
            radius: 20.0,
          ),
          trailing: Icon(entry.callType == CallType.incoming
              ? Icons.call_received
              : entry.callType == CallType.outgoing
                  ? Icons.call_made
                  : Icons.call_missed),
          title: Text(entry.name ?? entry.number ?? ''),
          subtitle: Text(_formatTimestamp(entry.timestamp) ?? ''),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 2,
        );
      },
    );
  }

  String _formatTimestamp(int? timestamp) {
    if (timestamp == null) return '';

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedDate = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    return formattedDate;
  }
}
