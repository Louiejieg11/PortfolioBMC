import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Navigation',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: const Color(0xFFE5D5CC),
      ),
      home: const ProjectScreen(),
    );
  }
}

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  void navigateNext() {
    if (currentIndex < screens.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void navigatePrevious() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(Icons.person, size: 60),
          ),
          const SizedBox(height: 20),
          const Text(
            'GONZALES, LOUIEJIE A.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '"Code it like you own it!" Own every line, every algorithm, every challenge. Because the digital world bends to the will of those who dare to wield it.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          const ContactInfo(
            icon: Icons.email,
            text: 'Louiejieg@gmail.com',
          ),
          const ContactInfo(
            icon: Icons.phone,
            text: '09456165464',
          ),
          const ContactInfo(
            icon: Icons.location_on,
            text: '#68 zigzag hills malhancan meycauayan city',
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (context.findAncestorStateOfType<_ProjectScreenState>() != null) {
                context.findAncestorStateOfType<_ProjectScreenState>()!.navigateNext();
              }
            },
            child: const Text('next'),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'PROJECT',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          const SizedBox(height: 20),
          ProjectCard(
            title: 'YouTube',
            onVisit: () {
              if (context.findAncestorStateOfType<_ProjectScreenState>() != null) {
                context.findAncestorStateOfType<_ProjectScreenState>()!.navigateNext();
              }
            },
          ),
          const SizedBox(height: 20),
          ProjectCard(
            title: 'hongkiat',
            onVisit: () {
              if (context.findAncestorStateOfType<_ProjectScreenState>() != null) {
                context.findAncestorStateOfType<_ProjectScreenState>()!.navigateNext();
              }
            },
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (context.findAncestorStateOfType<_ProjectScreenState>() != null) {
                    context.findAncestorStateOfType<_ProjectScreenState>()!.navigatePrevious();
                  }
                },
                child: const Text('previous'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'YOUTUBE',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Thousands of design portfolios exist on the internet, each with a talented designer behind them looking to attract clients. To stand out, your portfolio must be unique, compelling, and skills-driven...',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (context.findAncestorStateOfType<_ProjectScreenState>() != null) {
                context.findAncestorStateOfType<_ProjectScreenState>()!.navigatePrevious();
              }
            },
            child: const Text('previous'),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final VoidCallback onVisit;

  const ProjectCard({
    super.key,
    required this.title,
    required this.onVisit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: onVisit,
            child: const Text('visit'),
          ),
        ],
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactInfo({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
