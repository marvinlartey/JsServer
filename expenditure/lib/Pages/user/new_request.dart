import 'package:flutter/material.dart';

class NewRequest extends StatelessWidget {
  const NewRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
        title: const Text('NEW REQUEST'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: const [
                Text('How much?', style: TextStyle(fontSize: 18)),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('GHc')),
            ),
            const SizedBox(
              height: 55,
            ),
            Row(
              children: const [
                Text('What for?', style: TextStyle(fontSize: 18)),
              ],
            ),
            TextFormField(
              minLines: 1,
              maxLines: 5,
              //expands: true,
              decoration: const InputDecoration(label: Text('Purpose')),
            ),
            const SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(55))),
                  onPressed: Navigator.of(context).pop,
                  child: const Text('Make Request',
                      style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(
                  width: 55,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(55))),
                  onPressed: Navigator.of(context).pop,
                  child: const Text('Cancel', style: TextStyle(fontSize: 18)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
