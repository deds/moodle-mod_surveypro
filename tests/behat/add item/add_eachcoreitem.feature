@mod @mod_surveypro
Feature: verify each core item can be added to a survey
  In order to verify each core item can be added to a survey
  As a teacher
  I add each core item to a survey

  @javascript
  Scenario: add each core item
    Given the following "courses" exist:
      | fullname           | shortname     | category | groupmode |
      | Add each core item | Add each item | 0        | 0         |
    And the following "users" exist:
      | username | firstname | lastname | email                |
      | teacher1 | Teacher   | 1        | teacher1@nowhere.net |
    And the following "course enrolments" exist:
      | user     | course        | role           |
      | teacher1 | Add each item | editingteacher |
    And I log in as "teacher1"
    And I follow "Add each core item"
    And I turn editing mode on
    And I add a "Surveypro" to section "1" and I fill the form with:
      | Surveypro name | Surveypro test                            |
      | Description    | This is a surveypro to add each core item |
    And I follow "Surveypro test"

    # #############
    # add an item using the 1st plugin
    And I set the field "typeplugin" to "Age [yy/mm]"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content                  | How old were you at you first access to narcotics |
      | Required                 | 1                                                 |
      | Indent                   | 0                                                 |
      | Question position        | left                                              |
      | Element number           | 1                                                 |
      | Hide filling instruction | 1                                                 |
      | id_defaultoption_2       | Custom                                            |
      | id_defaultvalue_year     | 14                                                |
      | id_defaultvalue_month    | 4                                                 |
    And I press "Add"

    # #############
    # add an item using the 2nd plugin
    And I set the field "typeplugin" to "Attachment"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content                  | Please upload your Curriculum Vitae |
      | Required                 | 1                                   |
      | Indent                   | 0                                   |
      | Question position        | left                                |
      | Element number           | 2                                   |
      | Hide filling instruction | 1                                   |
    And I press "Add"

    # #############
    # add an item using the 3rd plugin
    And I set the field "typeplugin" to "Autofill"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content             | Your user ID |
      | Indent              | 0            |
      | Question position   | left         |
      | Element number      | 3            |
      | id_element01_select | user ID      |
    And I press "Add"

    # #############
    # add an item using the 4th plugin
    And I set the field "typeplugin" to "Boolean"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content           | Is this true? |
      | Required          | 1             |
      | Indent            | 0             |
      | Question position | left          |
      | Element number    | 4             |
    And I press "Add"

    # #############
    # add an item using the 5th plugin
    And I set the field "typeplugin" to "Checkbox"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content           | What do you usually eat for breakfast? |
      | Indent            | 0                                      |
      | Question position | left                                   |
      | Element number    | 5                                      |
    And I fill the textarea "Options" with multiline content "milk\nsugar\njam\nchocolate"
    And I press "Add"

    # #############
    # add an item using the 6th plugin
    And I set the field "typeplugin" to "Date (short) [mm/yyyy]"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content                  | When did you buy your current car? |
      | Required                 | 1                                  |
      | Indent                   | 0                                  |
      | Question position        | left                               |
      | Element number           | 6                                  |
      | Hide filling instruction | 1                                  |
    And I press "Add"

    # #############
    # add an item using the 7th plugin
    And I set the field "typeplugin" to "Date [dd/mm/yyyy]"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content                  | When were you born? |
      | Required                 | 1                   |
      | Indent                   | 0                   |
      | Question position        | left                |
      | Element number           | 7                   |
      | Hide filling instruction | 1                   |
    And I press "Add"

    # #############
    # add an item using the 8th plugin
    And I set the field "typeplugin" to "Date and time [dd/mm/yyyy;hh:mm]"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content                  | In which day and at what time do you remember it happened? |
      | Required                 | 1                                                          |
      | Indent                   | 0                                                          |
      | Question position        | left                                                       |
      | Element number           | 8                                                          |
      | Hide filling instruction | 1                                                          |
    And I press "Add"

    # #############
    # add an item using the 22th plugin
    And I set the field "typeplugin" to "Page break"
    And I press "Add"

    And I press "Add"

    # #############
    # add an item using the 9th plugin
    And I set the field "typeplugin" to "Integer (small)"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content                  | How many siblings do you have? |
      | Required                 | 1                              |
      | Indent                   | 0                              |
      | Question position        | left                           |
      | Element number           | 9                              |
    And I press "Add"

    # #############
    # add an item using the 10th plugin
    And I set the field "typeplugin" to "Multiple selection"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content                | What do you usually eat for breakfast? |
      | Indent                 | 0                                      |
      | Question position      | left                                   |
      | Element number         | 10                                     |
      | Minimum required items | 2                                      |
    And I fill the textarea "Options" with multiline content "milk\nsugar\njam\nchocolate"
    And I press "Add"

    # #############
    # add an item using the 11th plugin
    And I set the field "typeplugin" to "Numeric"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content                  | Which is you preferred mean temperature in the room where you are asked to work? |
      | Required                 | 1                                                                                |
      | Indent                   | 0                                                                                |
      | Question position        | left                                                                             |
      | Element number           | 11                                                                               |
      | Hide filling instruction | 1                                                                                |
    And I press "Add"

    # #############
    # add an item using the 12th plugin
    And I set the field "typeplugin" to "Radio buttons"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content           | Where do you mainly spend your summer holidays? |
      | Required          | 1                                               |
      | Indent            | 0                                               |
      | Question position | left                                            |
      | Element number    | 12                                              |
    And I fill the textarea "Options" with multiline content "sea\nmountain\nlake\nhills\ndesert"
    And I press "Add"

    # #############
    # add an item using the 19th plugin
    And I set the field "typeplugin" to "Fieldset"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content | A bunch of items |
    And I press "Add"

    # #############
    # add an item using the 13th plugin
    And I set the field "typeplugin" to "Rate"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content        | Please order these foreign languages according to your preferences |
      | Required       | 1                                                                  |
      | Indent         | 0                                                                  |
      | Element number | 13                                                                 |
    And I fill the textarea "Options" with multiline content "Italian\nSpanish\nEnglish\nFrench\nGerman"
    And I fill the textarea "Rates" with multiline content "Mother tongue\nQuite well\nNot sufficient\nCompletely unknown"
    And I press "Add"

    # #############
    # add an item using the 14th plugin
    And I set the field "typeplugin" to "Recurrence [dd/mm]"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content                  | When do you usually celebrate your name-day? |
      | Required                 | 1                                            |
      | Indent                   | 0                                            |
      | Question position        | left                                         |
      | Element number           | 14                                           |
      | Hide filling instruction | 1                                            |
    And I press "Add"

    # #############
    # add an item using the 15th plugin
    And I set the field "typeplugin" to "Select"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content           | Where do you mainly spend your summer holidays? |
      | Required          | 1                                               |
      | Indent            | 0                                               |
      | Question position | left                                            |
      | Element number    | 15                                              |
    And I fill the textarea "Options" with multiline content "sea\nmountain\nlake\nhills\ndesert"
    And I press "Add"

    # #############
    # add an item using the 16th plugin
    And I set the field "typeplugin" to "Text (long)"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content                  | Enter a short description of yourself |
      | Required                 | 1                                     |
      | Indent                   | 0                                     |
      | Question position        | left                                  |
      | Element number           | 16                                    |
      | Hide filling instruction | 1                                     |
    And I press "Add"

    # #############
    # add an item using the 17th plugin
    And I set the field "typeplugin" to "Text (short)"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content                  | Write down your email |
      | Required                 | 1                     |
      | Indent                   | 0                     |
      | Question position        | left                  |
      | Element number           | 17                    |
      | Hide filling instruction | 1                     |
      | id_pattern               | email address         |
    And I press "Add"

    # #############
    # add an item using the 18th plugin
    And I set the field "typeplugin" to "Time"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content                  | At what time do you usually get breakfast? |
      | Required                 | 1                                          |
      | Indent                   | 0                                          |
      | Element number           | 18                                         |
      | Hide filling instruction | 1                                          |
    And I press "Add"

    # #############
    # add an item using the 20th plugin
    And I set the field "typeplugin" to "Fieldset closure"
    And I press "Add"

    And I press "Add"

    # #############
    # add an item using the 21th plugin
    And I set the field "typeplugin" to "Label"
    And I press "Add"

    And I expand all fieldsets
    And I set the following fields to these values:
      | Content | This is just a comment |
    And I press "Add"
