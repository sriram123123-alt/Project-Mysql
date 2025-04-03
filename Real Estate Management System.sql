
-- creating the first object of database schema

create database Real_Estate_DB;

-- using the database schema

use Real_Estate_DB;

-- creating the next object table of property

CREATE TABLE Property 
(
    PropertyID INT AUTO_INCREMENT PRIMARY KEY,
    Address VARCHAR(255) NOT NULL,
    Type ENUM('Residential', 'Commercial') NOT NULL,
    Size DECIMAL(10,2) NOT NULL,
    RentAmount DECIMAL(10,2) NOT NULL
);

-- Next Calling For the Tenants or clients

CREATE TABLE Tenant
 (
    TenantID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ContactInfo VARCHAR(255) NOT NULL,
    LeaseStartDate DATE NOT NULL,
    LeaseEndDate DATE NOT NULL
);
-- Next Calling By the Agreement Procedures

CREATE TABLE LeaseAgreement
 (
LeaseID INT AUTO_INCREMENT PRIMARY KEY,
PropertyID INT NOT NULL,
TenantID INT NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
MonthlyRent DECIMAL(10,2) NOT NULL,
CONSTRAINT fk_property FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID) ON DELETE CASCADE,
CONSTRAINT fk_tenant FOREIGN KEY (TenantID) REFERENCES Tenant(TenantID) ON DELETE CASCADE
);

-- Next Will Calling from the Maintenance Team or Agents
  
CREATE TABLE MaintenanceRequest 
(
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    PropertyID INT NOT NULL,
    TenantID INT NOT NULL,
    Description TEXT NOT NULL,
    Status ENUM('Pending', 'In Progress', 'Completed') DEFAULT 'Pending',
    DateSubmitted DATE NOT NULL,
    CONSTRAINT fk_maintenance_property FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID) ON DELETE CASCADE,
    CONSTRAINT fk_maintenance_tenant FOREIGN KEY (TenantID) REFERENCES Tenant(TenantID) ON DELETE CASCADE
);

-- The last called from payment process

CREATE TABLE Payment 
(
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    LeaseID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Date DATE NOT NULL,
    Method ENUM('Cash', 'Check', 'Online Transfer', 'Credit Card', 'Debit Card') NOT NULL,
    CONSTRAINT fk_payment_lease FOREIGN KEY (LeaseID) REFERENCES LeaseAgreement(LeaseID) ON DELETE CASCADE
);

INSERT INTO Property (Address, Type, Size, RentAmount) VALUES 
('123 Main St, New York, NY', 'Residential', 1200.50, 2500.00),
('456 Oak Dr, Los Angeles, CA', 'Commercial', 3500.75, 5000.00),
('789 Pine Ave, Chicago, IL', 'Residential', 900.25, 1800.00),
('101 Maple St, Houston, TX', 'Commercial', 4200.00, 7000.00),
('202 Birch Ln, Phoenix, AZ', 'Residential', 1500.30, 2300.00),
('303 Cedar Rd, San Diego, CA', 'Commercial', 5000.00, 8500.00),
('404 Elm St, Dallas, TX', 'Residential', 1100.80, 2100.00),
('505 Spruce Ct, San Jose, CA', 'Commercial', 2750.60, 4000.00),
('606 Walnut St, Austin, TX', 'Residential', 1300.50, 2200.00),
('707 Chestnut Blvd, San Francisco, CA', 'Commercial', 3800.00, 6500.00),
('808 Willow St, Denver, CO', 'Residential', 950.20, 1900.00),
('909 Aspen Ave, Seattle, WA', 'Commercial', 4600.30, 7500.00),
('111 Redwood St, Portland, OR', 'Residential', 1250.40, 2400.00),
('222 Fir Ln, Miami, FL', 'Commercial', 3200.00, 5500.00),
('333 Sycamore Dr, Atlanta, GA', 'Residential', 1450.90, 2500.00),
('444 Magnolia Blvd, Boston, MA', 'Commercial', 4100.00, 7200.00),
('555 Palm Ave, Las Vegas, NV', 'Residential', 1350.70, 2300.00),
('666 Cypress St, Philadelphia, PA', 'Commercial', 3750.00, 6000.00),
('777 Poplar Rd, Charlotte, NC', 'Residential', 1100.25, 2000.00),
('888 Beech St, Detroit, MI', 'Commercial', 2850.00, 4700.00),
('999 Hickory Ln, Nashville, TN', 'Residential', 1200.90, 2200.00),
('1000 Dogwood St, New Orleans, LA', 'Commercial', 3900.50, 6800.00),
('1100 Juniper Ave, San Antonio, TX', 'Residential', 1250.75, 2100.00),
('1200 Olive Dr, Indianapolis, IN', 'Commercial', 4200.25, 7500.00),
('1300 Laurel St, Columbus, OH', 'Residential', 1400.60, 2500.00),
('1400 Mahogany Ct, Kansas City, MO', 'Commercial', 3000.75, 5000.00),
('1500 Cedarwood Rd, Raleigh, NC', 'Residential', 1550.30, 2600.00),
('1600 Sequoia St, Memphis, TN', 'Commercial', 4400.40, 7700.00),
('1700 Willow Ln, Louisville, KY', 'Residential', 1320.80, 2200.00),
('1800 Alder Blvd, Milwaukee, WI', 'Commercial', 3300.20, 5800.00),
('1900 Cottonwood Dr, Omaha, NE', 'Residential', 1250.45, 2400.00),
('2000 Bay St, Tulsa, OK', 'Commercial', 3650.50, 6200.00),
('2100 Elmwood Ave, Albuquerque, NM', 'Residential', 1100.30, 1900.00),
('2200 Maplewood St, Minneapolis, MN', 'Commercial', 4800.00, 7800.00),
('2300 Pinewood Ln, Fresno, CA', 'Residential', 1275.20, 2300.00),
('2400 Birchwood Ct, Sacramento, CA', 'Commercial', 4150.00, 7100.00),
('2500 Redwood Ave, Long Beach, CA', 'Residential', 1375.50, 2500.00),
('2600 Cypress Blvd, Virginia Beach, VA', 'Commercial', 3900.25, 6500.00),
('2700 Magnolia St, Mesa, AZ', 'Residential', 1450.90, 2600.00),
('2800 Palm Ct, Colorado Springs, CO', 'Commercial', 4300.00, 7500.00);

INSERT INTO Tenant (Name, ContactInfo, LeaseStartDate, LeaseEndDate) VALUES 
('John Doe', 'john.doe@example.com, +1-555-1234', '2024-01-01', '2024-12-31'),
('Jane Smith', 'jane.smith@example.com, +1-555-5678', '2024-02-01', '2025-01-31'),
('Michael Johnson', 'michael.johnson@example.com, +1-555-8765', '2024-03-01', '2025-02-28'),
('Emily Davis', 'emily.davis@example.com, +1-555-4321', '2024-04-01', '2025-03-31'),
('Daniel Brown', 'daniel.brown@example.com, +1-555-9876', '2024-05-01', '2025-04-30'),
('Sophia Wilson', 'sophia.wilson@example.com, +1-555-2468', '2024-06-01', '2025-05-31'),
('William Martinez', 'william.martinez@example.com, +1-555-1357', '2024-07-01', '2025-06-30'),
('Olivia Anderson', 'olivia.anderson@example.com, +1-555-2468', '2024-08-01', '2025-07-31'),
('James Thomas', 'james.thomas@example.com, +1-555-9876', '2024-09-01', '2025-08-31'),
('Isabella Hernandez', 'isabella.hernandez@example.com, +1-555-6543', '2024-10-01', '2025-09-30'),
('Alexander Moore', 'alexander.moore@example.com, +1-555-3210', '2024-11-01', '2025-10-31'),
('Charlotte Taylor', 'charlotte.taylor@example.com, +1-555-1478', '2024-12-01', '2025-11-30'),
('Benjamin Jackson', 'benjamin.jackson@example.com, +1-555-9632', '2025-01-01', '2025-12-31'),
('Mia White', 'mia.white@example.com, +1-555-8520', '2025-02-01', '2026-01-31'),
('Ethan Harris', 'ethan.harris@example.com, +1-555-7531', '2025-03-01', '2026-02-28'),
('Amelia Clark', 'amelia.clark@example.com, +1-555-9513', '2025-04-01', '2026-03-31'),
('Lucas Lewis', 'lucas.lewis@example.com, +1-555-7539', '2025-05-01', '2026-04-30'),
('Harper Robinson', 'harper.robinson@example.com, +1-555-3579', '2025-06-01', '2026-05-31'),
('Mason Walker', 'mason.walker@example.com, +1-555-8524', '2025-07-01', '2026-06-30'),
('Evelyn Hall', 'evelyn.hall@example.com, +1-555-9517', '2025-08-01', '2026-07-31'),
('Logan Allen', 'logan.allen@example.com, +1-555-3574', '2025-09-01', '2026-08-31'),
('Avery Young', 'avery.young@example.com, +1-555-1473', '2025-10-01', '2026-09-30'),
('Henry King', 'henry.king@example.com, +1-555-7412', '2025-11-01', '2026-10-31'),
('Ella Wright', 'ella.wright@example.com, +1-555-9515', '2025-12-01', '2026-11-30'),
('Sebastian Scott', 'sebastian.scott@example.com, +1-555-1476', '2026-01-01', '2026-12-31'),
('Scarlett Green', 'scarlett.green@example.com, +1-555-3698', '2026-02-01', '2027-01-31'),
('Jack Adams', 'jack.adams@example.com, +1-555-2589', '2026-03-01', '2027-02-28'),
('Victoria Baker', 'victoria.baker@example.com, +1-555-1597', '2026-04-01', '2027-03-31'),
('Matthew Nelson', 'matthew.nelson@example.com, +1-555-8526', '2026-05-01', '2027-04-30'),
('Lily Carter', 'lily.carter@example.com, +1-555-7534', '2026-06-01', '2027-05-31');

INSERT INTO LeaseAgreement (PropertyID, TenantID, StartDate, EndDate, MonthlyRent) VALUES 
(1, 1, '2024-01-01', '2024-12-31', 2500.00),
(2, 2, '2024-02-01', '2025-01-31', 5000.00),
(3, 3, '2024-03-01', '2025-02-28', 1800.00),
(4, 4, '2024-04-01', '2025-03-31', 7000.00),
(5, 5, '2024-05-01', '2025-04-30', 2300.00),
(6, 6, '2024-06-01', '2025-05-31', 8500.00),
(7, 7, '2024-07-01', '2025-06-30', 2100.00),
(8, 8, '2024-08-01', '2025-07-31', 4000.00),
(9, 9, '2024-09-01', '2025-08-31', 2200.00),
(10, 10, '2024-10-01', '2025-09-30', 6500.00),
(11, 11, '2024-11-01', '2025-10-31', 1900.00),
(12, 12, '2024-12-01', '2025-11-30', 7500.00),
(13, 13, '2025-01-01', '2025-12-31', 2400.00),
(14, 14, '2025-02-01', '2026-01-31', 5500.00),
(15, 15, '2025-03-01', '2026-02-28', 2500.00),
(16, 16, '2025-04-01', '2026-03-31', 7200.00),
(17, 17, '2025-05-01', '2026-04-30', 2300.00),
(18, 18, '2025-06-01', '2026-05-31', 6000.00),
(19, 19, '2025-07-01', '2026-06-30', 2000.00),
(20, 20, '2025-08-01', '2026-07-31', 4700.00),
(21, 21, '2025-09-01', '2026-08-31', 2200.00),
(22, 22, '2025-10-01', '2026-09-30', 6800.00),
(23, 23, '2025-11-01', '2026-10-31', 2100.00),
(24, 24, '2025-12-01', '2026-11-30', 7500.00),
(25, 25, '2026-01-01', '2026-12-31', 2500.00),
(26, 26, '2026-02-01', '2027-01-31', 5000.00),
(27, 27, '2026-03-01', '2027-02-28', 2600.00),
(28, 28, '2026-04-01', '2027-03-31', 7700.00),
(29, 29, '2026-05-01', '2027-04-30', 2200.00),
(30, 30, '2026-06-01', '2027-05-31', 5800.00);

INSERT INTO Payment (LeaseID, Amount, Date, Method) VALUES 
(1, 2500.00, '2024-01-05', 'Online Transfer'),
(2, 5000.00, '2024-02-03', 'Credit Card'),
(3, 1800.00, '2024-03-07', 'Debit Card'),
(4, 7000.00, '2024-04-10', 'Check'),
(5, 2300.00, '2024-05-05', 'Cash'),
(6, 8500.00, '2024-06-02', 'Online Transfer'),
(7, 2100.00, '2024-07-06', 'Debit Card'),
(8, 4000.00, '2024-08-08', 'Credit Card'),
(9, 2200.00, '2024-09-11', 'Check'),
(10, 6500.00, '2024-10-15', 'Cash'),
(11, 1900.00, '2024-11-05', 'Online Transfer'),
(12, 7500.00, '2024-12-10', 'Credit Card'),
(13, 2400.00, '2025-01-04', 'Debit Card'),
(14, 5500.00, '2025-02-07', 'Check'),
(15, 2500.00, '2025-03-12', 'Cash'),
(16, 7200.00, '2025-04-06', 'Online Transfer'),
(17, 2300.00, '2025-05-08', 'Credit Card'),
(18, 6000.00, '2025-06-02', 'Debit Card'),
(19, 2000.00, '2025-07-10', 'Check'),
(20, 4700.00, '2025-08-14', 'Cash'),
(21, 2200.00, '2025-09-07', 'Online Transfer'),
(22, 6800.00, '2025-10-11', 'Credit Card'),
(23, 2100.00, '2025-11-05', 'Debit Card'),
(24, 7500.00, '2025-12-09', 'Check'),
(25, 2500.00, '2026-01-06', 'Cash'),
(26, 5000.00, '2026-02-04', 'Online Transfer'),
(27, 2600.00, '2026-03-12', 'Credit Card'),
(28, 7700.00, '2026-04-07', 'Debit Card'),
(29, 2200.00, '2026-05-10', 'Check'),
(30, 5800.00, '2026-06-08', 'Cash');

DELIMITER //

CREATE PROCEDURE GetPropertyRentRankings()
BEGIN
    SELECT 
        PropertyID,
        Address,
        RentAmount,
        RANK() OVER (ORDER BY RentAmount DESC) AS RentRank,
        DENSE_RANK() OVER (ORDER BY RentAmount DESC) AS DenseRentRank,
        ROW_NUMBER() OVER (ORDER BY RentAmount DESC) AS RowNum
    FROM 
        Property
    ORDER BY
        RentAmount DESC;
END //

DELIMITER ;

-- Example Usage:
CALL GetPropertyRentRankings();

--  Add a New Property

DELIMITER //
CREATE PROCEDURE AddProperty(
    IN p_Address VARCHAR(255),
    IN p_Type ENUM('Residential', 'Commercial'),
    IN p_Size DECIMAL(10,2),
    IN p_RentAmount DECIMAL(10,2)
)
BEGIN
    INSERT INTO Property (Address, Type, Size, RentAmount) 
    VALUES (p_Address, p_Type, p_Size, p_RentAmount);
END //
DELIMITER ;

CALL AddProperty('1601 New St, Los Angeles, CA', 'Residential', 1250.50, 2700.00);

--  Register a New Tenant

DELIMITER //
CREATE PROCEDURE AddTenant(
    IN p_Name VARCHAR(255),
    IN p_ContactInfo VARCHAR(255),
    IN p_LeaseStartDate DATE,
    IN p_LeaseEndDate DATE
)
BEGIN
    INSERT INTO Tenant (Name, ContactInfo, LeaseStartDate, LeaseEndDate) 
    VALUES (p_Name, p_ContactInfo, p_LeaseStartDate, p_LeaseEndDate);
END //
DELIMITER ;

CALL AddTenant('David Wilson', 'david.wilson@example.com, +1-555-9999', '2024-06-01', '2025-05-31');

-- Create a Lease Agreement

DELIMITER //
CREATE PROCEDURE CreateLeaseAgreement(
    IN p_PropertyID INT,
    IN p_TenantID INT,
    IN p_StartDate DATE,
    IN p_EndDate DATE,
    IN p_MonthlyRent DECIMAL(10,2)
)
BEGIN
    INSERT INTO LeaseAgreement (PropertyID, TenantID, StartDate, EndDate, MonthlyRent) 
    VALUES (p_PropertyID, p_TenantID, p_StartDate, p_EndDate, p_MonthlyRent);
END //
DELIMITER ;

CALL CreateLeaseAgreement(1, 3, '2024-07-01', '2025-06-30', 3000.00);

-- Record a Payment

DELIMITER //
CREATE PROCEDURE AddPayment(
    IN p_LeaseID INT,
    IN p_Amount DECIMAL(10,2),
    IN p_Date DATE,
    IN p_Method ENUM('Cash', 'Check', 'Online Transfer', 'Credit Card', 'Debit Card')
)
BEGIN
    INSERT INTO Payment (LeaseID, Amount, Date, Method) 
    VALUES (p_LeaseID, p_Amount, p_Date, p_Method);
END //
DELIMITER ;

CALL AddPayment(3, 2500.00, '2024-07-05', 'Online Transfer');

-- Submit a Maintenance Request

DELIMITER //
CREATE PROCEDURE SubmitMaintenanceRequest(
    IN p_PropertyID INT,
    IN p_TenantID INT,
    IN p_Description TEXT,
    IN p_DateSubmitted DATE
)
BEGIN
    INSERT INTO MaintenanceRequest (PropertyID, TenantID, Description, DateSubmitted) 
    VALUES (p_PropertyID, p_TenantID, p_Description, p_DateSubmitted);
END //
DELIMITER ;

CALL SubmitMaintenanceRequest(2, 5, 'Plumbing issue in kitchen', '2024-07-10');

-- Get Lease Details by Tenant ID

DELIMITER //
CREATE PROCEDURE GetLeaseByTenant(
    IN p_TenantID INT
)
BEGIN
    SELECT L.LeaseID, P.Address, L.StartDate, L.EndDate, L.MonthlyRent 
    FROM LeaseAgreement L
    JOIN Property P ON L.PropertyID = P.PropertyID
    WHERE L.TenantID = p_TenantID;
END //
DELIMITER ;

CALL GetLeaseByTenant(3);

-- List All Payments for a Lease

DELIMITER //
CREATE PROCEDURE GetPaymentsByLease(
    IN p_LeaseID INT
)
BEGIN
    SELECT PaymentID, Amount, Date, Method 
    FROM Payment 
    WHERE LeaseID = p_LeaseID;
END //
DELIMITER ;

CALL GetPaymentsByLease(2);


-- Update Payment Status

DELIMITER //
CREATE PROCEDURE UpdatePaymentStatus(
    IN p_PaymentID INT,
    IN p_NewAmount DECIMAL(10,2)
)
BEGIN
    UPDATE Payment 
    SET Amount = p_NewAmount
    WHERE PaymentID = p_PaymentID;
END //
DELIMITER ;

CALL UpdatePaymentStatus(1, 2600.00);


-- Retrieve All Active Leases

DELIMITER //
CREATE PROCEDURE GetActiveLeases()
BEGIN
    SELECT L.LeaseID, P.Address, T.Name, L.StartDate, L.EndDate, L.MonthlyRent
    FROM LeaseAgreement L
    JOIN Property P ON L.PropertyID = P.PropertyID
    JOIN Tenant T ON L.TenantID = T.TenantID
    WHERE L.EndDate >= CURDATE();
END //
DELIMITER ;


CALL GetActiveLeases();


-- Delete a Lease Agreement

DELIMITER //
CREATE PROCEDURE DeleteLease(
    IN p_LeaseID INT
)
BEGIN
    DELETE FROM LeaseAgreement WHERE LeaseID = p_LeaseID;
END //
DELIMITER ;

CALL DeleteLease(4);

-- Occupancy Trend (Monthly Analysis)

DELIMITER //
CREATE PROCEDURE OccupancyTrend()
BEGIN
    SELECT 
        YEAR(L.StartDate) AS Year,
        MONTH(L.StartDate) AS Month,
        COUNT(DISTINCT L.PropertyID) AS OccupiedUnits,
        LAG(COUNT(DISTINCT L.PropertyID)) OVER (ORDER BY YEAR(L.StartDate), MONTH(L.StartDate)) AS PreviousMonthOccupied,
        (COUNT(DISTINCT L.PropertyID) - LAG(COUNT(DISTINCT L.PropertyID)) OVER (ORDER BY YEAR(L.StartDate), MONTH(L.StartDate))) AS MonthOverMonthChange
    FROM LeaseAgreement L
    WHERE L.StartDate IS NOT NULL
    GROUP BY Year, Month
    ORDER BY Year DESC, Month DESC;
END //
DELIMITER ;
CALL OccupancyTrend();


