USE tlp_shop;

DROP TABLE IF EXISTS inventario;

CREATE TABLE inventario (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(128) NOT NULL,
    tipo VARCHAR(128) DEFAULT 'Comun',
    marca VARCHAR(128) DEFAULT 'Generico',
    precio FLOAT(10,5) NOT NULL,
    items INT(2) DEFAULT 1,
    PRIMARY KEY (id)
);

------------
-- VIEWS  --
------------

DROP VIEW IF EXISTS tipo_clases;

CREATE VIEW `tipo_clases` AS (
    SELECT DISTINCT`tipo`FROM `inventario`);


-------------
-- INSERTS --
-------------

START TRANSACTION;
USE tlp_shop;

INSERT INTO `tlp_shop`.`inventario` (`nombre`, `tipo`, `marca`, `precio`, `items`) 
    VALUES ('tijera', 'oficina', 'artesco', 3, 1);

INSERT INTO `tlp_shop`.`inventario` (`nombre`, `tipo`, `marca`, `precio`, `items`) 
    VALUES ('tajador', 'oficina', 'artesco', 0.5, 1);

INSERT INTO `tlp_shop`.`inventario` (`nombre`, `tipo`, `marca`, `precio`, `items`) 
    VALUES ('papelA4', 'oficina', 'atlas', 8, 100);

INSERT INTO `tlp_shop`.`inventario` (`nombre`, `tipo`, `marca`, `precio`, `items`) 
    VALUES ('lejia', 'limpieza', 'clorox', 5, 1);

INSERT INTO `tlp_shop`.`inventario` (`nombre`, `tipo`, `marca`, `precio`, `items`) 
    VALUES ('escoba', 'limpieza', 'basa', 10, 1);

INSERT INTO `tlp_shop`.`inventario` (`nombre`, `tipo`, `marca`, `precio`, `items`) 
    VALUES ('alcohol isopripilico', 'limpieza', 'strong', 12, 1);

INSERT INTO `tlp_shop`.`inventario` (`nombre`, `tipo`, `marca`, `precio`, `items`) 
    VALUES ('cpu', 'tecnologia', 'AMD', 300, 1);

INSERT INTO `tlp_shop`.`inventario` (`nombre`, `tipo`, `marca`, `precio`, `items`) 
    VALUES ('celular', 'tecnologia', 'android', 400, 1);

INSERT INTO `tlp_shop`.`inventario` (`nombre`, `tipo`, `marca`, `precio`, `items`) 
    VALUES ('stereo', 'tecnologia', 'bose', 1000, 1);




COMMIT;

SELECT * FROM tlp_shop.inventario;
