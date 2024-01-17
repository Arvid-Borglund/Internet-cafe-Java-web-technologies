# Internet-cafe-Java-web-technologies
This MVC project was created for an LU course in software architecture, web architecture and quality assurance of software systems. It's an administrative system for employees, customers, computers and bookings via an browser interface (webpage) handled by a Wildfly server (utilizing JDBC to connect to the T-SQL database).

The project contains Enterprise JavaBeans (EJB) (Session, Entity beans) which was utilized to handle business logic and persist data with the help of the persistence API (for ORM), Facade and EAO patterns.
Junit was used for testing and quality assurance.
The Web Interface Design (user interface) was crafted with HTML, JavaScript, and CSS. 

A single servlet was used as a controller that communicated with JSP pages and the backend. HTML5 was used for constraint validation on the user inputs.
On the backend a logging and validation interceptor is used to ensure the functionality and integrity of the data objects/ program.

Even tho the main application does not use REST it includes RESTful services, that are used by a separate web client (with its own UI), developed for consuming the REST services provided by the main application, using AJAX and the Fetch API, with the data being exchanged between the client and the main application using JSON format.

Since this project was created by me as the only dev, I didnt version control using git but rather just used Google Drive as my backup, but I have now transferred the project to GitHub and I have included the T-sql script for the database aswell (Microsoft SSMS was used for the db). Please note that chatgpt 4 was utilized throughout the development as support and many of the methods are co-written and have been revised multiple times with and without AI support. The design, architecture, database structure and the project idea was all me without AI support.

