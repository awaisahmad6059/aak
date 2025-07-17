import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class MyContact extends StatefulWidget {
  @override
  _MyContactState createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showWhatsAppDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Phone Number'),
          content: TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: 'Enter WhatsApp Number'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Open WhatsApp'),
              onPressed: () {
                final phone = _phoneController.text;
                _launchURL('https://wa.me/$phone');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showCallDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Phone Number'),
          content: TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: 'Enter Phone Number'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Call'),
              onPressed: () {
                final phone = _phoneController.text;
                _launchURL('tel:$phone');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showMessageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Phone Number'),
          content: TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: 'Enter Phone Number'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Message'),
              onPressed: () {
                final phone = _phoneController.text;
                _launchURL('sms:$phone');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEmailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Email Address'),
          content: TextField(
            controller: _phoneController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: 'e.g. example@gmail.com'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Send Email'),
              onPressed: () {
                final email = _phoneController.text;
                _launchURL('mailto:$email');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showOpenURLDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter URL'),
          content: TextField(
            controller: _urlController,
            keyboardType: TextInputType.url,
            decoration: InputDecoration(hintText: 'e.g. https://example.com'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Open URL'),
              onPressed: () {
                final url = _urlController.text;
                _launchURL(url);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Contact', style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 105,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 9),
                  ),
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.5,
                    backgroundImage: AssetImage('assets/contact.png'),
                  ),
                ),
                SizedBox(height: 0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Kamyana786',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 80,
            bottom: 0,
            left: 0,
            right: 0,
            child: SlidingSheet(
              elevation: 8,
              cornerRadius: 50,
              snapSpec: const SnapSpec(
                snap: true,
                snappings: [0.38, 0.7, 1.0],
                positioning: SnapPositioning.relativeToAvailableSpace,
              ),
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildFloatingActionButton(
                              onPressed: () => _showWhatsAppDialog(context),
                              icon: FontAwesomeIcons.whatsapp,
                              label: 'WhatsApp',
                            ),
                            _buildFloatingActionButton(
                              onPressed: () => _showCallDialog(context),
                              icon: Icons.phone,
                              label: 'Call',
                            ),
                            _buildFloatingActionButton(
                              onPressed: () => _showMessageDialog(context),
                              icon: Icons.message,
                              label: 'Message',
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildFloatingActionButton(
                              onPressed: () => _showEmailDialog(context),
                              icon: Icons.email,
                              label: 'Email',
                            ),
                            _buildFloatingActionButton(
                              onPressed: () => _showOpenURLDialog(context),
                              icon: Icons.link,
                              label: 'Open URL',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
  }) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 10)),
        ],
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }
}
