Feature: Login webpage

  Login webpage

        Scenario: Validation empty inputs
            Given the access webpage
             When I do not inform username
              And I do not inform password
             Then the login is not performed

        Scenario: Validation empty password
            Given the access webpage
             When I inform username
              And I do not inform password
             Then the login is not performed invalidating password

        Scenario: Validation empty username
            Given the access webpage
             When I do not inform username
              And I inform password
             Then the login is not performed invalidating the user

        Scenario: Invalid user
            Given the access webpage
             When I inform Invalid username
             Then the login is not performed

        Scenario: Validation login
            Given the access webpage
             When I enter a username and password
             Then login must be performed