import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, void Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                this._buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  this._glutenFree,
                  (value) => setState(() => this._glutenFree = value),
                ),
                this._buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  this._lactoseFree,
                  (value) => setState(() => this._lactoseFree = value),
                ),
                this._buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  this._vegetarian,
                  (value) => setState(() => this._vegetarian = value),
                ),
                this._buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  this._vegan,
                  (value) => setState(() => this._vegan = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
