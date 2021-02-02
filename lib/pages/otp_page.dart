import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;

  const OtpPage({Key key, @required this.phoneNumber});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  // pinput field dependencies
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  //

  @override
  Widget build(BuildContext context) {
    // pinput dependencies
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color.fromRGBO(25, 21, 99, 1),
      borderRadius: BorderRadius.circular(20.0),
    );
    //

    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'Verify +88-${widget.phoneNumber}',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: PinPut(
                eachFieldWidth: 40.0,
                eachFieldHeight: 50.0,
                withCursor: true,
                fieldsCount: 6,
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                // onSubmit: (String pin) => _showSnackBar(pin),
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.scale,
                textStyle: const TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  // Navigator.of(context).push(
                  // MaterialPageRoute(
                  //   builder: (context) => OtpPage(
                  //     phoneNumber: _phoneController.text,
                  //   ),
                  // ),
                  // );
                  print(_pinPutController.text);
                },
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
