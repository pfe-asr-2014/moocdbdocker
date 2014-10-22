drop table if exists recoltes;

drop table if exists vins;

drop table if exists producteurs;

CREATE TABLE VINS

(num integer PRIMARY KEY,

cru char (40) NOT NULL,

annee integer CONSTRAINT Cannee

CHECK (annee between 1970 and 2020),

degre numeric(4,2) CONSTRAINT Cdegre

CHECK (degre between 9.0 and 15.0)

);

 

CREATE TABLE PRODUCTEURS

(num integer ,

nom char(40),

prenom char(40),

region char(40),

PRIMARY KEY (num) );

 

ALTER TABLE PRODUCTEURS add CONSTRAINT Cregion

check (region in ('Bourgogne', 'Beaujolais', 'Alsace', 'Jura', 'Corse','Rhone','Jura','Pyrenees','Provence','Languedoc','Sud Ouest','Savoie'));

 

ALTER TABLE PRODUCTEURS add CONSTRAINT CNom CHECK (nom IS NOT NULL);

 

CREATE TABLE RECOLTES

(nprod integer,

nvin integer,

quantite integer

);

 

ALTER TABLE RECOLTES add primary key (nprod, nvin);

 

ALTER TABLE RECOLTES add constraint refVIN foreign key (nvin)

references VINS(num) on delete cascade;

 

ALTER TABLE RECOLTES add constraint refREP foreign key (nprod)

references PRODUCTEURS(num) on delete cascade;

 

--
-- Contenu de la table `producteurs`
--

INSERT INTO producteurs (num, nom, prenom, region) VALUES
(1, 'Bohn', 'Rene', 'Alsace'),
(2, 'Boxler', 'Albert', 'Alsace'),
(3, 'Six', 'Paul', 'Alsace'),
(4, 'Stentz', 'Fernand', 'Alsace'),
(5, 'Joudeat', 'Lucien', 'Bourgogne'),
(6, 'Marmagne', 'Bernard', 'Bourgogne'),
(7, 'Lasnier', 'Pierre', 'Bourgogne'),
(8, 'Lioger d Harduy', 'Gabriel', 'Bourgogne'),
(9, 'Moniot', 'Gilbert', 'Bourgogne'),
(10, 'Fournier', 'Jean Claude', 'Bourgogne'),
(11, 'Clerget', 'Anne', 'Bourgogne'),
(12, 'Tortochot', 'Gabriel', 'Bourgogne'),
(13, 'Grivot', 'Jean', 'Bourgogne'),
(14, 'Jayer', 'Henri', 'Bourgogne'),
(15, 'Drouhin', 'Joseph', 'Bourgogne'),
(16, 'Barbin', 'Bernard', 'Bourgogne'),
(17, 'Faiveley', 'Guy', 'Bourgogne'),
(18, 'Tramier', 'Jean', 'Bourgogne'),
(19, 'Dupaquier', 'Roger', 'Bourgogne'),
(20, 'Lamy', 'Jean', 'Bourgogne'),
(21, 'Cornu', 'Edmond', 'Bourgogne'),
(22, 'Dubreuil Fontaine', 'Pierre', 'Bourgogne'),
(23, 'Laleure', '', 'Bourgogne'),
(24, 'Guillemot', 'Pierre', 'Bourgogne'),
(25, 'Valentin Bouchotte', 'Roger', 'Bourgogne'),
(26, 'Violot', 'Gilbert', 'Bourgogne'),
(27, 'Glantenay', 'Louis', 'Bourgogne'),
(28, 'Monnier', 'Rene', 'Bourgogne'),
(29, 'De Suremain', 'Robert', 'Bourgogne'),
(30, 'Desbois', 'Maurice', 'Bourgogne'),
(31, 'Prudhon', 'Henri', 'Bourgogne'),
(32, 'Mestre', 'Philippe', 'Bourgogne'),
(33, 'Prieur', 'Guy', 'Bourgogne'),
(34, 'Monnier', 'Rene', 'Bourgogne'),
(35, 'Roulot', 'Guy', 'Bourgogne'),
(36, 'Sauzet', 'Etienne', 'Bourgogne'),
(37, 'Delagrange Bachelet', '', 'Bourgogne'),
(38, 'De Launay', 'Paul', 'Bourgogne'),
(39, 'De Suremin', 'Hugues', 'Bourgogne'),
(40, 'Genelot', 'Maurice', 'Bourgogne'),
(41, 'Juillot', 'Michel', 'Bourgogne'),
(42, 'Juillot', 'Maurice', 'Bourgogne'),
(43, 'Menand', 'Jean Claude', 'Bourgogne'),
(44, 'Feyveley', '', 'Bourgogne'),
(45, 'Jeannin', 'Andre', 'Bourgogne'),
(46, 'Monassier', 'Armand', 'Bourgogne'),
(47, 'Thenard', '', 'Bourgogne'),
(48, 'Flamand', '', 'Bourgogne'),
(49, 'Guillot', 'Pierre', 'Bourgogne'),
(50, 'Chagny', 'Georges', 'Bourgogne'),
(51, 'Simonet', 'Leon', 'Bourgogne'),
(52, 'Lapierre', 'Jean', 'Bourgogne'),
(53, 'Cooperative', '', 'Bourgogne'),
(54, 'Cooperative', '', 'Bourgogne'),
(55, 'Michon', 'Philippe', 'Bourgogne'),
(56, 'Coutelle', 'Jean', 'Beaujolais'),
(57, 'Desmules', 'Pierre', 'Beaujolais'),
(58, 'Joubert', 'Claude', 'Beaujolais'),
(59, 'La Thuilliere', 'Jean', 'Beaujolais'),
(60, 'Vernus', 'Georges', 'Beaujolais'),
(61, 'Champier', 'Charles', 'Beaujolais'),
(62, 'Champagnon', 'Louis', 'Beaujolais'),
(63, 'Cooperative', '', 'Beaujolais'),
(64, 'Marius Bel Air', 'Morin', 'Beaujolais'),
(65, 'Appert', 'Michel', 'Beaujolais'),
(66, 'Cooperative', '', 'Beaujolais'),
(67, 'Descombes', 'Jean Ernest', 'Beaujolais'),
(68, 'Savoye', 'Louis', 'Beaujolais'),
(69, 'Janin', 'Marcel', 'Beaujolais'),
(70, 'Trichard', 'Benoit', 'Beaujolais'),
(71, 'Chalandard', 'Daniel', 'Jura'),
(72, 'Reverchon', 'Joseph', 'Jura'),
(73, 'Bourguignon', 'Emile', 'Jura'),
(74, 'Grand', 'Rene', 'Jura'),
(75, 'Loye', 'Camille', 'Jura'),
(76, 'Maire', 'Henri', 'Jura'),
(77, 'Tissot', 'Andre', 'Jura'),
(78, 'Michlel', 'Pierre Emile', 'Jura'),
(79, 'Petit', 'Gerard', 'Jura'),
(80, 'Devaux', 'Jean Paul', 'Jura'),
(81, 'Peltier', 'Pierre', 'Jura'),
(82, 'Mollex', 'Georges', 'Savoie'),
(83, 'Goy', '', 'Jura'),
(84, 'Metral', 'Jean', 'Jura'),
(85, 'Champet', 'Emile', 'Rhone'),
(86, 'Dumazet', 'Marc', 'Rhone'),
(87, 'Neyret Gachet', '', 'Rhone'),
(88, 'Begot', 'Albert', 'Rhone'),
(89, 'Michelas', 'Robert', 'Rhone'),
(90, 'Roure', 'Raymond', 'Rhone'),
(91, 'Chave', 'Gerard', 'Rhone'),
(92, 'De Boissieu', '', 'Rhone'),
(93, 'Marsanne', 'Jean', 'Rhone'),
(94, 'Grippat', 'Jean Louis', 'Rhone'),
(95, 'Verset', 'Louis', 'Rhone'),
(96, 'Boisson', 'Jean Pierre', 'Rhone'),
(97, 'Quiot', 'Pierre', 'Rhone'),
(98, 'Berard', '', 'Rhone'),
(99, 'Cooperative', '', 'Rhone'),
(100, 'Bernard', 'Georges', 'Rhone'),
(101, 'Verdan', 'Antoine', 'Rhone'),
(102, 'Cooperative', '', 'Rhone'),
(103, 'Coulouvrat', 'Michel', 'Rhone'),
(104, 'Rabasse Chavarin', 'Abel', 'Rhone'),
(105, 'Roux', 'Charles', 'Rhone'),
(106, 'Alary', '', 'Rhone'),
(107, 'Meunier', 'Laurent', 'Rhone'),
(108, 'Archimbaud', 'Jean', 'Rhone'),
(109, 'Rey', 'Marcel', 'Rhone'),
(110, 'Cooperative', '', 'Rhone'),
(111, 'Zafiropulo', 'Costa', 'Provence'),
(112, 'Prebost', 'Gaston', 'Provence'),
(113, 'Gomez', 'Rene', 'Provence'),
(114, 'Brunet', 'Georges', 'Provence'),
(115, 'Bordonado', 'Raymond', 'Provence'),
(116, 'Imbert', 'Christian', 'Corse'),
(117, 'Cooperative', '', 'Languedoc'),
(118, 'Cooperative', '', 'Languedoc'),
(119, 'Cooperative', '', 'Pyrenees'),
(120, 'Campigna Janvier', '', 'Pyrenees'),
(121, 'Cooperative', '', 'Pyrenees'),
(122, 'Dupuy', 'Charles', 'Pyrenees'),
(123, 'Laurent', 'Pierre', 'Pyrenees'),
(124, 'Daurat Fort', 'Robert', 'Pyrenees'),
(125, 'Baldes', 'Jean', 'Sud Ouest'),
(126, 'Jouffreau', 'Jean', 'Sud Ouest'),
(127, 'Brumont', 'Alban', 'Sud Ouest'),
(129, 'Barrere', 'Alfred', 'Sud Ouest');





--
-- Contenu de la table `vins`
--

INSERT INTO vins (num, cru, degre, annee) VALUES
(1, 'Mercurey', 11.5, 2000),
(2, 'Julienas', 11.3, 1994),
(3, 'Savigny les Beaunes', 12.1, 1998),
(4, 'Mercurey', 10.9, 2000),
(5, 'Pommard', 11.7, 1996),
(6, 'Mercurey', 11.2, 2001),
(7, 'Grands Echezeaux', 11.7, 1998),
(8, 'Cotes de Beaune Villages', 12.3, 1995),
(9, 'Chapelle Chambertin', 11.9, 1993),
(10, 'Beaujolais Villages', 11.8, 1999),
(11, 'Sylvaner', 11.2, 2002),
(12, 'Gentil', 10.7, 1995),
(13, 'Cotes du Rhone', 12.3, 1988),
(14, 'Chateau Chalon', 10.9, 1998),
(15, 'Cote de Brouilly', 11.9, 1993),
(16, 'Meursault', 12.1, 2000),
(17, 'Meursault', 11.4, 1995),
(18, 'Chambolle Musigny', 12.3, 1988),
(19, 'Clos du roi', 11.2, 1992),
(20, 'Cote de Brouilly', 12.1, 2000),
(21, 'Cotes de Nuits', 12, 1998),
(22, 'Savigny les Beaunes', 12, 1994),
(23, 'Pommard', 12, 1992),
(24, 'Cotes de Beaune Villages', 12.1, 1991),
(25, 'Chapelle Chambertin', 10.5, 1988),
(26, 'Chateau Corton Grancey', 12, 2000),
(27, 'Puligny Montrachet', 11, 1994),
(28, 'Volnay', 11, 2000),
(29, 'Corton', 11.6, 1992),
(30, 'Bourgogne Passe Tout Grains', 12, 1999),
(31, 'Monthelie', 11.4, 1988),
(32, 'Pouilly Vinzelles', 12.3, 1988),
(33, 'Santenay', 12, 1992),
(34, 'Montagny', 11.2, 1998),
(35, 'Auxey Duresses', 11.3, 1994),
(36, 'Chorey les Beaunes', 11, 1995),
(37, 'Savigny les Beaunes', 10, 1998),
(38, 'Savigny les Beaunes', 11, 1997),
(39, 'Savigny les Beaunes', 12, 1993),
(40, 'Richebourg', 12, 1993),
(41, 'Clairette de Die', 12, 1996),
(42, 'Beaujolais Primeur', 12, 2003),
(43, 'Fleurie', 11.4, 2000),
(44, 'Moulin a vent', 11.2, 2003),
(45, 'Chiroubles', 10.9, 2003),
(46, 'Chiroubles', 11, 2003),
(47, 'Chiroubles', 11, 1998),
(48, 'Cote de Brouilly', 12, 1999),
(49, 'Morgon', 12, 2004),
(50, 'Chenas', 12, 2004),
(51, 'Chenas', 10, 1995),
(52, 'Brouilly', 11.5, 1995),
(53, 'Beaujolais Villages', 10.3, 1995),
(54, 'Beaujolais Villages', 10.5, 1996),
(55, 'Beaujolais Villages', 12.1, 1998),
(56, 'Saint Amour', 12.6, 1994),
(57, 'Crozes Hermitage', 12.1, 1994),
(58, 'Crozes Hermitage', 12.5, 1995),
(59, 'Crozes Hermitage', 12.3, 1992),
(60, 'Crozes Hermitage', 11, 2003),
(61, 'Crozes Hermitage', 12, 1999),
(62, 'Gigondas', 11, 1998),
(63, 'Coteaux du Tricastin', 10, 1998),
(64, 'Coteaux du Tricastin', 11, 1994),
(65, 'Rochegrande', 10.8, 1988),
(66, 'Tavel', 11, 1988),
(67, 'Gewurztraminer', 12.5, 1988),
(68, 'Riesling', 11.4, 1982),
(69, 'Tokay d Alsace', 11, 2002),
(70, 'Sylvaner', 11, 2002),
(71, 'Palette', 11, 2001),
(72, 'Cassis', 10, 1998),
(73, 'Bellet', 11, 1996),
(74, 'Arbois', 12, 2000),
(75, 'Arbois', 11, 1996),
(76, 'Chateau Chalon', 12, 1996),
(77, 'Etoile', 11, 1999),
(78, 'Etoile', 12, 2000),
(79, 'Seyssel', 11, 2000),
(80, 'Seyssel', 11, 2000),
(81, 'Cornas', 11, 2000),
(82, 'Cornas', 11, 2000),
(83, 'Saint Amour', 10, 2000),
(84, 'Rasteau', 10, 2000),
(85, 'Tavel', 11, 2000),
(86, 'Tavel', 11, 2000),
(87, 'Cotes de Provence', 12, 2000),
(88, 'Cotes de Provence', 10, 1996),
(89, 'Cotes de Provence', 11, 1989),
(90, 'Palette', 11, 1999),
(91, 'Cassis', 11, 1999),
(92, 'Coteaux de Pierevert', 10.3, 1997),
(93, 'Blanquette de Limoux', 10.9, 1998),
(94, 'Cotes du Roussillon', 11.5, 1998),
(95, 'Cotes du Roussillon', 12, 1998),
(96, 'Saint Chinian', 11, 1996),
(97, 'Saint Chinian', 11, 1996),
(98, 'Corbieres', 10, 1998),
(99, 'Vin de Savoie Ayze', 12, 1996),
(100, 'Seyssel', 11, 1994),
(101, 'Saint Veran', 12.5, 1993);

--
-- Contenu de la table `recoltes`
--

INSERT INTO recoltes (nvin, nprod, quantite) VALUES
(1, 1, 300),
(1, 73, 1),
(2, 5, 100),
(3, 1, 400),
(4, 10, 35),
(5, 30, 46),
(6, 42, 300),
(7, 98, 68),
(8, 90, 123),
(9, 8, 10),
(10, 98, 100),
(11, 5, 200),
(12, 7, 31),
(12, 43, 200),
(12, 89, 310),
(13, 13, 13),
(14, 86, 180),
(15, 80, 290),
(16, 38, 100),
(17, 95, 50),
(18, 40, 120),
(19, 7, 986),
(20, 50, 100),
(21, 5, 150),
(22, 86, 50),
(23, 86, 15),
(24, 36, 859),
(25, 95, 40),
(26, 43, 70),
(27, 99, 60),
(28, 50, 100),
(29, 50, 50),
(30, 22, 350),
(31, 50, 320),
(32, 72, 890),
(32, 90, 500),
(33, 60, 70),
(34, 4, 500),
(35, 10, 900),
(35, 23, 350),
(36, 93, 50),
(37, 54, 830),
(38, 52, 125),
(39, 52, 80),
(40, 65, 90),
(41, 76, 25),
(42, 82, 80),
(43, 13, 500),
(43, 72, 900),
(43, 85, 983),
(44, 93, 40),
(45, 2, 90),
(45, 67, 912),
(45, 71, 98),
(45, 78, 540),
(45, 86, 450),
(46, 64, 760),
(47, 52, 75),
(48, 93, 70),
(49, 2, 150),
(50, 2, 100),
(51, 15, 36),
(52, 40, 500),
(53, 40, 800),
(54, 1, 500),
(54, 2, 900),
(54, 14, 500),
(54, 63, 210),
(55, 14, 450),
(56, 24, 790),
(57, 40, 940),
(58, 45, 70),
(59, 45, 160),
(60, 50, 300),
(60, 60, 60),
(61, 90, 120),
(62, 60, 900),
(63, 65, 136),
(64, 72, 870),
(64, 85, 980),
(65, 12, 10),
(65, 25, 560),
(66, 65, 124),
(67, 5, 125),
(67, 10, 890),
(67, 82, 760),
(68, 12, 60),
(69, 9, 96),
(69, 12, 320),
(69, 69, 690),
(70, 38, 120),
(71, 38, 132),
(72, 52, 34),
(73, 38, 45),
(74, 70, 650),
(74, 72, 850),
(74, 84, 675),
(75, 38, 69),
(76, 46, 100),
(76, 85, 900),
(77, 85, 100),
(78, 4, 300),
(78, 27, 360),
(78, 30, 900),
(78, 68, 980),
(78, 80, 970),
(79, 74, 100),
(79, 79, 79),
(79, 81, 800),
(80, 90, 79),
(81, 90, 24),
(82, 43, 100),
(82, 79, 546),
(82, 80, 800),
(83, 95, 423),
(84, 95, 146),
(85, 55, 46),
(86, 93, 500),
(87, 38, 630),
(87, 45, 680),
(87, 72, 900),
(88, 55, 129),
(89, 15, 150),
(89, 42, 980),
(89, 55, 723),
(89, 65, 980),
(89, 89, 100),
(90, 56, 900),
(90, 95, 400),
(91, 79, 24),
(92, 11, 900),
(93, 79, 110),
(94, 11, 500),
(94, 27, 180),
(95, 95, 900),
(96, 59, 370),
(97, 70, 1000),
(98, 24, 986),
(98, 35, 400),
(98, 75, 150),
(98, 76, 890),
(98, 88, 340),
(99, 5, 100),
(99, 99, 199),
(100, 25, 100);




	
