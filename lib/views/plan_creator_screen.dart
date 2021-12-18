import 'package:flutter/material.dart';
import 'package:master_plan/plan_provider.dart';
import '../models/data_layer.dart';
import 'plan_screen.dart';

class PlanScreenCreator extends StatefulWidget {
  const PlanScreenCreator({Key? key}) : super(key: key);

  @override
  _PlanScreenCreatorState createState() => _PlanScreenCreatorState();
}

class _PlanScreenCreatorState extends State<PlanScreenCreator> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master Plans')),
      body: Column(
        children: [_buildListCreator(), Expanded(child: _buildMasterPlans())],
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  Widget _buildListCreator() {
    void addPlan() {
      final text = textController.text;

      if (text.isEmpty) {
        return;
      }

      final plan = Plan()..name = text;
      PlanProvider.of(context).add(plan);
      textController.clear();
      FocusScope.of(context).requestFocus(FocusNode());
      setState(() {});
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 10.0,
        child: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: "Add a plan",
            contentPadding: EdgeInsets.all(20.0),
          ),
          onEditingComplete: addPlan,
        ),
      ),
    );
  }

  Widget _buildMasterPlans() {
    final plans = PlanProvider.of(context);

    if (plans.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.note, size: 100, color: Colors.grey),
          Text(
            "You do not have plans yet :(",
            style: Theme.of(context).textTheme.headline5,
          )
        ],
      );
    }

    return Scrollbar(
      child: ListView.builder(
          itemCount: plans.length,
          itemBuilder: (context, index) {
            final plan = plans[index];

            return ListTile(
                title: Text(plan.name),
                subtitle: Text(plan.completenessMessage),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => PlanScreen(plan: plan)));
                });
          }),
    );
  }
}
