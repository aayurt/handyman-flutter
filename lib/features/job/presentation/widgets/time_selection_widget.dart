import 'package:flutter/material.dart';

class TimeSelectionWidget extends StatefulWidget {
  final List<DateTime> dateList;
  final Map<DateTime, List<String>> selectedTimeSlots;
  final Function setSelectedTimeSlots;
  final bool editable;
  const TimeSelectionWidget(
      {super.key,
      required this.dateList,
      required this.selectedTimeSlots,
      required this.setSelectedTimeSlots,
      this.editable = true});

  @override
  _TimeSelectionWidgetState createState() => _TimeSelectionWidgetState();
}

class _TimeSelectionWidgetState extends State<TimeSelectionWidget> {
  List<DateTime> selectedDates = [];

  List<String> availableTimeSlots = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedDates = widget.dateList;
    });
  }

  void toggleTimeSlot(DateTime date, String timeSlot) {
    if (widget.editable) {
      Map<DateTime, List<String>> newSelectedTimeSlots =
          widget.selectedTimeSlots;

      if (!newSelectedTimeSlots.containsKey(date)) {
        newSelectedTimeSlots[date] = [timeSlot];
      } else {
        if (newSelectedTimeSlots[date]!.contains(timeSlot)) {
          newSelectedTimeSlots[date]!.remove(timeSlot);
        } else {
          newSelectedTimeSlots[date]!.add(timeSlot);
        }
      }
      widget.setSelectedTimeSlots(newSelectedTimeSlots);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: selectedDates.length,
          itemBuilder: (context, index) {
            final date = selectedDates[index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Available time slots for ${date.toLocal()}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Wrap(
                  children: availableTimeSlots.map(
                    (timeSlot) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilterChip(
                          label: Text(timeSlot),
                          selected: widget.selectedTimeSlots[date]
                                  ?.contains(timeSlot) ??
                              false,
                          onSelected: (selected) {
                            toggleTimeSlot(date, timeSlot);
                          },
                        ),
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ],
    );
  }
}
