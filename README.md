Salon & Barber Appointment Booking System

# Description

A web based Salon & Barber Appointment Booking System developed using React, Vite, Tailwind CSS, Spring Boot, Spring Data JPA, and PostgreSQL.

# Technologies Used

- React
- Vite
- Tailwind CSS
- Spring Boot
- Spring Data JPA
- PostgreSQL

# Features

- User Registration and Login
- Appointment Booking
- Appointment Management
- Customer Management
- Staff Management
- Admin Dashboard

# Project Structure

```bash
Salon_Barber_Appointment-Booking-System/
├── frontend/                          # React + Vite + Tailwind CSS client
│   ├── public/                        # Static assets
│   ├── src/
│   │   ├── assets/                    # Images, icons, and media files
│   │   ├── components/                # Reusable UI components
│   │   ├── pages/                     # Application pages/views
│   │   ├── layouts/                   # Layout wrappers (navbar, footer, etc.)
│   │   ├── services/                  # API service layer (Axios/fetch calls)
│   │   ├── hooks/                     # Custom React hooks
│   │   ├── context/                   # Global state/context providers
│   │   ├── utils/                     # Utility/helper functions
│   │   ├── App.jsx                    # Root React component
│   │   └── main.jsx                   # App entry point
│   ├── index.html
│   ├── package.json
│   ├── vite.config.js
│   └── tailwind.config.js
│
├── backend/                           # Spring Boot + Spring Data JPA API
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/
│   │   │   │   └── com/.../
│   │   │   │       ├── controller/    # REST controllers
│   │   │   │       ├── service/       # Business logic
│   │   │   │       ├── repository/    # JPA repositories
│   │   │   │       ├── model/         # Entity classes
│   │   │   │       ├── dto/           # Data Transfer Objects (optional)
│   │   │   │       ├── config/        # Security/CORS/Swagger configs
│   │   │   │       └── exception/     # Exception handling classes
│   │   │   └── resources/
│   │   │       ├── application.properties
│   │   │       ├── static/
│   │   │       └── templates/
│   │   └── test/                      # Unit/integration tests
│   ├── pom.xml
│   └── mvnw / mvnw.cmd
│
├── database/                          # SQL scripts and DB-related resources
│   ├── schema.sql
│   ├── data.sql
│   └── migrations/                    # Flyway/Liquibase migrations (if used)
│
├── .gitignore
├── README.md
└── LICENSE
```

# How to Run the Project

### 1) Clone the Repository

```bash
git clone https://github.com/Sanduni475/Salon_Barber_Appointment-Booking-System.git
cd Salon_Barber_Appointment-Booking-System
```

### 2) Run the Backend (Spring Boot)

> Make sure Java (17+ recommended), Maven, and PostgreSQL are installed.

1. Navigate to backend folder:

```bash
cd backend
```

2. Configure database in `src/main/resources/application.properties`:

```
setx DB_PASSWORD "your_postgres_password"
```

3. Run the Spring Boot app:

If using Maven installed globally:

```bash
mvn spring-boot:run
```

Or using Maven Wrapper:

```bash
./mvnw spring-boot:run
```

(Windows)

```bash
mvnw.cmd spring-boot:run
```

Backend runs on: `http://localhost:8080`

---

### 3) Run the Frontend (React + Vite)

> Make sure Node.js (18+ recommended) and npm are installed.

1. Open a new terminal and navigate to frontend folder:

```bash
cd frontend
```

2. Install dependencies:

```bash
npm install
```

3. Create `.env` file (if API URL is needed):

```env
VITE_API_BASE_URL=http://localhost:8080
```

4. Start development server:

```bash
npm run dev
```

Frontend runs on: `http://localhost:5173`

---

### 4) Access the Application

- Frontend: `http://localhost:5173`
- Backend API: `http://localhost:8080`

---

## Prerequisites

- Java 17+
- Maven 3.8+
- Node.js 18+
- npm 9+
- PostgreSQL 14+

---

## Troubleshooting

- **Port already in use**  
  Change frontend port in `vite.config.js` or stop the process using port `5173/8080`.

- **Database connection failed**  
  Verify PostgreSQL service is running and DB credentials in `application.properties` are correct.

- **CORS errors**  
  Ensure backend CORS configuration allows requests from `http://localhost:5173`.

---
