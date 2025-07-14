
# 📅 Reminder App

A simple web-based Reminder Application that allows users to add, view, and delete reminders. Built using JSP, Java (Servlet/JDBC), HTML/CSS, and MySQL.

---

## 🚀 Features

- ✅ Add new reminders with title, description, and date  
- 📋 View all reminders (sorted by date)  
- 📆 View only today's reminders  
- ❌ Delete individual reminders  
- 🔐 User session-based data handling (via `GetSet`)  
- 📱 Responsive dashboard UI  

---

## 🛠️ Tech Stack

- **Frontend**: HTML5, CSS3, Vanilla JavaScript  
- **Backend**: JSP, Java (JDBC)  
- **Database**: MySQL  
- **Server**: Apache Tomcat  

---

## 📂 Folder Structure

```
ReminderApp/
├── addReminder.html
├── viewAllReminders.jsp
├── viewTodaysRem.jsp
├── deleteReminder.jsp
├── dashboard.html
├── /WEB-INF/
│   └── web.xml
├── /src/
│   └── com/reminder/
│       ├── Dbconnection.java
│       └── GetSet.java
└── README.md
```

---

## ⚙️ Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-username/reminder-app.git
   cd reminder-app
   ```

2. **Create Database**
   ```sql
   CREATE DATABASE reminderdb;
   USE reminderdb;

   CREATE TABLE reminder (
     rid INT PRIMARY KEY AUTO_INCREMENT,
     uid INT,
     rtitle VARCHAR(100),
     rdesc TEXT,
     rdate DATE
   );
   ```

3. **Configure Database Connection**

   In `Dbconnection.java`, update your database credentials:
   ```java
   String url = "jdbc:mysql://localhost:3306/reminderdb";
   String user = "your_mysql_user";
   String password = "your_mysql_password";
   ```

4. **Deploy on Tomcat**
   - Copy the project folder to `webapps/`
   - Start Apache Tomcat
   - Open your browser and go to:  
     `http://localhost:8080/reminder-app/dashboard.html`

---

## 📸 Screenshots

> *<img width="1917" height="934" alt="image" src="https://github.com/user-attachments/assets/3d4bc32b-89d5-4029-a1ac-2a06149eea0c" />
*  
- Dashboard  
- Add Reminder  
- View All Reminders  
- Today's Reminders  

---

## 🤝 Contributing

Contributions, issues and feature requests are welcome!  
Feel free to open a PR or submit an issue.

---

## 📄 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for more info.

---

## ✨ Credits

Built with ❤️ by [Kalpesh Mahajan]
