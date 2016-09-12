# overtime app

## key requirement: company needs documentation that salaried employees did nor did not get overtime that week

## models
-x Post -> date:date rationale:text
-x User -> devise
-x AdminUser => STI

## features
- approval workflow
- sms sending -> link to approval or overtime input
- administrate admin dashboard - complete
- email summary to managers for approval
- needs to be documented if employee did not log overtime
- block non admin and guest user to admin- complete

##ui
- bootstrap formatting - complete
- icons font awesome
- Update the style for forms

##refactor :todos
-refactor user association integration test post_spec
-add full_name method to user - complete
- refactor posts_form for admin user status



     ,-----.,--.                  ,--. ,---.   ,--.,------.  ,------.
    '  .--./|  | ,---. ,--.,--. ,-|  || o   \  |  ||  .-.  \ |  .---'
    |  |    |  || .-. ||  ||  |' .-. |`..'  |  |  ||  |  \  :|  `--, 
    '  '--'\|  |' '-' ''  ''  '\ `-' | .'  /   |  ||  '--'  /|  `---.
     `-----'`--' `---'  `----'  `---'  `--'    `--'`-------' `------'
    ----------------------------------------------------------------- 


Welcome to your Rails project on Cloud9 IDE!

To get started, just do the following:

1. Run the project with the "Run Project" button in the menu bar on top of the IDE.
2. Preview your new app by clicking on the URL that appears in the Run panel below (https://overtime2-whoashell.c9users.io/).

Happy coding!
The Cloud9 IDE team


## Support & Documentation

Visit http://docs.c9.io for support, or to learn more about using Cloud9 IDE. 
To watch some training videos, visit http://www.youtube.com/user/c9ide
