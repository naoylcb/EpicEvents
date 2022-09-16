*(Project realized during my training)*  
*(The goal being to set up an API and customize the admin site)*

# EpicEvents

This project allows you to access data stored in EpicEvents database through front-end site or API.

## Installation and Execution

If you've already installed Python, make sure it's up to date.  
Otherwise, download and install Python. [Website](https://www.python.org/downloads/)

Start by downloading the repository by clicking on the "Code" menu, then "Download ZIP".

Extract the folder.

In it, create and activate a virtual environment. For it :
- Open your terminal and go to the extracted folder,
- Run the command: `python -m venv env`,
- Then execute the command: `source env/bin/activate` (For Windows, the activation will be done with the file env/Scripts/activate.bat).

Still in the terminal, install the dependencies by running the command: `pip install -r requirements.txt`

Go to the "epiceventscrm" folder and run the command : `python manage.py runserver`

## Use

You should use Postman to request the api.  
[EpicEvents API documentation](https://documenter.getpostman.com/view/15948869/Tzz5tJfZ)

For front-end site :
- http://127.0.0.1:8000/admin/ (Superuser)
- http://127.0.0.1:8000/staffadmin/ (Staff)

You can log in with this accounts to test: 
- yoan | test-test1 (sales team)
- luc | test-test1 (support team)
- superuser : admin | admin

## Sentry

Click [here](https://docs.sentry.io/platforms/python/guides/django/) to configure sentry.

## Database

Import database.sql in your postgresql and adapt information in settings.py (DATABASES)

`psql -U username -d database_name -f database.sql`