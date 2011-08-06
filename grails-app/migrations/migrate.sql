-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: changelog.xml
-- Ran at: 7/16/11 1:01 PM
-- Against: root@jdbc:mysql://localhost/cinema
-- LiquiBase version: 1.9.3
-- *********************************************************************

SELECT COUNT(*) FROM `DATABASECHANGELOGLOCK` WHERE ID=1;

SELECT COUNT(*) FROM `DATABASECHANGELOGLOCK` WHERE ID=1;

-- Changeset changelog.xml::1310831886643-1::ubuntu6500 (generated)::(MD5Sum: 50669761dae5b93bb2edd1d6e29c7c57)
CREATE TABLE `boc` (`id` BIGINT AUTO_INCREMENT  NOT NULL, `version` BIGINT NOT NULL, `accion` VARCHAR(10) NOT NULL, `desde` INT NOT NULL, `exhibidor_id` BIGINT NOT NULL, `fecha` DATETIME NOT NULL, `hasta` INT NOT NULL, `serie` VARCHAR(255) NOT NULL, CONSTRAINT `PK_BOC` PRIMARY KEY (`id`));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', '50669761dae5b93bb2edd1d6e29c7c57', '1310831886643-1', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-2::ubuntu6500 (generated)::(MD5Sum: 37718dcc163ba335a3b9b271644ea5f6)
CREATE TABLE `complejo` (`id` BIGINT AUTO_INCREMENT  NOT NULL, `version` BIGINT NOT NULL, `codigo` INT NOT NULL, `denominacion` VARCHAR(255) NOT NULL, `fecha_apertura` DATETIME NOT NULL, CONSTRAINT `PK_COMPLEJO` PRIMARY KEY (`id`));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', '37718dcc163ba335a3b9b271644ea5f6', '1310831886643-2', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-3::ubuntu6500 (generated)::(MD5Sum: c17e8e464072d12724adffc1911bb4f6)
CREATE TABLE `ddjj_exhibidor` (`id` BIGINT AUTO_INCREMENT  NOT NULL, `version` BIGINT NOT NULL, `exhibidora_id` BIGINT NOT NULL, `fecha` DATETIME NOT NULL, `file` VARCHAR(255) NOT NULL, CONSTRAINT `PK_DDJJ_EXHIBIDOR` PRIMARY KEY (`id`));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', 'c17e8e464072d12724adffc1911bb4f6', '1310831886643-3', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-4::ubuntu6500 (generated)::(MD5Sum: 473a32b772bd1797f4d61c89143d3bfd)
CREATE TABLE `ddjj_exhibidor_ddjj_exhibidor_registry` (`ddjj_exhibidor_ddjj_exhibidor_regs_id` BIGINT, `ddjj_exhibidor_registry_id` BIGINT);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', '473a32b772bd1797f4d61c89143d3bfd', '1310831886643-4', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-5::ubuntu6500 (generated)::(MD5Sum: 5d5de2e52bfe2a3da3b6a5dce53827f2)
CREATE TABLE `ddjj_exhibidor_registry` (`id` BIGINT AUTO_INCREMENT  NOT NULL, `version` BIGINT NOT NULL, `anio` INT NOT NULL, `cantidad_entradas` INT NOT NULL, `ddjj_exhibidor_id` BIGINT NOT NULL, `dia` INT NOT NULL, `hora` VARCHAR(255) NOT NULL, `impuesto` DECIMAL(19,2) NOT NULL, `impuesto_total` DECIMAL(19,2) NOT NULL, `mes` INT NOT NULL, `numero_inicialboc` INT NOT NULL, `pelicula_id` BIGINT NOT NULL, `periodo_fiscal` INT NOT NULL, `precio_basico` DECIMAL(19,2) NOT NULL, `precio_venta` DECIMAL(19,2) NOT NULL, `renglon` INT NOT NULL, `serieboc` VARCHAR(255) NOT NULL, `tipo_funcion` VARCHAR(4) NOT NULL, `distribuidor_id` BIGINT, `exhibidor_id` BIGINT, `sala_id` BIGINT, CONSTRAINT `PK_DDJJ_EXHIBIDOR_REGISTRY` PRIMARY KEY (`id`));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', '5d5de2e52bfe2a3da3b6a5dce53827f2', '1310831886643-5', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-6::ubuntu6500 (generated)::(MD5Sum: 2181f7779ff1b29f69fa5817a20e393)
CREATE TABLE `ddjj_video` (`id` BIGINT AUTO_INCREMENT  NOT NULL, `version` BIGINT NOT NULL, `cantidad_total_alquiler` INT NOT NULL, `cantidad_total_venta` INT NOT NULL, `gravamen_total_alquiler` INT NOT NULL, `gravamen_total_venta` INT NOT NULL, `periodo` VARCHAR(255) NOT NULL, `precio_total_alquiler` INT NOT NULL, `precio_total_venta` INT NOT NULL, `video_club_id` BIGINT, CONSTRAINT `PK_DDJJ_VIDEO` PRIMARY KEY (`id`));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', '2181f7779ff1b29f69fa5817a20e393', '1310831886643-6', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-7::ubuntu6500 (generated)::(MD5Sum: 6ecdaddbf51f1e8d96654271eb962d)
CREATE TABLE `ddjj_video_pelicula` (`ddjj_video_peliculas_id` BIGINT, `pelicula_id` BIGINT);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', '6ecdaddbf51f1e8d96654271eb962d', '1310831886643-7', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-8::ubuntu6500 (generated)::(MD5Sum: 7e325bf427c4d14c9d448470361f19b6)
CREATE TABLE `empresa` (`id` BIGINT AUTO_INCREMENT  NOT NULL, `version` BIGINT NOT NULL, `codigo` INT NOT NULL, `fecha_fin_actividad` DATETIME, `fecha_inicio_actividad` DATETIME NOT NULL, `fecha_ultima_revalida` DATETIME NOT NULL, `persona_fisica_id` BIGINT, `persona_juridica_id` BIGINT, `class` VARCHAR(255) NOT NULL, CONSTRAINT `PK_EMPRESA` PRIMARY KEY (`id`));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', '7e325bf427c4d14c9d448470361f19b6', '1310831886643-8', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-9::ubuntu6500 (generated)::(MD5Sum: ca494d62309b9fe62f5d33b460a592c3)
CREATE TABLE `local` (`id` BIGINT AUTO_INCREMENT  NOT NULL, `version` BIGINT NOT NULL, `video_id` BIGINT NOT NULL, CONSTRAINT `PK_LOCAL` PRIMARY KEY (`id`));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', 'ca494d62309b9fe62f5d33b460a592c3', '1310831886643-9', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-10::ubuntu6500 (generated)::(MD5Sum: 7dcaa6d1dd04c191d522d5fa86ac0b9)
CREATE TABLE `localidad` (`id` BIGINT AUTO_INCREMENT  NOT NULL, `version` BIGINT NOT NULL, `name` VARCHAR(255) NOT NULL, `provincia_id` BIGINT NOT NULL, CONSTRAINT `PK_LOCALIDAD` PRIMARY KEY (`id`));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', '7dcaa6d1dd04c191d522d5fa86ac0b9', '1310831886643-10', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-11::ubuntu6500 (generated)::(MD5Sum: 92448c62ba739891e1a9e981f1bd64b)
CREATE TABLE `pago` (`id` BIGINT AUTO_INCREMENT  NOT NULL, `version` BIGINT NOT NULL, `exhibidor_id` BIGINT NOT NULL, `video_club_id` BIGINT NOT NULL, CONSTRAINT `PK_PAGO` PRIMARY KEY (`id`));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', '92448c62ba739891e1a9e981f1bd64b', '1310831886643-11', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-12::ubuntu6500 (generated)::(MD5Sum: 323735cde454ecc6345bb8fda7e0b01)
CREATE TABLE `pelicula` (`id` BIGINT AUTO_INCREMENT  NOT NULL, `version` BIGINT NOT NULL, `codigo` BIGINT NOT NULL, `distribuidor_id` BIGINT NOT NULL, `fecha_estreno` DATETIME NOT NULL, `productor_id` BIGINT NOT NULL, `titulo` VARCHAR(255) NOT NULL, CONSTRAINT `PK_PELICULA` PRIMARY KEY (`id`));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', '323735cde454ecc6345bb8fda7e0b01', '1310831886643-12', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-13::ubuntu6500 (generated)::(MD5Sum: d696cabbdb6bc83c3aba3cecedb97b)
CREATE TABLE `persona_fisica` (`id` BIGINT AUTO_INCREMENT  NOT NULL, `version` BIGINT NOT NULL, `apellido` VARCHAR(255) NOT NULL, `codigo_postal` VARCHAR(255) NOT NULL, `condicioniva` VARCHAR(255) NOT NULL, `cuit` VARCHAR(255) NOT NULL, `domicilio` VARCHAR(255) NOT NULL, `email` VARCHAR(255) NOT NULL, `localidad_id` BIGINT NOT NULL, `nombre` VARCHAR(255) NOT NULL, `numero_documento` INT NOT NULL, `provincia_id` BIGINT NOT NULL, `sexo` VARCHAR(255) NOT NULL, `telefono` VARCHAR(255) NOT NULL, `tipo_documento` VARCHAR(255) NOT NULL, CONSTRAINT `PK_PERSONA_FISICA` PRIMARY KEY (`id`));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', 'd696cabbdb6bc83c3aba3cecedb97b', '1310831886643-13', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-14::ubuntu6500 (generated)::(MD5Sum: abccee8a86e4939e05cc363805fee66)
CREATE TABLE `persona_juridica` (`id` BIGINT AUTO_INCREMENT  NOT NULL, `version` BIGINT NOT NULL, `codigo_postal` VARCHAR(255) NOT NULL, `condicioniva` VARCHAR(255) NOT NULL, `cuit` VARCHAR(255) NOT NULL, `domicilio` VARCHAR(255) NOT NULL, `email` VARCHAR(255) NOT NULL, `localidad_id` BIGINT, `provincia_id` BIGINT NOT NULL, `razon_social` VARCHAR(255) NOT NULL, `telefono` VARCHAR(255) NOT NULL, `tipo_sociedad` VARCHAR(255) NOT NULL, CONSTRAINT `PK_PERSONA_JURIDICA` PRIMARY KEY (`id`));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', 'abccee8a86e4939e05cc363805fee66', '1310831886643-14', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-15::ubuntu6500 (generated)::(MD5Sum: 5d66362f5114bbc2ce3212d9ec8e69fa)
CREATE TABLE `pfisicapjuridica` (`id` BIGINT AUTO_INCREMENT  NOT NULL, `version` BIGINT NOT NULL, `cargo` VARCHAR(255) NOT NULL, `persona_fisica_id` BIGINT NOT NULL, `persona_juridica_id` BIGINT NOT NULL, `p_fisicapjuridicas_idx` INT, `p_juridicapfisicas_idx` INT, CONSTRAINT `PK_PFISICAPJURIDICA` PRIMARY KEY (`id`));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', '5d66362f5114bbc2ce3212d9ec8e69fa', '1310831886643-15', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-16::ubuntu6500 (generated)::(MD5Sum: d115cf986016d6383e4ca8f0bd862125)
CREATE TABLE `provincia` (`id` BIGINT AUTO_INCREMENT  NOT NULL, `version` BIGINT NOT NULL, `name` VARCHAR(255) NOT NULL, CONSTRAINT `PK_PROVINCIA` PRIMARY KEY (`id`));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', 'd115cf986016d6383e4ca8f0bd862125', '1310831886643-16', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-17::ubuntu6500 (generated)::(MD5Sum: a5ef25309e513e0b78888483a2ce61)
CREATE TABLE `sala` (`id` BIGINT AUTO_INCREMENT  NOT NULL, `version` BIGINT NOT NULL, `capacidad` INT NOT NULL, `codigo` INT NOT NULL, `codigo_postal` VARCHAR(8) NOT NULL, `complejo_id` BIGINT, `domicilio` VARCHAR(80) NOT NULL, `email` VARCHAR(60) NOT NULL, `exhibidor_id` BIGINT NOT NULL, `fecha_inicio_actividad` DATETIME NOT NULL, `fecha_renovacion` DATETIME NOT NULL, `frecuencia` VARCHAR(255) NOT NULL, `localidad_id` BIGINT NOT NULL, `nombre` VARCHAR(80) NOT NULL, `provincia_id` BIGINT NOT NULL, `sistema_proyeccion` VARCHAR(255) NOT NULL, `tipo` VARCHAR(22) NOT NULL, CONSTRAINT `PK_SALA` PRIMARY KEY (`id`));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', 'a5ef25309e513e0b78888483a2ce61', '1310831886643-17', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-18::ubuntu6500 (generated)::(MD5Sum: af9ddcd472d2aa7f2156ba6cbe979e3)
CREATE TABLE `sala_dias_exhibicion` (`sala_id` BIGINT, `dia` VARCHAR(255));

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Table', '', 'af9ddcd472d2aa7f2156ba6cbe979e3', '1310831886643-18', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-19::ubuntu6500 (generated)::(MD5Sum: 2e7775599723c56170b6281d46e78add)
CREATE UNIQUE INDEX `codigo` ON `complejo`(`codigo`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Index', '', '2e7775599723c56170b6281d46e78add', '1310831886643-19', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-20::ubuntu6500 (generated)::(MD5Sum: de426b70915920865d214560f53b98e)
CREATE UNIQUE INDEX `codigo` ON `empresa`(`codigo`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Index', '', 'de426b70915920865d214560f53b98e', '1310831886643-20', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-21::ubuntu6500 (generated)::(MD5Sum: 22567d6bb6216ee84eb545bc167b675)
CREATE UNIQUE INDEX `cuit` ON `persona_fisica`(`cuit`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Index', '', '22567d6bb6216ee84eb545bc167b675', '1310831886643-21', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-22::ubuntu6500 (generated)::(MD5Sum: 35daa5d1e3a631892448bcd927c57b)
CREATE UNIQUE INDEX `cuit` ON `persona_juridica`(`cuit`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Index', '', '35daa5d1e3a631892448bcd927c57b', '1310831886643-22', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-23::ubuntu6500 (generated)::(MD5Sum: 32b46580c144dc4fccaca2f864f911d)
CREATE UNIQUE INDEX `razon_social` ON `persona_juridica`(`razon_social`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Create Index', '', '32b46580c144dc4fccaca2f864f911d', '1310831886643-23', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-24::ubuntu6500 (generated)::(MD5Sum: f898bc35ebe22dcefdb70d33be81a97)
ALTER TABLE `boc` ADD CONSTRAINT `FK17DB6BBF63F5D` FOREIGN KEY (`exhibidor_id`) REFERENCES `empresa`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', 'f898bc35ebe22dcefdb70d33be81a97', '1310831886643-24', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-25::ubuntu6500 (generated)::(MD5Sum: 30bae4fc1aafc99336d8fe5247b0a435)
ALTER TABLE `ddjj_exhibidor` ADD CONSTRAINT `FK4A2AC36DE1873F34` FOREIGN KEY (`exhibidora_id`) REFERENCES `empresa`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '30bae4fc1aafc99336d8fe5247b0a435', '1310831886643-25', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-26::ubuntu6500 (generated)::(MD5Sum: 8fc6875befac8849de59585a967a3b6)
ALTER TABLE `ddjj_exhibidor_ddjj_exhibidor_registry` ADD CONSTRAINT `FKD9BDB9FD6783462A` FOREIGN KEY (`ddjj_exhibidor_ddjj_exhibidor_regs_id`) REFERENCES `ddjj_exhibidor`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '8fc6875befac8849de59585a967a3b6', '1310831886643-26', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-27::ubuntu6500 (generated)::(MD5Sum: 111f2668123da85c54a4287030167d49)
ALTER TABLE `ddjj_exhibidor_ddjj_exhibidor_registry` ADD CONSTRAINT `FKD9BDB9FDAADD98D7` FOREIGN KEY (`ddjj_exhibidor_registry_id`) REFERENCES `ddjj_exhibidor_registry`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '111f2668123da85c54a4287030167d49', '1310831886643-27', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-28::ubuntu6500 (generated)::(MD5Sum: 9214133ba6682ea65010c26e1afed4d7)
ALTER TABLE `ddjj_exhibidor_registry` ADD CONSTRAINT `FK55C728CFD3495C1C` FOREIGN KEY (`ddjj_exhibidor_id`) REFERENCES `ddjj_exhibidor`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '9214133ba6682ea65010c26e1afed4d7', '1310831886643-28', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-29::ubuntu6500 (generated)::(MD5Sum: c4d2a6b1a583e1869eef824a6a1dfcfa)
ALTER TABLE `ddjj_exhibidor_registry` ADD CONSTRAINT `FK55C728CFAD5246F7` FOREIGN KEY (`distribuidor_id`) REFERENCES `empresa`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', 'c4d2a6b1a583e1869eef824a6a1dfcfa', '1310831886643-29', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-30::ubuntu6500 (generated)::(MD5Sum: fa9b2de495ef3e194647e7a8f55a85)
ALTER TABLE `ddjj_exhibidor_registry` ADD CONSTRAINT `FK55C728CFBBF63F5D` FOREIGN KEY (`exhibidor_id`) REFERENCES `empresa`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', 'fa9b2de495ef3e194647e7a8f55a85', '1310831886643-30', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-31::ubuntu6500 (generated)::(MD5Sum: f18a51e63dff60d8c955bf9bd2b29d19)
ALTER TABLE `ddjj_exhibidor_registry` ADD CONSTRAINT `FK55C728CF863B6197` FOREIGN KEY (`pelicula_id`) REFERENCES `pelicula`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', 'f18a51e63dff60d8c955bf9bd2b29d19', '1310831886643-31', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-32::ubuntu6500 (generated)::(MD5Sum: dd659c2a179a741ec6ea39f3cceb4fb3)
ALTER TABLE `ddjj_exhibidor_registry` ADD CONSTRAINT `FK55C728CF151DCFD7` FOREIGN KEY (`sala_id`) REFERENCES `sala`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', 'dd659c2a179a741ec6ea39f3cceb4fb3', '1310831886643-32', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-33::ubuntu6500 (generated)::(MD5Sum: 7e31555ecff471e3fecf54b4ea3dd28)
ALTER TABLE `ddjj_video` ADD CONSTRAINT `FKEAC9213C4780BE74` FOREIGN KEY (`video_club_id`) REFERENCES `empresa`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '7e31555ecff471e3fecf54b4ea3dd28', '1310831886643-33', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-34::ubuntu6500 (generated)::(MD5Sum: da734938bb9b1993ff2dcee75e76a8f)
ALTER TABLE `ddjj_video_pelicula` ADD CONSTRAINT `FKF522823C2ABE2C61` FOREIGN KEY (`ddjj_video_peliculas_id`) REFERENCES `ddjj_video`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', 'da734938bb9b1993ff2dcee75e76a8f', '1310831886643-34', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-35::ubuntu6500 (generated)::(MD5Sum: 56b4a55e13ca10ecc7173c94ac7c1ed3)
ALTER TABLE `ddjj_video_pelicula` ADD CONSTRAINT `FKF522823C863B6197` FOREIGN KEY (`pelicula_id`) REFERENCES `pelicula`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '56b4a55e13ca10ecc7173c94ac7c1ed3', '1310831886643-35', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-36::ubuntu6500 (generated)::(MD5Sum: d676e963ef5fda5f1b44450e42b8b7b)
ALTER TABLE `empresa` ADD CONSTRAINT `FK9F354089B058DBF6` FOREIGN KEY (`persona_fisica_id`) REFERENCES `persona_fisica`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', 'd676e963ef5fda5f1b44450e42b8b7b', '1310831886643-36', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-37::ubuntu6500 (generated)::(MD5Sum: 8ecfb4aa5512a62f9ba74aadf5d5637)
ALTER TABLE `empresa` ADD CONSTRAINT `FK9F3540898BAE5636` FOREIGN KEY (`persona_juridica_id`) REFERENCES `persona_juridica`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '8ecfb4aa5512a62f9ba74aadf5d5637', '1310831886643-37', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-38::ubuntu6500 (generated)::(MD5Sum: f4526c637d1e494219749be26f2e6e1f)
ALTER TABLE `local` ADD CONSTRAINT `FK625DF6BDF616C53` FOREIGN KEY (`video_id`) REFERENCES `empresa`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', 'f4526c637d1e494219749be26f2e6e1f', '1310831886643-38', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-39::ubuntu6500 (generated)::(MD5Sum: 2b468bbba46e7f9151cf4ba4a3b710)
ALTER TABLE `localidad` ADD CONSTRAINT `FKB83370691ED763BD` FOREIGN KEY (`provincia_id`) REFERENCES `provincia`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '2b468bbba46e7f9151cf4ba4a3b710', '1310831886643-39', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-40::ubuntu6500 (generated)::(MD5Sum: a4491a84b67efc3d6216e464833b63)
ALTER TABLE `pago` ADD CONSTRAINT `FK346299BBF63F5D` FOREIGN KEY (`exhibidor_id`) REFERENCES `empresa`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', 'a4491a84b67efc3d6216e464833b63', '1310831886643-40', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-41::ubuntu6500 (generated)::(MD5Sum: db16ed4b7432cb95f91e61499287)
ALTER TABLE `pago` ADD CONSTRAINT `FK3462994780BE74` FOREIGN KEY (`video_club_id`) REFERENCES `empresa`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', 'db16ed4b7432cb95f91e61499287', '1310831886643-41', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-42::ubuntu6500 (generated)::(MD5Sum: 8854bf85da563428f055331d7f9f826a)
ALTER TABLE `pelicula` ADD CONSTRAINT `FKF9ACE99AD5246F7` FOREIGN KEY (`distribuidor_id`) REFERENCES `empresa`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '8854bf85da563428f055331d7f9f826a', '1310831886643-42', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-43::ubuntu6500 (generated)::(MD5Sum: 9cd85d8e545f9f953a1ca761aa6c3a4)
ALTER TABLE `pelicula` ADD CONSTRAINT `FKF9ACE9949FCED9D` FOREIGN KEY (`productor_id`) REFERENCES `empresa`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '9cd85d8e545f9f953a1ca761aa6c3a4', '1310831886643-43', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-44::ubuntu6500 (generated)::(MD5Sum: 9abd18b5639975e2e4f0cae47fa813)
ALTER TABLE `persona_fisica` ADD CONSTRAINT `FK8D9F446AAD905A3D` FOREIGN KEY (`localidad_id`) REFERENCES `localidad`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '9abd18b5639975e2e4f0cae47fa813', '1310831886643-44', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-45::ubuntu6500 (generated)::(MD5Sum: 2377b7e952884a34aa8d11d0ecf25a)
ALTER TABLE `persona_fisica` ADD CONSTRAINT `FK8D9F446A1ED763BD` FOREIGN KEY (`provincia_id`) REFERENCES `provincia`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '2377b7e952884a34aa8d11d0ecf25a', '1310831886643-45', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-46::ubuntu6500 (generated)::(MD5Sum: ad9b7f9cfbb6f3616426553d949dace6)
ALTER TABLE `persona_juridica` ADD CONSTRAINT `FKBB7B1298AD905A3D` FOREIGN KEY (`localidad_id`) REFERENCES `localidad`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', 'ad9b7f9cfbb6f3616426553d949dace6', '1310831886643-46', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-47::ubuntu6500 (generated)::(MD5Sum: 941683077a3a2a3206a44e1d657e50)
ALTER TABLE `persona_juridica` ADD CONSTRAINT `FKBB7B12981ED763BD` FOREIGN KEY (`provincia_id`) REFERENCES `provincia`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '941683077a3a2a3206a44e1d657e50', '1310831886643-47', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-48::ubuntu6500 (generated)::(MD5Sum: 9028edd61e4c9373961911b5d724fffc)
ALTER TABLE `pfisicapjuridica` ADD CONSTRAINT `FK691836CEB058DBF6` FOREIGN KEY (`persona_fisica_id`) REFERENCES `persona_fisica`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '9028edd61e4c9373961911b5d724fffc', '1310831886643-48', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-49::ubuntu6500 (generated)::(MD5Sum: a77675ad6ee43394d78334b19a2430bd)
ALTER TABLE `pfisicapjuridica` ADD CONSTRAINT `FK691836CE8BAE5636` FOREIGN KEY (`persona_juridica_id`) REFERENCES `persona_juridica`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', 'a77675ad6ee43394d78334b19a2430bd', '1310831886643-49', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-50::ubuntu6500 (generated)::(MD5Sum: 3134141e8ae644a1a7588ebff3228fe)
ALTER TABLE `sala` ADD CONSTRAINT `FK35C0437A487D17` FOREIGN KEY (`complejo_id`) REFERENCES `complejo`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '3134141e8ae644a1a7588ebff3228fe', '1310831886643-50', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-51::ubuntu6500 (generated)::(MD5Sum: d7a275a04b49bafadf9db2682939a24)
ALTER TABLE `sala` ADD CONSTRAINT `FK35C043BBF63F5D` FOREIGN KEY (`exhibidor_id`) REFERENCES `empresa`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', 'd7a275a04b49bafadf9db2682939a24', '1310831886643-51', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-52::ubuntu6500 (generated)::(MD5Sum: de67d96f46d25ce8511bbbbae9545a4)
ALTER TABLE `sala` ADD CONSTRAINT `FK35C043AD905A3D` FOREIGN KEY (`localidad_id`) REFERENCES `localidad`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', 'de67d96f46d25ce8511bbbbae9545a4', '1310831886643-52', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-53::ubuntu6500 (generated)::(MD5Sum: 22e59fdd6aaa635d88894f66329dbbf)
ALTER TABLE `sala` ADD CONSTRAINT `FK35C0431ED763BD` FOREIGN KEY (`provincia_id`) REFERENCES `provincia`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '22e59fdd6aaa635d88894f66329dbbf', '1310831886643-53', 'changelog.xml');

-- Changeset changelog.xml::1310831886643-54::ubuntu6500 (generated)::(MD5Sum: 5090ec83ef80ef758bbf794727486e8)
ALTER TABLE `sala_dias_exhibicion` ADD CONSTRAINT `FK7571D54C151DCFD7` FOREIGN KEY (`sala_id`) REFERENCES `sala`(`id`);

INSERT INTO `DATABASECHANGELOG` (`DATEEXECUTED`, `AUTHOR`, `LIQUIBASE`, `DESCRIPTION`, `COMMENTS`, `MD5SUM`, `ID`, `FILENAME`) VALUES (NOW(), 'ubuntu6500 (generated)', '1.9.3', 'Add Foreign Key Constraint', '', '5090ec83ef80ef758bbf794727486e8', '1310831886643-54', 'changelog.xml');

-- Release Database Lock
UPDATE `DATABASECHANGELOGLOCK` SET `LOCKEDBY` = NULL, `LOCKGRANTED` = NULL, `LOCKED` = 0 WHERE  ID = 1;

