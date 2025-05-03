import 'package:codolingo/components/atoms/buttons/text_button.dart';
import 'package:codolingo/components/molecules/button_grid/button_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class ButtonGrid extends StatelessWidget {
  const ButtonGrid({required this.nb_column, required this.list_buttons, required this.onPressed});

  final int nb_column;
  final List<ButtonObject> list_buttons;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      crossAxisCount: nb_column, 
      mainAxisSpacing: 14,
      crossAxisSpacing: 10,
      itemCount: list_buttons.length,
      itemBuilder: (context, index) {
        return CodolingoTextButton(
          text :list_buttons[index].text,
          type: list_buttons[index].style,
          selected: list_buttons[index].selected,
          onPressed: (){
              onPressed(list_buttons[index].id);
          },
        );
      },
    );
  }
}