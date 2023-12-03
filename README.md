# databaseProject
To use the system, first download and install Xampp. This can be found at https://www.apachefriends.org/. After full installation the Xampp control panel should open, as shown in the figure below.


After installing Xampp navigate to the folder C:\xampp\htdocs in file explorer.

Then Git Bash in this folder and clone the project from https://github.com/sophiakobzar/databaseProject. 


Copy the link shown under clone in the Code tap, and enter the command:
git clone https://github.com/sophiakobzar/databaseProject.git into the git terminal.

After this in the Xammp control panel, start the Apache and MySql modules and open phpmyadmin by clicking on the Admin button in the MySql row.

After opening phpMyAdmin in your web interface, create a new database and name it grocerystore.


After creating the database, click on it on the side menu, and navigate to the import tab at the top of the phpMyAdmin page. Click browse and select the grocerystore.sql file from the folder named databaseProject, previously imported from the github into the  C:\xampp\htdocs folder.

Scroll to the bottom of the page and press import, after which the database schema as well as some sample data should be loaded in.
Setup after this is now complete and the project is accessible at the following link: http://localhost/databaseProject/index.html. 
