use sales;
INSERT INTO manufacturers (name, country)
VALUES
    ('BMW', 'Germany'),
    ('Ford', 'USA'),
    ('Toyota', 'Japan');

INSERT INTO products (manufacturer_id, model, price, horsepower, fuel_efficiency)
VALUES
    (1, 'X5', 75000.00, 345, 7),
    (1, '330d', 55000.00, 245, 5),
    (2, 'Mustang', 50000.00, 145, 6),
    (3, 'Carina', 22000.00, 95, 4);

INSERT INTO customers (first_name, last_name, address, city, state)
VALUES
    ('John', 'Wayne', 'Main Road 233', 'LA', 'CA'),
    ('Richard', 'Gere', 'Flee Road 113', 'New York', 'NY');

INSERT INTO employees (first_name, last_name, position, salary, address, mobile, is_active)
VALUES
    ('Linus', 'Thorwald', 'Sales Associate', 45000.00, 'Boulevard 10', '+012 12345678', 1),
    ('Max', 'Reger', 'Sales Associate', 45000.00, 'Boulevard 8', '+012 21345678', 1),
    ('Toni', 'Marshall', 'Sales Manager', 65000.00, 'Lumbuk 33', '+022 21 678 23', 1),
    ('Jimmy', 'Petersen', 'Sales Manager', 73000.00, 'Platz 3', '+49 123 85', 1);


INSERT INTO inventory (product_id, quantity, last_inventory_date)
VALUES
    (1, 50, DATE('2023-04-30')),
    (2, 30, DATE('2023-04-30')),
    (3, 25, DATE('2023-04-30')),
    (4, 30, DATE('2023-04-30'));

CREATE TRIGGER update_inventory
    AFTER INSERT ON sales
    FOR EACH ROW
BEGIN
    UPDATE inventory SET
        last_inventory_date = NEW.sale_date,
        quantity = quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END;

INSERT INTO sales (sale_date, customer_id, product_id, employee_id, quantity, total_price)
VALUES
    (DATE('2023-04-01'), 1, 1, 1, 2, 56000.00),
    (DATE('2023-04-02'), 2, 2, 1, 1, 22000.00),
    (DATE('2023-04-02'), 1, 3, 2, 1, 41250.00),
    (DATE('2023-04-02'), 1, 3, 3, 2, 51250.00),
    (DATE('2023-05-01'), 1, 1, 1, 2, 56000.00),
    (DATE('2023-05-02'), 2, 2, 1, 1, 22000.00),
    (DATE('2023-05-02'), 1, 3, 2, 1, 41250.00),
    (DATE('2023-05-02'), 1, 3, 3, 2, 51250.00),
    (DATE('2023-05-02'), 1, 3, 4, 3, 111250.00),
    (DATE('2023-05-03'), 2, 4, 2, 2, 60000.00),
    (DATE('2023-05-03'), 1, 1, 2, 3, 84000.00);