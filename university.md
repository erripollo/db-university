Modellizzare la struttura di una tabella per memorizzare tutti i dati riguardanti una università:

- sono presenti diversi dipartimenti, ciascuno con i propri corsi di laurea;
- ogni corso di laurea è formato da diversi corsi;
- ogni corso può essere tenuto da diversi insegnanti e prevede più appelli d'esame;
- ogni studente è iscritto ad un corso di laurea;
- per ogni appello d'esame a cui lo studente ha partecipato, è necessario memorizzare il voto ottenuto, anche se non sufficiente

# University

## dipartimenti

- id
- nome
- (!) corsi_di_laurea

## corsi_di_laurea

- id
- nome
- (!) corsi
- (!) studenti

## corsi

- id
- nome
- data_inizio
- data_fine
- (!) insegnanti
- (!) esami

## insegnati

- id
- nome
- cognome
- email

## esami

- id
- titolo
- data
- ora_inizio
- ora_fine
- (!) studenti
- (!) voti

## studenti

- id
- nome
- cognome
- età
- email
- (!) voti

## voti

- id
- valutazione
