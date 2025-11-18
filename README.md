<div align="center">

# 🎓 University Student Management System

A comprehensive Struts-based web application designed to streamline academic operations, manage student records, and facilitate communication between students and faculty in educational institutions.

---

<p>
  <img src="https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white" alt="Java" />
  <img src="https://img.shields.io/badge/Struts2-2FA37F?style=for-the-badge&logo=apache&logoColor=white" alt="Apache Struts 2" />
  <img src="https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL" />
  <img src="https://img.shields.io/badge/Hibernate-59666C?style=for-the-badge&logo=Hibernate&logoColor=white" alt="Hibernate" />
  <br />
  <img src="https://img.shields.io/badge/Apache_Tomcat-F8DC75?style=for-the-badge&logo=apache-tomcat&logoColor=black" alt="Apache Tomcat" />
  <img src="https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apache-maven&logoColor=white" alt="Maven" />
  <img src="https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white" alt="Bootstrap" />
</p>

<p>
  <a href="#-features">Features</a> •
  <a href="#-tech-stack">Tech Stack</a> •
  <a href="#-quick-start">Quick Start</a> •
  <a href="#-project-structure">Project Structure</a> •
  <a href="#-api-endpoints">API Docs</a>
</p>

</div>

---

## ✨ Features

### 🎒 Student Portal
- **Dashboard Overview**
  - View upcoming assignments and deadlines
  - Check course schedules and academic calendar
  - Access learning resources and course materials

- **Assignment Management**
  - Submit assignments online
  - Track submission status and grades
  - Receive notifications for new assignments

- **Academic Records**
  - View grades and GPA/CGPA
  - Access academic transcripts
  - Check attendance records

### 👨‍🏫 Faculty Dashboard
- **Course Management**
  - Create and manage course content
  - Post announcements and materials
  - Track student enrollment

- **Grading System**
  - Grade assignments and exams
  - Calculate and publish final grades
  - Generate grade reports

- **Communication**
  - Send announcements to students
  - Provide feedback on assignments
  - Schedule office hours

### 🏛️ Admin Panel
- **User Management**
  - Create and manage user accounts
  - Assign roles and permissions
  - Monitor system usage

- **Academic Management**
  - Manage courses and programs
  - Handle class schedules
  - Generate academic reports

---

## 🛠️ Tech Stack

### Core Technologies
| Component | Technology |
|-----------|------------|
| **Framework** | Apache Struts 2.6.0 |
| **View Layer** | JSP, JSTL, HTML5, CSS3, JavaScript |
| **Database** | MySQL 8.0+ |
| **ORM** | Hibernate 5.6.0 |
| **Build Tool** | Apache Maven 3.8.0+ |
| **Web Server** | Apache Tomcat 9.0+ |
| **Frontend** | Bootstrap 5.1, jQuery 3.6.0 |

### Development Tools
| Tool | Purpose |
|------|---------|
| Eclipse/IntelliJ IDEA | IDE |
| MySQL Workbench | Database Management |
| Git | Version Control |
| Postman | API Testing |

---

## 🚀 Quick Start

### Prerequisites
- Java Development Kit (JDK) 8 or higher
- Apache Tomcat 9.0 or later
- MySQL Server 5.7 or higher
- Maven 3.6.0 or later
- Modern web browser (Chrome, Firefox, Edge)

### Installation Guide

1. **Clone the Repository**
   ```bash
   git clone [your-repository-url]
   cd student-management-system
   ```

2. **Database Setup**
   ```sql
   -- Create database
   CREATE DATABASE university_db;
   USE university_db;
   
   -- Import schema and initial data
   -- (Run the SQL scripts from src/main/resources/db/)
   ```

3. **Configure Application**
   - Update database connection in `src/main/resources/hibernate.cfg.xml`
   - Configure email settings in `src/main/resources/application.properties`
   - Set up file upload directory in `struts.xml`

4. **Build and Deploy**
   ```bash
   # Build the application
   mvn clean package
   
   # Deploy to Tomcat
   cp target/student-management.war $TOMCAT_HOME/webapps/
   ```

5. **Access the Application**
   - Start Tomcat server
   - Open `http://localhost:8080/student-management`
   - Use default credentials:
     - Admin: admin@university.edu / admin123
     - Faculty: faculty@university.edu / faculty123
     - Student: student@university.edu / student123

---

## 📂 Project Structure

```
student-management/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── university/
│   │   │           ├── action/         # Struts action classes
│   │   │           │   ├── admin/      # Admin actions
│   │   │           │   ├── faculty/    # Faculty actions
│   │   │           │   └── student/    # Student actions
│   │   │           ├── model/          # Entity classes
│   │   │           ├── dao/            # Data Access Objects
│   │   │           ├── service/        # Business logic
│   │   │           ├── util/           # Utility classes
│   │   │           └── interceptor/    # Custom interceptors
│   │   ├── resources/                  
│   │   │   ├── db/                     # Database scripts
│   │   │   ├── struts/                 # Struts configurations
│   │   │   └── application.properties  # Application properties
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   ├── views/              # JSP templates
│   │       │   ├── tags/               # Custom JSP tags
│   │       │   ├── struts.xml          # Struts configuration
│   │       │   └── web.xml             # Web application config
│   │       ├── assets/                 # Static resources
│   │       │   ├── css/
│   │       │   ├── js/
│   │       │   └── images/
│   │       └── uploads/                # File upload directory
│   └── test/                           # Test cases
├── .gitignore
├── pom.xml
└── README.md
```

---

## 📝 API Endpoints

### Authentication
- `POST /api/login` - User authentication
- `POST /api/logout` - User logout
- `POST /api/forgot-password` - Password recovery

### Student Endpoints
- `GET /api/students` - List all students (Admin only)
- `GET /api/students/{id}` - Get student details
- `GET /api/students/me/assignments` - Get my assignments
- `POST /api/assignments/{id}/submit` - Submit assignment

### Faculty Endpoints
- `GET /api/faculty/courses` - Get assigned courses
- `POST /api/courses/{id}/assignments` - Create assignment
- `PUT /api/assignments/{id}/grade` - Grade assignment
- `GET /api/courses/{id}/grades` - View course grades

### Admin Endpoints
- `POST /api/users` - Create new user
- `PUT /api/users/{id}` - Update user
- `DELETE /api/users/{id}` - Delete user
- `GET /api/reports/grades` - Generate grade reports

---

## 🧪 Testing

Run the test suite with:
```bash
mvn test
```

For integration tests:
```bash
mvn verify -P integration-test
```

---

## 🤝 Contributing

We welcome contributions from the community! Here's how you can help:

1. **Report Bugs**
   - Check existing issues before creating a new one
   - Provide detailed reproduction steps

2. **Suggest Enhancements**
   - Open an issue to discuss your ideas
   - Follow the project's coding standards

3. **Submit Pull Requests**
   - Fork the repository
   - Create a feature branch
   - Add tests for new functionality
   - Submit a pull request with a clear description

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📧 Contact

Project Maintainer: Karthik Sai Ambati  
Email: [aksai0511@gmail.com](mailto:aksai0511@gmail.com)  
GitHub: [@karthiksai2000](https://github.com/karthiksai2000)

---

## 🙏 Acknowledgments

- [Apache Struts](https://struts.apache.org/)
- [Hibernate ORM](https://hibernate.org/)
- [Bootstrap](https://getbootstrap.com/)
- [Font Awesome](https://fontawesome.com/)
- [jQuery](https://jquery.com/)
