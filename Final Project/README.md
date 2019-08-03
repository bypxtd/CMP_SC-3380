# Missouri Rail Project
## CS3380
## Group 14

-- gitHub Repository: https://github.com/JianshenZhu/CS3380Group14 --

NOTE: ALL MEMBERS PLEASE KEEP THIS FILE UPDATED.  ADD INFO ABOUT EVERYTHING.

NOTE: PLEASE USE THE FOLLOWING COMMAND ON ALL NEW FILES:
    chmod 664 <filename>
      PLEASE USE THE FOLLOWING COMMAND ON ALL NEW DIRECTORIES:
    chmod 775 <dirname>
      OTHERWISE OTHER GROUP MEMBERS WILL HAVE DIFFICULTY EDITING THEM.

public_html/    # Group 14 Directory Design
|css/               # put styles here
||normalize.css         # normalizes styles across browsers
||global.css            # global styles
||landing.css           # landing page custom styles
||pageload.css          # trainsitions when page loads
|inc/               # php files to include
||meta.php              # meta data e.g. stylesheets, charset
||header.php            # responsive navbar, site header
||footer.php            # contact, about us, copyright, logos
||utils.php             # reused functions like openDB()
|img/               # images here
|internal/          # employee-facing side of website
||login/                # login, logout, login checks
||createUser/           # make a new user
||user/                 # user utilities
||admin/                # administrator utilities
|||manageTrains/            # train management
|||manageUsers/             # user management
|||manageEquipment/         # railcar management
|store/             # customer-facing side of website
||listings/             # store listing
||car/                  # template page for rail cars
||verify/               # psuedo-login for vendors
|index.php          # landing page
|log.php            # database log
|schedule.php       # train schedule
|stations.php       # location table
|about.php          # about group 14
|contact.php        # how to contact
CONFIG.php      # DEPRECATED config file
config.ini.php  # database config file
README.md       # this file
