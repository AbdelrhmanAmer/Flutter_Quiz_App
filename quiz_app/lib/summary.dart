import 'package:flutter/material.dart';
class Summary extends StatelessWidget {
  const Summary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map((e)=>Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: e['user_answer'] != e['correct_answer']
                         ? Colors.red[300]
                          : Colors.green,
                      child: Text(((e['question_index'] as int) +1 ).toString()),
                    ),
                    const SizedBox(width: 15,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e['question'].toString(),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 250, 205, 254),
                            ),
                          ),
                          Text(
                            e['user_answer'].toString() ,
                            style: const TextStyle(
                              color: Color.fromARGB(146, 250, 205, 254),
                            ),
                          ),
                          Text(
                            e['correct_answer'].toString(),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 49, 167, 203),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,)
              ],
            )),

          ],
        ),
      ),
    );
  }
}
