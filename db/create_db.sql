CREATE DATABASE study_find;
CREATE USER 'webapp'@'%' IDENTIFIED BY 'abc123';
GRANT ALL PRIVILEGES ON study_find.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

USE study_find;

CREATE TABLE Reviewer (
    reviewerID INTEGER NOT NULL,
    zip char(5) NOT NULL,
    state char(2) NOT NULL,
    city varchar(30) NOT NULL,
    street varchar(50) NOT NULL,
    first varchar(50) NOT NULL,
    last varchar(50) NOT NULL,
    PRIMARY KEY (reviewerID)
);

insert into Reviewer (reviewerID, zip, state, city, street, first, last) 
values (1, '40510', 'KY', 'Lexington', '82890 Atwood Court', 'Beltran', 'Nind');
insert into Reviewer (reviewerID, zip, state, city, street, first, last) 
values (2, '01813', 'MA', 'Woburn', '705 Swallow Place', 'Dari', 'McDowall');
insert into Reviewer (reviewerID, zip, state, city, street, first, last) 
values (3, '83711', 'ID', 'Boise', '229 Mandrake Way', 'Palmer', 'Lazare');
insert into Reviewer (reviewerID, zip, state, city, street, first, last) 
values (4, '90831', 'CA', 'Long Beach', '38 Roxbury Plaza', 'Alexandre', 'Delgardillo');


CREATE TABLE Study_Space(
    spaceID INTEGER NOT NULL,
    name TINYTEXT NOT NULL,
    capacity INTEGER NOT NULL CHECK (capacity >= 0),
    PRIMARY KEY (spaceID)
);

insert into Study_Space (spaceID, name, capacity) values (1, 'Tattes', 50);
insert into Study_Space (spaceID, name, capacity) values (2, 'Caffe Nero', 37);
insert into Study_Space (spaceID, name, capacity) values (3, 'Snell', 503);
insert into Study_Space (spaceID, name, capacity) values (4, 'Boston Public Library', 231);
insert into Study_Space (spaceID, name, capacity) values (5, 'Central Park', 1000);

CREATE TABLE Orders (
    orderID INTEGER NOT NULL,
    price DECIMAL(5, 2) NOT NULL CHECK (price >= 0),
    quantity INTEGER NOT NULL CHECK (quantity >= 0),
    spaceID INTEGER NOT NULL,
    PRIMARY KEY (orderID),
    CONSTRAINT fk_0 FOREIGN KEY (spaceID) REFERENCES Study_Space (spaceID)
);

insert into Orders (orderID, price, quantity, spaceID) values (1,  2.30, 1, 1);
insert into Orders (orderID, price, quantity, spaceID) values (2,  5.32, 1, 1);
insert into Orders (orderID, price, quantity, spaceID) values (3,  10.23, 2, 2);
insert into Orders (orderID, price, quantity, spaceID) values (4,  1.98, 1, 3);
insert into Orders (orderID, price, quantity, spaceID) values (5,  5.76, 2, 1);
insert into Orders (orderID, price, quantity, spaceID) values (6,  29.54, 1, 4);
insert into Orders (orderID, price, quantity, spaceID) values (7,  3.40, 3, 2);



CREATE TABLE Student (
    studentID INTEGER NOT NULL,
    first varchar(50) NOT NULL,
    last varchar(50) NOT NULL,
    month char(2) NOT NULL,
    year char(4) NOT NULL,
    day char(2) NOT NULL,
    orderID INTEGER,
    PRIMARY KEY (studentID),
    CONSTRAINT fk_1 FOREIGN KEY (orderID) REFERENCES Orders (orderID)
);

insert into Student (studentID, first, last, month, year, day, orderID) 
values (1, 'Daveta', 'Bugge', '02', '2003', '18', 2);
insert into Student (studentID, first, last, month, year, day, orderID) 
values (2, 'Chiquia', 'Tann', '10', '2010', '20', 4);
insert into Student (studentID, first, last, month, year, day, orderID) 
values (3, 'Karin', 'Ciubutaro', '05', '1989', '23', 1);
insert into Student (studentID, first, last, month, year, day, orderID) 
values (4, 'Myrtle', 'Waldron', '12', '1950', '09', null);


CREATE TABLE Location (
    locationID INTEGER NOT NULL,
    street varchar(50) NOT NULL,
    city varchar(30) NOT NULL,
    state char(2) NOT NULL,
    zip char(5) NOT NULL,
    PRIMARY KEY (locationID),
    reviewerID INTEGER NOT NULL,
    studentID INTEGER NOT NULL, 
    CONSTRAINT fk_2 FOREIGN KEY (reviewerID) REFERENCES Reviewer (reviewerID),
    CONSTRAINT fk_3 FOREIGN KEY (studentID) REFERENCES Student(studentID)
);


insert into Location (locationID, street, city, state, zip, reviewerID, studentID) 
values (1, '143 Blaine Park', 'Evansville', 'IN', '47732', 1, 4);
insert into Location (locationID, street, city, state, zip, reviewerID, studentID) 
values (2, '46 Dayton Avenue', 'Charlotte', 'NC', '28247', 2, 2);
insert into Location (locationID, street, city, state, zip, reviewerID, studentID) 
values (3, '0049 Cherokee Plaza', 'Chicago', 'IL', '60619', 3, 1);
insert into Location (locationID, street, city, state, zip, reviewerID, studentID) 
values (4, '34999 Cambridge Junction', 'Lancaster', 'PA', '17622', 4, 3);
insert into Location (locationID, street, city, state, zip, reviewerID, studentID) 
values (5, '17830 Farragut Park', 'Madison', 'WI', '53705', 1, 1);
insert into Location (locationID, street, city, state, zip, reviewerID, studentID) 
values (6, '336 Westend Street', 'Houston', 'TX', '77040', 2, 3);
insert into Location (locationID, street, city, state, zip, reviewerID, studentID) 
values (7, '654 Caliangt Plaza', 'Abilene', 'TX', '79699', 4, 3);
insert into Location (locationID, street, city, state, zip, reviewerID, studentID) 
values (8, '28932 East Center', 'Colorado Springs', 'CO', '80910', 4, 4);


CREATE TABLE Study_Space_Type (
    typeID INTEGER NOT NULL,
    typeName TINYTEXT NOT NULL,
    studentID INTEGER NOT NULL,
    spaceID INTEGER NOT NULL,
    CONSTRAINT fk_6 FOREIGN KEY (studentID) REFERENCES Student(studentID),
    CONSTRAINT fk_7 FOREIGN KEY (spaceID) REFERENCES Study_Space(spaceID),
    PRIMARY KEY (typeID, studentID, spaceID)
);


insert into Study_Space_Type (typeID, typeName, studentID, spaceID) values (1, 'Cafe', 1, 1);
insert into Study_Space_Type (typeID, typeName, studentID, spaceID) values (2, 'Library', 4, 4);
insert into Study_Space_Type (typeID, typeName, studentID, spaceID) values (3, 'Park', 1, 5);
insert into Study_Space_Type (typeID, typeName, studentID, spaceID) values (1, 'Cafe', 1, 2);
insert into Study_Space_Type (typeID, typeName, studentID, spaceID) values (2, 'Library', 3, 4);
insert into Study_Space_Type (typeID, typeName, studentID, spaceID) values (3, 'Park', 2, 5);


CREATE TABLE Occupation (
    occupationID INTEGER NOT NULL,
    name varchar(30),
    studentID INTEGER NOT NULL,
    reviewerID INTEGER NOT NULL,
    PRIMARY KEY (occupationID),
    CONSTRAINT fk_4 FOREIGN KEY (studentID) REFERENCES Student(studentID),
    CONSTRAINT fk_5 FOREIGN KEY (reviewerID) REFERENCES Reviewer(reviewerID)
);


insert into Occupation (occupationID, name, studentID, reviewerID) values (1, 'Undergrad', 1, 1);
insert into Occupation (occupationID, name, studentID, reviewerID) values (2, 'Teacher', 2, 3);
insert into Occupation (occupationID, name, studentID, reviewerID) values (3, 'PHD', 1, 2);
insert into Occupation (occupationID, name, studentID, reviewerID) values (4, 'Student', 3, 4);



CREATE TABLE Item (
    price DECIMAL(5, 2) NOT NULL CHECK (price >= 0),
    name varchar(50) NOT NULL,
    typeID INTEGER NOT NULL,
    CONSTRAINT fk_8 FOREIGN KEY (typeID) REFERENCES Study_Space_Type(typeID),
    PRIMARY KEY (name, typeID)
);


insert into Item (price, name, typeID) values (1.15, 'Cookie', 1);
insert into Item (price, name, typeID) values (4.50, 'Coffe', 1);
insert into Item (price, name, typeID) values (3.25, 'Latte', 2);
insert into Item (price, name, typeID) values (5.89, 'Soup', 2);


CREATE TABLE Contacts(
    contactID INTEGER NOT NULL,
    phone char(12) NOT NULL,
    email varchar(50) NOT NULL,
    reviewerID INTEGER NOT NULL,
    spaceID INTEGER NOT NULL, 
    studentID INTEGER NOT NULL,
    PRIMARY KEY (contactID),
    CONSTRAINT fk_9 FOREIGN KEY (reviewerID) REFERENCES Reviewer(reviewerID),
    CONSTRAINT fk_10 FOREIGN KEY (spaceID) REFERENCES Study_Space(spaceID),
    CONSTRAINT fk_11 FOREIGN KEY (studentID) REFERENCES Student(studentID)
);

insert into Contacts (contactID, phone, email, reviewerID, spaceID, studentID) 
values (1, '729-192-1832', 'emassiradoo@gmail.com', 1, 2, 2);
insert into Contacts (contactID, phone, email, reviewerID, spaceID, studentID) 
values (2, '123-456-3123', 'ella@gmail.com', 2, 2, 1);
insert into Contacts (contactID, phone, email, reviewerID, spaceID, studentID) 
values (3, '123-654-2314', 'drew@gmail.com', 3, 4, 1);
insert into Contacts (contactID, phone, email, reviewerID, spaceID, studentID) 
values (4, '917-923-1092', 'arj@gmail.com', 1, 5, 4);


CREATE TABLE Review (
    reviewID INTEGER NOT NULL,
    starsNum char(1) CHECK (starsNum >= 1 and starsNum <= 5),
    comment TEXT,
    ambienceNum char(2) CHECK (ambienceNum >= 1 and ambienceNum <= 10),
    cleanlinessNum char(2) CHECK (cleanlinessNum >= 1 and cleanlinessNum <= 10),
    quietnessNum char(2) CHECK (quietnessNum >= 1 and quietnessNum <= 10),
    demographic TEXT,
    spaceID INTEGER NOT NULL,
    PRIMARY KEY (reviewID),
    CONSTRAINT fk_12 FOREIGN KEY (spaceID) REFERENCES Study_Space(spaceID)
);

insert into Review (reviewID, starsNum, comment, ambienceNum, cleanlinessNum, quietnessNum, demographic, spaceID)
values (1, 3, "I like it a lot.", 5, 8, 1, "A lot of college students", 2);
insert into Review (reviewID, starsNum, comment, ambienceNum, cleanlinessNum, quietnessNum, demographic, spaceID)
values (2, 2, "Absolutely deplorable conditions to study in.", 6, 10, 1, null, 2);
insert into Review (reviewID, starsNum, comment, ambienceNum, cleanlinessNum, quietnessNum, demographic, spaceID)
values (3, 1, "Could not focus when studying for my exam!!!!", 10, null, 1, "Pretty diverse crowd of studious people!!", 2);
insert into Review (reviewID, starsNum, comment, ambienceNum, cleanlinessNum, quietnessNum, demographic, spaceID)
values (4, 5, "I like it a lot.", 2, 8, null, null, 2);



CREATE TABLE Accessibility(
    description TEXT,
    decibelLevel char(2) CHECK (decibelLevel >= 1 and decibelLevel <= 10),
    wheelchair BOOLEAN,
    breastfeeding BOOLEAN,
    noFlashingLights BOOLEAN,
    spaceID INTEGER NOT NULL,
    CONSTRAINT fk_13 FOREIGN KEY (spaceID) REFERENCES Study_Space(spaceID)
);

insert into Accessibility (description, decibelLevel, wheelchair, breastfeeding, noFlashingLights, spaceID)
values ("Pretty good accessiblitiy. I have a daughter in a wheelchair and the ramp's incline was good and the doors to enter and exit were really wide.", 
null, TRUE, FALSE, TRUE, 2);
insert into Accessibility (description, decibelLevel, wheelchair, breastfeeding, noFlashingLights, spaceID)
values ( "accessiblitiy was a bit bad here. The lights were very harsh for my eyes and head that I could't concentrate", 
7, FALSE, FALSE, TRUE, 1);
insert into Accessibility (description, decibelLevel, wheelchair, breastfeeding, noFlashingLights, spaceID)
values ("I was so surprised to see that they had a lactation room for my youngin!!", 
null, null, FALSE, TRUE, 3);
insert into Accessibility (description, decibelLevel, wheelchair, breastfeeding, noFlashingLights, spaceID)
values (null, null, null, null, null, 4);


CREATE TABLE Media_Types(
    name varchar(50) NOT NULL,
    spaceID INTEGER NOT NULL,
    CONSTRAINT fk_14 FOREIGN KEY (spaceID) REFERENCES Study_Space(spaceID),
    PRIMARY KEY (name, spaceID)
);

insert into Media_Types (name, spaceID)
values ("Computer", 3);
insert into Media_Types (name, spaceID)
values ("Books", 2);
insert into Media_Types (name, spaceID)
values ("Piano", 2);

