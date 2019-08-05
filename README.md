# Simple Library Management Web Application

This is a web application running on Glassfish server to demonstrate a simple library management system. My group assignment for Java Web course with three people.

The application hardly uses JavaScript, mainly build with JSP & Servlets, JSTL, Expression Language, Filter and pure HTML & CSS.

The functions for the application are defined by the roles:
* Admin: see the system log, disable an user's active session;
* Student: view available books, search or reserve book, view his profile and the books he leased;
* Staff: view available books, search book, renew books for students, remove & add books.

Other functions: filter user authentication and authorization, stop user from accessing forbidden resources.

This is the ERD and some demonstrating images.

![](https://i.imgur.com/JF2fZPJ.png)

![](https://i.imgur.com/liv05UO.png)

![](https://i.imgur.com/05Ql7mk.png)

![](https://i.imgur.com/dJeib2m.png)

![](https://i.imgur.com/VxJFOyp.png)

![](https://i.imgur.com/dSR6d6m.png)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install to run the application.

```
Java JDK 1.8
Netbeans IDE newest version
GlassFish Server 4.1.1
JSTL Library
JDBC 4++ version
```

## Deployment
Open Netbeans IDE, open the project and run ```login_green.jsp``` to build and run the application. 

Demo account for each roles:
* Admin: ```admin``` - ```admin```
* Student: ```student1``` - ```sa123456```
* Staff: ```staff1``` - ```sa123456```

## Built With

* Glassfish Server 4.1.1
* JSP & Servlets
* JSTL & Expression Language
* HTML & CSS (use Flexbox mainly for layout design)
* Netbeans IDE
* Filter

## Authors

* **Cao Huy Hoàng**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
