[Vim](../Vim/)
##### Comment lines - Visual Mode
   gc4j - comments 4 lines down
   gc4k - comments 4 lines up

##### Delete multiple lines - Visual Mode
   d4j - deletes 4 lines down
   d4k - deletes 4 line up

##### Delete to desired character on the same line - Visual Mode
   dtp - deletes everything to next p

##### Move to desired character onn the same line
   f" - moves to the next " 

##### Pipe files/folders names from the terminal to buffer
   :``` read !ls /file/or/folder/location ```
   *check if . replaces read at the begining of the command -   ``` :. !ls ```

##### Replacing same *word on the text at once
   :%s#/word_to_delete#/word_to_replace_with/#g
   %: Specifies the range to apply the substitution to the entire buffer.
   s: Indicates that a substitution is being performed.
   #: Delimiter used instead of the usual / to avoid escaping / characters in the paths.
   g: This flag means global, i.e., replace all occurrences in each line.

##### Adding to the end of all lines
   ``` :.,$ norm A/ ```
##### Adding to the begining of all lines
   ``:.,$ norm I!``

##### Close DAP layout
   Space d U


