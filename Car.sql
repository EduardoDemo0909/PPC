CREATE TABLE car_table (
	ID SERIAL PRIMARY KEY,
    Car_Name VARCHAR(255),
    Year INT,
    Selling_Price NUMERIC,
    Present_Price NUMERIC,
    Kms_Driven INT,
    Fuel_Type VARCHAR(255),
    Seller_Type VARCHAR(255),
    Transmission VARCHAR(255),
    Owner INT
);

drop table car_table

INSERT INTO car_table (ID, Car_Name, Year, Selling_Price, Present_Price, Kms_Driven, Fuel_Type, Seller_Type, Transmission, Owner)
VALUES
  (10, 'ritz', 2014, 3.35, 5.59, 27000, 'Petrol', 'Dealer', 'Manual', 0),
  (20, 'sx4', 2013, 4.75, 9.54, 43000, 'Diesel', 'Dealer', 'Manual', 0),
  (30, 'ciaz', 2017, 7.25, 9.85, 6900, 'Petrol', 'Dealer', 'Manual', 0),
  (40, 'wagon r', 2011, 2.85, 4.15, 5200, 'Petrol', 'Dealer', 'Manual', 0),
  (50, 'swift', 2014, 4.60, 6.87, 42450, 'Diesel', 'Dealer', 'Manual', 0),
  (60, 'fortuner', 2015, 23.5, 35.96, 47000, 'Diesel', 'Dealer', 'Automatic', 0),
  (61, 'fortuner', 2020, 33.0, 36.23, 6000, 'Diesel', 'Dealer', 'Automatic', 0),
  (70, 'land cruiser', 2018, 35.0, 92.60, 78000, 'Diesel', 'Dealer', 'Manual', 0),
  (80, 'innova', 2010, 3.49, 13.46, 197176, 'Diesel', 'Dealer', 'Manual', 0),
  (90, 'Honda Karizma', 2019, 0.31, 1.05, 213000, 'Petrol', 'Individual', 'Manual', 0),
  (100, 'Activa 3g', 2017, 0.17, 0.52, 500000, 'Petrol', 'Individual', 'Automatic', 0);
  
INSERT INTO car_table (ID, Car_Name, Year, Selling_Price, Present_Price, Kms_Driven, Fuel_Type, Seller_Type, Transmission, Owner)
VALUES
  (101, 'Toyota Corolla', 2018, 15000, 17000, 20000, 'Petrol', 'Dealer', 'Manual', 1),
  (110, 'Honda Civic', 2019, 16000, 18000, 22000, 'Petrol', 'Dealer', 'Manual', 1),
  (120, 'Ford Mustang', 2017, 30000, 35000, 15000, 'Petrol', 'Dealer', 'Automatic', 2),
  (130, 'Chevrolet Malibu', 2016, 12000, 15000, 25000, 'Petrol', 'Dealer', 'Manual', 1),
  (140, 'Nissan Altima', 2018, 13000, 14000, 19000, 'Petrol', 'Dealer', 'Manual', 1),
  (150, 'Hyundai Sonata', 2019, 17000, 19000, 22000, 'Petrol', 'Dealer', 'Manual', 2),
  (160, 'Volkswagen Passat', 2017, 19000, 21000, 18000, 'Diesel', 'Dealer', 'Automatic', 1),
  (170, 'BMW 3 Series', 2018, 25000, 28000, 15000, 'Petrol', 'Dealer', 'Automatic', 2),
  (180, 'Audi A4', 2019, 27000, 29000, 22000, 'Petrol', 'Dealer', 'Automatic', 2),
  (190, 'Mercedes-Benz C-Class', 2017, 29000, 32000, 20000, 'Diesel', 'Dealer', 'Automatic', 1),
  (200, 'Lexus ES', 2018, 26000, 30000, 17000, 'Petrol', 'Dealer', 'Automatic', 1),
  (210, 'Kia Optima', 2019, 18000, 21000, 25000, 'Petrol', 'Dealer', 'Manual', 2),
  (220, 'Tesla Model S', 2016, 55000, 60000, 12000, 'Electric', 'Dealer', 'Automatic', 1),
  (230, 'Subaru Impreza', 2017, 15000, 17000, 19000, 'Petrol', 'Dealer', 'Manual', 1),
  (240, 'Mazda 6', 2018, 16000, 18000, 22000, 'Petrol', 'Dealer', 'Manual', 2),
  (250, 'Chrysler 300', 2019, 20000, 22000, 18000, 'Petrol', 'Dealer', 'Automatic', 1),
  (260, 'Buick LaCrosse', 2017, 18000, 20000, 21000, 'Petrol', 'Dealer', 'Manual', 1),
  (270, 'Jaguar XE', 2018, 38000, 40000, 15000, 'Petrol', 'Dealer', 'Automatic', 2),
  (280, 'Mitsubishi Outlander', 2019, 24000, 26000, 22000, 'Petrol', 'Dealer', 'Manual', 1),
  (290, 'Land Rover Range Rover', 2017, 70000, 75000, 19000, 'Diesel', 'Dealer', 'Automatic', 2),
  (300, 'Jeep Cherokee', 2018, 26000, 29000, 18000, 'Petrol', 'Dealer', 'Automatic', 1),
  (310, 'Dodge Charger', 2019, 30000, 32000, 17000, 'Petrol', 'Dealer', 'Manual', 2),
  (320, 'Nissan Rogue', 2017, 22000, 24000, 22000, 'Petrol', 'Dealer', 'Automatic', 1),
  (330, 'Hyundai Tucson', 2018, 19000, 21000, 25000, 'Petrol', 'Dealer', 'Manual', 1),
  (340, 'Subaru Forester', 2019, 22000, 24000, 19000, 'Petrol', 'Dealer', 'Automatic', 2),
  (350, 'Chevrolet Traverse', 2017, 25000, 28000, 17000, 'Petrol', 'Dealer', 'Automatic', 1),
  (360, 'Ford Escape', 2018, 23000, 25000, 22000, 'Petrol', 'Dealer', 'Manual', 2),
  (370, 'Toyota Highlander', 2019, 30000, 32000, 18000, 'Petrol', 'Dealer', 'Manual', 1),
  (380, 'Jeep Wrangler', 2017, 27000, 30000, 19000, 'Petrol', 'Dealer', 'Automatic', 2),
  (390, 'Volkswagen Tiguan', 2018, 26000, 29000, 17000, 'Petrol', 'Dealer', 'Automatic', 1),
  (400, 'Mazda CX-5', 2019, 22000, 24000, 22000, 'Petrol', 'Dealer', 'Manual', 1),
  (410, 'Kia Sorento', 2017, 20000, 22000, 25000, 'Petrol', 'Dealer', 'Manual', 2),
  (420, 'Honda CR-V', 2018, 23000, 26000, 19000, 'Petrol', 'Dealer', 'Automatic', 1),
  (430, 'Lexus RX', 2019, 35000, 38000, 17000, 'Petrol', 'Dealer', 'Automatic', 1),
  (440, 'Nissan Murano', 2017, 24000, 26000, 22000, 'Petrol', 'Dealer', 'Automatic', 2),
  (450, 'Buick Encore', 2018, 18000, 20000, 22000, 'Petrol', 'Dealer', 'Manual', 1),
  (460, 'Kia Sportage', 2019, 22000, 24000, 19000, 'Petrol', 'Dealer', 'Manual', 1),
  (470, 'Acura MDX', 2017, 28000, 30000, 17000, 'Petrol', 'Dealer', 'Automatic', 2),
  (480, 'Mitsubishi Outlander Sport', 2018, 17000, 19000, 22000, 'Petrol', 'Dealer', 'Automatic', 1),
  (490, 'Jeep Grand Cherokee', 2019, 33000, 35000, 22000, 'Petrol', 'Dealer', 'Manual', 1),
  (500, 'Subaru Crosstrek', 2017, 25000, 28000, 18000, 'Petrol', 'Dealer', 'Manual', 2);

SELECT car_name from Car_table;


INSERT INTO car_table (Car_Name, Year, Selling_Price, Present_Price, Kms_Driven, Fuel_Type, Seller_Type, Transmission, Owner)
////////////////////////////////////////////////////////////////////////////////////////////////////
-- exemplo de GENERATOR_SERIES
SELECT car_table,
  car_table, -- Car Name
  2010 + (id_generator.id % 10), -- Year (in increments of 10)
  ROUND(RANDOM() * 30, 2) + 10, -- Selling Price (random between 10 and 40)
  ROUND(RANDOM() * 40, 2) + 10, -- Present Price (random between 10 and 50)
  FLOOR(RANDOM() * 90000) + 1000, -- Kms Driven (random between 1000 and 90000)
  CASE Fuel_Type.id % 3
    WHEN 0 THEN 'Petrol'
    WHEN 1 THEN 'Diesel'
    ELSE 'Electric'
  END, -- Fuel Type (alternates between Petrol, Diesel, and Electric)
  CASE Seller_Type.id % 2
    WHEN 0 THEN 'Dealer'
    ELSE 'Individual'
  END, -- Seller Type (alternates between Dealer and Individual)
  CASE Transmission.id % 2
    WHEN 0 THEN 'Manual'
    ELSE 'Automatic'
  END, -- Transmission (alternates between Manual and Automatic)
  0 AS Owner -- Owner (constant value)
FROM GENERATE_SERIES(500, 159, 10) AS id_generator;
////////////////////////////////////////////////////////////////////////////////////////////////////

SELECT
  Car_Name,
  Selling_Price,
  CASE
    WHEN Selling_Price > 40000 THEN 'Expensive'
    WHEN Selling_Price > 30000 THEN 'Moderate'
    ELSE 'Affordable'
  END AS price_category
FROM car_table;



SELECT Car_name, Selling_Price from car_table where Selling_Price < 80000;


SELECT MIN(year) from car_table;
SELECT AVG(year) from car_table;
SELECT MAX(year) from car_table;

SELECT Car_name from car_table where Car_name like 'a%';
SELECT * FROM CAR_table;

SELECT Car_name from car_table where year > 2016;

select * from car_table





CREATE TABLE teste (
    id serial primary key,
    preco numeric
);


INSERT INTO teste (id, preco)
SELECT 
    (random() * 1000)::integer,
    (random() * 10)::numeric (10, 2)
FROM generate_series(1, 20);

truncate teste
select * from teste;













