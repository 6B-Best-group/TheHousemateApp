class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Details'),
              Tab(text: 'Maintenance'),
              Tab(text: 'Notifications'),
              Tab(text: 'Housemates'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RulesTab(),
            MaintenanceTab(),
            NotificationsTab(),
            HousematesTab(),
          ],
        ),
      ),
    );
  }
}

class RulesTab extends StatelessWidget {
  const RulesTab({super.key});

  @override
  Widget build(BuildContext context) {
    const rules = [
      'No smoking inside the house.',
      'Wash the dishes after use.',
      'Follow the cleaning chores if it’s your day.',
      'Keep noise levels low after 10 PM.',
      'Respect each other’s privacy.',
      'Turn off lights when not in use.',
      'No pets allowed without prior agreement.',
    ];

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: rules
          .map((rule) => ListTile(
                leading: const Icon(Icons.rule, color: Colors.deepPurple),
                title: Text(rule),
              ))
          .toList(),
    );
  }
}

class MaintenanceTab extends StatefulWidget {
  const MaintenanceTab({super.key});

  @override
  State<MaintenanceTab> createState() => _MaintenanceTabState();
}

class _MaintenanceTabState extends State<MaintenanceTab> {
  final List<String> pendingRequests = [
    'Fix the leaking sink.',
    'Replace the broken window.',
    'Repair the heater.',
  ];

  final List<String> resolvedRequests = [
    'Fixed the door lock.',
    'Repaired the ceiling fan.',
    'Replaced the light bulb in the kitchen.',
  ];

  void addRequest(String request) {
    setState(() => pendingRequests.add(request));
  }

  void recallRequest(int index) {
    setState(() {
      pendingRequests.add(resolvedRequests[index]);
      resolvedRequests.removeAt(index);
    });
  }

  void showAddRequestDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add New Request'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter your request'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                addRequest(controller.text.trim());
              }
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Pending'),
              Tab(text: 'Resolved'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RequestList(
              requests: pendingRequests,
              icon: Icons.pending,
              iconColor: Colors.orange,
              floatingActionButton: FloatingActionButton(
                onPressed: showAddRequestDialog,
                child: const Icon(Icons.add),
              ),
            ),
            RequestList(
              requests: resolvedRequests,
              icon: Icons.check_circle,
              iconColor: Colors.green,
              trailingBuilder: (index) => ElevatedButton(
                onPressed: () => recallRequest(index),
                child: const Text('Recall'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RequestList extends StatelessWidget {
  final List<String> requests;
  final IconData icon;
  final Color iconColor;
  final Widget Function(int index)? trailingBuilder;
  final FloatingActionButton? floatingActionButton;

  const RequestList({
    super.key,
    required this.requests,
    required this.icon,
    required this.iconColor,
    this.trailingBuilder,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: requests.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(icon, color: iconColor),
              title: Text(requests[index]),
              trailing: trailingBuilder?.call(index),
            );
          },
        ),
        if (floatingActionButton != null)
          Positioned(
            bottom: 16,
            right: 16,
            child: floatingActionButton!,
          ),
      ],
    );
  }
}

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final pinnedNotifications = [
      {
        'title': 'Rent Payment',
        'icon': Icons.attach_money,
        'date': 'Due: Wed 17th',
        'details': '5/8 people have paid. Total: \$2000',
      },
      {
        'title': 'Plumbing Inspection',
        'icon': Icons.water_drop,
        'date': 'Wed 17th',
      },
      {
        'title': 'Fire Drill',
        'icon': Icons.fire_extinguisher,
        'date': 'Fri 19th',
      },
    ];

    final recentNotifications = [
      {
        'title': 'Electricity Maintenance',
        'icon': Icons.electrical_services,
        'date': 'Mon 15th',
      },
      {
        'title': 'Gardening Service',
        'icon': Icons.grass,
        'date': 'Tue 16th',
      },
      {
        'title': 'Party Announcement',
        'icon': Icons.celebration,
        'date': 'Sat 20th',
        'details': 'House party at 8 PM. Don’t miss it!',
      },
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Admin Only'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Pinned'),
              Tab(text: 'Recent'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            NotificationList(notifications: pinnedNotifications),
            NotificationList(notifications: recentNotifications),
          ],
        ),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  final List<Map<String, dynamic>> notifications;

  const NotificationList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Icon(notification['icon'], color: Colors.deepPurple),
            title: Text(notification['title']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification['date']),
                if (notification.containsKey('details'))
                  Text(notification['details'] ?? ''),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HousematesTab extends StatefulWidget {
  const HousematesTab({super.key});

  @override
  State<HousematesTab> createState() => _HousematesTabState();
}

class _HousematesTabState extends State<HousematesTab> {
  final bool isAdmin = true; // Simulate admin access. Replace with actual role-checking logic.

  final List<Map<String, String>> housemates = [
    {'name': 'Alice', 'profession': 'Engineer', 'preferences': 'Non-smoker, Loves hiking'},
    {'name': 'Bob', 'profession': 'Doctor', 'preferences': 'Non-smoker, Enjoys cooking'},
    {'name': 'Clara', 'profession': 'Designer', 'preferences': 'Smoker, Loves painting'},
    {'name': 'David', 'profession': 'Teacher', 'preferences': 'Non-smoker, Watches football'},
    {'name': 'Eve', 'profession': 'Artist', 'preferences': 'Non-smoker, Enjoys reading'},
  ];

  void _addOrEditHousemate({Map<String, String>? existingHousemate, int? index}) {
    final controllers = {
      'name': TextEditingController(text: existingHousemate?['name'] ?? ''),
      'profession': TextEditingController(text: existingHousemate?['profession'] ?? ''),
      'preferences': TextEditingController(text: existingHousemate?['preferences'] ?? ''),
    };

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(existingHousemate == null ? 'Add New Housemate' : 'Edit Housemate'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: controllers.entries.map((entry) {
            return TextField(
              controller: entry.value,
              decoration: InputDecoration(labelText: entry.key.capitalize()),
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controllers.values.every((controller) => controller.text.isNotEmpty)) {
                setState(() {
                  final newHousemate = {
                    'name': controllers['name']!.text,
                    'profession': controllers['profession']!.text,
                    'preferences': controllers['preferences']!.text,
                  };
                  if (existingHousemate == null) {
                    housemates.add(newHousemate);
                  } else if (index != null) {
                    housemates[index] = newHousemate;
                  }
                });
                Navigator.pop(context);
              }
            },
            child: Text(existingHousemate == null ? 'Add' : 'Save'),
          ),
        ],
      ),
    );
  }

  void _deleteHousemate(int index) {
    setState(() {
      housemates.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: housemates.length,
        itemBuilder: (context, index) {
          final housemate = housemates[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: const Text('👤', style: TextStyle(fontSize: 30)), // Emoji for profile
              title: Text(housemate['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Profession: ${housemate['profession']!}\nPreferences: ${housemate['preferences']!}'),
              trailing: isAdmin
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _addOrEditHousemate(existingHousemate: housemate, index: index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteHousemate(index),
                        ),
                      ],
                    )
                  : null, // Hide edit/delete buttons if not admin
            ),
          );
        },
      ),
      floatingActionButton: isAdmin
          ? FloatingActionButton(
              onPressed: () => _addOrEditHousemate(),
              child: const Icon(Icons.add),
            )
          : null, // Hide the add button if not admin
    );
  }
}

extension StringExtension on String {
  String capitalize() => this[0].toUpperCase() + substring(1);
}
