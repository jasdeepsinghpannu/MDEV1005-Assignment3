import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Assignment'),
        backgroundColor:
            Color.fromARGB(255, 171, 81, 181), // Customize AppBar color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 236, 179, 252),
              Color.fromARGB(255, 181, 143, 166)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to the flutter Assignment',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 17, 2, 11),
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Go to About Page',
                backgroundColor: Color.fromARGB(255, 120, 66, 107),
                textColor: Colors.white,
                onPressed: () => Navigator.pushNamed(context, '/about'),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Go to Contact Page',
                backgroundColor: Color.fromARGB(255, 128, 61, 120),
                textColor: Colors.white,
                onPressed: () => Navigator.pushNamed(context, '/contact'),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Go to Calculator',
                backgroundColor: Color.fromARGB(255, 120, 66, 107),
                textColor: Colors.white,
                onPressed: () => Navigator.pushNamed(context, '/calculator'),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Check Weather',
                backgroundColor: Color.fromARGB(255, 120, 66, 107),
                textColor: Colors.white,
                onPressed: () => Navigator.pushNamed(context, '/weather'),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Manage Notes',
                backgroundColor: Color.fromARGB(255, 120, 66, 107),
                textColor: Colors.white,
                onPressed: () => Navigator.pushNamed(context, '/notes'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  CustomButton({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: _isHovered
                ? widget.backgroundColor.withOpacity(0.8)
                : widget.backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
