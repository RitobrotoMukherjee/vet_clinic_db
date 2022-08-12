/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
(1, 'Agumon', '2020-02-03', 0, TRUE, 10.23),
(2, 'Gabumon', '2018-11-15', 2, TRUE, 8),
(3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04),
(4, 'Devimon', '2017-05-12', 5, TRUE, 11);

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES
(5, 'Charmander', '2020-02-08', -11, FALSE, 0),
(6, 'Plantmon', '2021-11-15', -5.7, TRUE, 2),
(7, 'Squirtle', '1993-04-02', -12.13, FALSE, 3),
(8, 'Angemon', '2005-06-12', -45, TRUE, 1),
(9, 'Boarmon', '2005-06-07', 20.4, TRUE, 7),
(10, 'Blossom', '1998-10-13', 17, TRUE, 3),
(11, 'Ditto', '2022-05-14', 22, TRUE, 4);

/* Owner table data */

INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

/* Species table data */
INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

/* Update the species_id in animals */

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

/* Update the owner_id in animals */

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN( 'Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN( 'Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN( 'Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN( 'Angemon', 'Boarmon');

/* Vets data */
INSERT INTO vets (name, age, date_of_graduation)
VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

insert into specializations (vet_id, species_id) values
(
    (select id from vets where name='William Tatcher'),
    (select id from species where name='Pokemon')
),
(
    (select id from vets where name='Stephanie Mendez'),
    (select id from species where name='Pokemon')
),
(
    (select id from vets where name='Stephanie Mendez'),
    (select id from species where name='Digimon')
),
(
    (select id from vets where name='Jack Harkness'),
    (select id from species where name='Digimon')
);

insert into visits (animal_id, vet_id, date_of_visit) values
(
    (select id from animals where name='Agumon'),
    (select id from vets where name='William Tatcher'),
    TO_DATE('May 24, 2020', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Agumon'),
    (select id from vets where name='Stephanie Mendez'),
    TO_DATE('Jul 22, 2020', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Gabumon'),
    (select id from vets where name='Jack Harkness'),
    TO_DATE('Feb 2, 2021', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Pikachu'),
    (select id from vets where name='Maisy Smith'),
    TO_DATE('Jan 5, 2020', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Pikachu'),
    (select id from vets where name='Maisy Smith'),
    TO_DATE('Mar 8, 2020', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Pikachu'),
    (select id from vets where name='Maisy Smith'),
    TO_DATE('May 14, 2020', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Devimon'),
    (select id from vets where name='Stephanie Mendez'),
    TO_DATE('May 4, 2021', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Charmander'),
    (select id from vets where name='Jack Harkness'),
    TO_DATE('Feb 24, 2021', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Plantmon'),
    (select id from vets where name='Maisy Smith'),
    TO_DATE('Dec 21, 2019', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Plantmon'),
    (select id from vets where name='William Tatcher'),
    TO_DATE('Aug 10, 2020', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Plantmon'),
    (select id from vets where name='Maisy Smith'),
    TO_DATE('Apr 7, 2021', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Squirtle'),
    (select id from vets where name='Stephanie Mendez'),
    TO_DATE('Sep 29, 2019', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Angemon'),
    (select id from vets where name='Jack Harkness'),
    TO_DATE('Oct 3, 2020', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Angemon'),
    (select id from vets where name='Jack Harkness'),
    TO_DATE('Nov 4, 2020', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Boarmon'),
    (select id from vets where name='Maisy Smith'),
    TO_DATE('Jan 24, 2019', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Boarmon'),
    (select id from vets where name='Maisy Smith'),
    TO_DATE('May 15, 2019', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Boarmon'),
    (select id from vets where name='Maisy Smith'),
    TO_DATE('Feb 27, 2020', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Boarmon'),
    (select id from vets where name='Maisy Smith'),
    TO_DATE('Aug 3, 2020', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Blossom'),
    (select id from vets where name='Stephanie Mendez'),
    TO_DATE('May 24, 2020', 'Mon DD, YYYY')
),
(
    (select id from animals where name='Blossom'),
    (select id from vets where name='William Tatcher'),
    TO_DATE('Jan 11, 2021', 'Mon DD, YYYY')
);