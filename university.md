Modellizzare la struttura di una tabella per memorizzare tutti i dati riguardanti una università:

- sono presenti diversi dipartimenti, ciascuno con i propri corsi di laurea;
- ogni corso di laurea è formato da diversi corsi;
- ogni corso può essere tenuto da diversi insegnanti e prevede più appelli d'esame;
- ogni studente è iscritto ad un corso di laurea;
- per ogni appello d'esame a cui lo studente ha partecipato, è necessario memorizzare il voto ottenuto, anche se non sufficiente

# University

## dipartimenti

- id BIGINT AUTOINCREMENT PRIMARY KEY UNIQUE NOTNULL INDEX
- nome_dipartimento VARCHAR(80) NOTNULL INDEX
- desc TEXT NULL

## corsi_di_laurea

- id BIGINT AUTOINCREMENT PRIMARY KEY UNIQUE NOTNULL INDEX
- nome_corso VARCHAR(80) NOTNULL INDEX
- desc TEXT NULL

## corsi

- id BIGINT AUTOINCREMENT PRIMARY KEY UNIQUE NOTNULL INDEX
- nome VARCHAR(80) NOTNULL INDEX
- data_inizio DATE NOTNULL
- data_fine DATE NULL
- desc TEXT NULL

## insegnati

- id BIGINT AUTOINCREMENT PRIMARY KEY UNIQUE NOTNULL INDEX
- nome VARCHAR(15) NOTNULL
- cognome VARCHAR(15) NOTNULL INDEX
- email VARCHAR(30) NOTNULL

## esami

- id BIGINT AUTOINCREMENT PRIMARY KEY UNIQUE NOTNULL INDEX
- materia VARCHAR(40) NOTNULL INDEX
- data DATE NOTNULL
- ora_inizio TIME NULL
- ora_fine TIME NULL
- desc TEXT NULL

## studenti

- id BIGINT AUTOINCREMENT PRIMARY KEY UNIQUE NOTNULL INDEX
- nome VARCHAR(15) NOTNULL
- cognome VARCHAR(15) NOTNULL INDEX
- età TINYINT NOTNULL
- email VARCHAR(30) NOTNULL

## voti

- id BIGINT AUTOINCREMENT PRIMARY KEY UNIQUE NOTNULL INDEX
- valutazione TINYINT NOTNULL
