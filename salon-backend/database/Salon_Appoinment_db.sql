-- USER table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(20) CHECK (role IN ('CUSTOMER','STAFF','ADMIN')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CUSTOMER table
CREATE TABLE customer (
    user_id INT PRIMARY KEY,
    gender VARCHAR(20),
    preferences TEXT,

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE
);

-- STAFF table
CREATE TABLE staff (
    user_id INT PRIMARY KEY,
    gender VARCHAR(20),
    specialization VARCHAR(100),
    experience_years INT,

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE
);

-- STAFF SCHEDULE table
CREATE TABLE staff_schedule (
    id SERIAL PRIMARY KEY,
    staff_id INT,
    day_of_week VARCHAR(20),
    start_time TIME,
    end_time TIME,
    is_working BOOLEAN,

    FOREIGN KEY (staff_id)
    REFERENCES staff(user_id)
    ON DELETE CASCADE
);

-- SERVICE table
CREATE TABLE service (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    target_gender VARCHAR(20),
    duration_minutes INT,
    price DECIMAL(10,2),
    description TEXT
);

-- APPOINTMENT table
CREATE TABLE appointment (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    staff_id INT,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    total_price DECIMAL(10,2),
    status VARCHAR(20) 
    CHECK(status IN ('BOOKED','COMPLETED','CANCELLED')),

    FOREIGN KEY (customer_id)
    REFERENCES customer(user_id),

    FOREIGN KEY (staff_id)
    REFERENCES staff(user_id)
);

-- APPOINTMENT_SERVICE table
CREATE TABLE appointment_service (
    appointment_id INT,
    service_id INT,

    PRIMARY KEY(appointment_id, service_id),

    FOREIGN KEY (appointment_id)
    REFERENCES appointment(id)
    ON DELETE CASCADE,

    FOREIGN KEY (service_id)
    REFERENCES service(id)
    ON DELETE CASCADE
);

-- REVIEW table
CREATE TABLE review (
    id SERIAL PRIMARY KEY,
    appointment_id INT UNIQUE,
    customer_id INT,
    staff_id INT,
    rating INT CHECK(rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (appointment_id)
    REFERENCES appointment(id),

    FOREIGN KEY (customer_id)
    REFERENCES customer(user_id),

    FOREIGN KEY (staff_id)
    REFERENCES staff(user_id)
);
