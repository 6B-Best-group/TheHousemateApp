

import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) { 

    /* 
    
    TO DO :
    - make it so you can't set chores for the past
    - make a function for the different day, month, year
    - condense it down into a valid date time

    */
    return Row(
      children: [
        DropdownMenu( //  day
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                      value: "pasta", 
                      label: "pasta sause",
                      ),
                    DropdownMenuEntry( 
                      value: "cheese", 
                      label: "cheese sause",
                      ),
                    DropdownMenuEntry( 
                      value: "basil", 
                      label: "basil sause",
                      ),
                  ],),
        DropdownMenu( //  month
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                      value: "pasta", 
                      label: "pasta sause",
                      ),
                    DropdownMenuEntry( 
                      value: "cheese", 
                      label: "cheese sause",
                      ),
                    DropdownMenuEntry( 
                      value: "basil", 
                      label: "basil sause",
                      ),
                  ],),
        DropdownMenu( //  year
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                      value: "pasta", 
                      label: "pasta sause",
                      ),
                    DropdownMenuEntry( 
                      value: "cheese", 
                      label: "cheese sause",
                      ),
                    DropdownMenuEntry( 
                      value: "basil", 
                      label: "basil sause",
                      ),
                  ],),
      ],
    );
  }
  
  

}

