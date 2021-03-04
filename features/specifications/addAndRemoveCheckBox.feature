Feature: Add and remove checkbox

              Add and remove checkbox

        Scenario: Remove checkbox
            Given the access to the webpage
             When I remove the checkbox
             Then the checkbox should no applied to the screen

        Scenario: Remove and Add checkbox
            Given the access to the webpage
             When I remove checkbox
              And add checkbox again
             Then the checkbox should be applied to the screen again
