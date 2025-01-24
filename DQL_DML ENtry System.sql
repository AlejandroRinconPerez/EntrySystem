-- Inserts para la tabla base_class_people
INSERT INTO `entrysystem`.`base_class_people` (`id`, `cedula`, `name`, `telefono`) VALUES
(1, '12345678', 'Juan Perez', '555-1234'),
(2, '87654321', 'Maria Lopez', '555-5678');

-- Inserts para la tabla company
INSERT INTO `entrysystem`.`company` (`id_company`, `name`) VALUES
(1, 'Tech Solutions'),
(2, 'Green Industries');

-- Inserts para la tabla people
INSERT INTO `entrysystem`.`people` (`person_type`, `id`, `id_company`) VALUES
(1, 1, 1),
(0, 2, NULL);

-- Inserts para la tabla access
INSERT INTO `entrysystem`.`access` (`access_type`, `entry_access`, `exit_access`, `id_access`, `id_people`) VALUES
(1, '2025-01-01', '2025-01-01', 1, 1),
(0, '2025-01-02', NULL, 2, 2);

-- Inserts para la tabla access_note
INSERT INTO `entrysystem`.`access_note` (`id`, `id_access`, `note`) VALUES
(1, 1, 'Entrada autorizada'),
(2, 2, 'Sin salida registrada');

-- Inserts para la tabla porters
INSERT INTO `entrysystem`.`porters` (`employment_date`, `position`, `id`, `id_jefe`) VALUES
('2023-01-01', 1, 1, NULL),
('2023-06-01', 0, 2, 1);

-- Inserts para la tabla access_porters
INSERT INTO `entrysystem`.`access_porters` (`access_id`, `porters_id`) VALUES
(1, 1),
(2, 2);

-- Inserts para la tabla carnet
INSERT INTO `entrysystem`.`carnet` (`status`, `id_carnet`, `id_people`, `code`) VALUES
(1, 1, 1, 'CARNET123'),
(0, 2, 2, 'CARNET456');

-- Inserts para la tabla membership
INSERT INTO `entrysystem`.`membership` (`duration`, `price`, `vehicle_type`, `id_membership`) VALUES
(12, 120.50, 1, 1),
(6, 60.00, 0, 2);

-- Inserts para la tabla invoice
INSERT INTO `entrysystem`.`invoice` (`date`, `status`, `id_invoice`, `id_membership`, `id_people`, `id_porter`) VALUES
('2025-01-10', 1, 1, 1, 1, 1),
('2025-01-15', 0, 2, 2, 2, 2);

-- Inserts para la tabla registered_equipment
INSERT INTO `entrysystem`.`registered_equipment` (`registration_date`, `id`, `id_people`, `serial`, `description`) VALUES
('2025-01-01', 1, 1, 'SERIAL123', 'Laptop Dell'),
('2025-01-02', 2, 2, 'SERIAL456', 'Impresora HP');

-- Inserts para la tabla user
INSERT INTO `entrysystem`.`user` (`id`, `id_porters`, `password`, `user_name`) VALUES
(1, 1, 'securepassword', 'juan.perez'),
(2, 2, 'password123', 'maria.lopez');

-- Inserts para la tabla vehicle
INSERT INTO `entrysystem`.`vehicle` (`vehicle_type`, `id_access`, `id_people`, `id_vehicle`, `plate`) VALUES
(1, 1, 1, 1, 'ABC123'),
(0, 2, 2, 2, 'XYZ789');

-- Selects para cada tabla
SELECT * FROM `entrysystem`.`base_class_people`;
SELECT * FROM `entrysystem`.`company`;
SELECT * FROM `entrysystem`.`people`;
SELECT * FROM `entrysystem`.`access`;
SELECT * FROM `entrysystem`.`access_note`;
SELECT * FROM `entrysystem`.`porters`;
SELECT * FROM `entrysystem`.`access_porters`;
SELECT * FROM `entrysystem`.`carnet`;
SELECT * FROM `entrysystem`.`membership`;
SELECT * FROM `entrysystem`.`invoice`;
SELECT * FROM `entrysystem`.`registered_equipment`;
SELECT * FROM `entrysystem`.`user`;
SELECT * FROM `entrysystem`.`vehicle`;

