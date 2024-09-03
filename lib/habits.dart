import 'package:flutter/material.dart';
import 'constants.dart';
import 'setting.dart';

class Habits extends StatefulWidget {
  const Habits({super.key});

  @override
  State<StatefulWidget> createState() => _HabitsState();
}

class _HabitsState extends State<Habits> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue, // Border color
          width: 2.0, // Border width
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: GridView.count(
        crossAxisCount: 4,
        children: [
          Container(
            child: _buildIconButton(context, walking, _showForm),
          ),
          //SizedBox(height: 5.0, width: 5.0,),
          Container(
            child: _buildIconButton(context, water, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Setting()),
              ).then((_) => null);
            }),
          ),
          Container(
            child: _buildIconButton(context, eatVeggies, _showForm),
          ),
          Container(
            child: _buildIconButton(context, exercise, _showForm),
          ),
          Container(
            child: _buildIconButton(context, earlyWakeup, _showForm),
          ),
          Container(
            child: _buildIconButton(context, earlyToBed, _showForm),
          ),
          Container(
            child: _buildIconButton(context, meditate, _showForm),
          ),
          Container(
            child: _buildIconButton(context, eatBreakfast, _showForm),
          ),
          Container(
            child: _buildIconButton(context, readBook, _showForm),
          ),
          Container(
            child: _buildIconButton(context, swim, _showForm),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(
      BuildContext context, String imagePath, VoidCallback onPressed) {
    return IconButton(
      icon: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: Image.asset(
          imagePath,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
      onPressed: onPressed,
      iconSize: 100.0,
    );
  }

  void _showForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final _formKey = GlobalKey<FormState>();

        return AlertDialog(
          title: Text('Customize Your Task'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Frequency'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the frequency.';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  print('Submitted');
                  Navigator.pop(context);
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
