CREATE TABLE Marki_avtomobiley
(
  Kod_marki INT NOT NULL,
  Naimenovanie VARCHAR NOT NULL,
  Tech_harakteristiki VARCHAR NOT NULL,
  Opisanie VARCHAR NOT NULL,
  PRIMARY KEY (Kod_marki)
);

CREATE TABLE Prokat
(
  Data_vidachi DATE NOT NULL,
  Srok_prokata INT NOT NULL,
  Data_vozvrata DATE NOT NULL,
  Cena_prokata INT NOT NULL,
  Otmetka_ob_oplate VARCHAR NOT NULL,
  Kod_prokata INT NOT NULL,
  PRIMARY KEY (Kod_prokata)
);

CREATE TABLE Dop_yslygi
(
  Kod_yslygi INT NOT NULL,
  Naimenovanie VARCHAR NOT NULL,
  Opisanie VARCHAR NOT NULL,
  Cena INT NOT NULL,
  Kod_prokata INT NOT NULL,
  Kod_yslygi_3Kod_prokata INT NOT NULL,
  Kod_yslygi_2Kod_prokata INT NOT NULL,
  PRIMARY KEY (Kod_yslygi),
  FOREIGN KEY (Kod_prokata) REFERENCES Prokat(Kod_prokata),
  FOREIGN KEY (Kod_yslygi_3Kod_prokata) REFERENCES Prokat(Kod_prokata),
  FOREIGN KEY (Kod_yslygi_2Kod_prokata) REFERENCES Prokat(Kod_prokata)
);

CREATE TABLE Avtomobili
(
  Kod_avto INT NOT NULL,
  Registr_nomer INT NOT NULL,
  Nomer_kyzova INT NOT NULL,
  Nomer_dvigatelya INT NOT NULL,
  God_vipyska DATE NOT NULL,
  Probeg INT NOT NULL,
  Cena_avto INT NOT NULL,
  Cena_dlya_prokata INT NOT NULL,
  Data_poslednego_TO DATE NOT NULL,
  Spec_otmetki VARCHAR NOT NULL,
  Otmetka_o_vozraste VARCHAR NOT NULL,
  Kod_marki INT NOT NULL,
  Kod_prokata INT NOT NULL,
  PRIMARY KEY (Kod_avto),
  FOREIGN KEY (Kod_marki) REFERENCES Marki_avtomobiley(Kod_marki),
  FOREIGN KEY (Kod_prokata) REFERENCES Prokat(Kod_prokata)
);

CREATE TABLE Klienti
(
  Kod_klienta INT NOT NULL,
  FIO VARCHAR NOT NULL,
  Pol VARCHAR NOT NULL,
  Data_rojdenia DATE NOT NULL,
  Adres VARCHAR NOT NULL,
  Telefon INT NOT NULL,
  Pasportnie_dannie VARCHAR NOT NULL,
  Kod_prokata INT NOT NULL,
  PRIMARY KEY (Kod_klienta),
  FOREIGN KEY (Kod_prokata) REFERENCES Prokat(Kod_prokata)
);

CREATE TABLE Sotrudniki
(
  Kod_sotrudnika INT NOT NULL,
  FIO VARCHAR NOT NULL,
  Vozrast INT NOT NULL,
  Pol VARCHAR NOT NULL,
  Adres VARCHAR NOT NULL,
  Telefon INT NOT NULL,
  Pasportnie_dannie VARCHAR NOT NULL,
  Kod_prokata INT NOT NULL,
  Kod_avto INT NOT NULL,
  PRIMARY KEY (Kod_sotrudnika),
  FOREIGN KEY (Kod_prokata) REFERENCES Prokat(Kod_prokata),
  FOREIGN KEY (Kod_avto) REFERENCES Avtomobili(Kod_avto)
);

CREATE TABLE Doljnosti
(
  Kod_doljnosti INT NOT NULL,
  Naimenovanie_doljnosti VARCHAR NOT NULL,
  Oklad INT NOT NULL,
  Trebovaniya VARCHAR NOT NULL,
  Obyazanosti VARCHAR NOT NULL,
  Kod_sotrudnika INT NOT NULL,
  PRIMARY KEY (Kod_doljnosti),
  FOREIGN KEY (Kod_sotrudnika) REFERENCES Sotrudniki(Kod_sotrudnika)
);