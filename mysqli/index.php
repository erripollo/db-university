<?php 

# 1. Definire le costanti per la connessione
define("DB_SERVERNAME", "localhost");
define("DB_USERNAME", "root"); 
define("DB_PASSWORD", "root"); 
define("DB_NAME", "university");
define('DB_PORT', '3306');


# 2. Stabiliamo connessione con il database
$connection = new mysqli(DB_SERVERNAME, DB_USERNAME, DB_PASSWORD, DB_NAME, DB_PORT);

/* echo '<pre>';
var_dump($connection);
echo '</pre>'; */

# 3. Verifichare la connessione
if ($connection && $connection->connect_error) {
    echo "Connection failed: " . $connection->connect_error;
    die();
}

# 4. Eseguiamo una query se la connesione é stata stabilita

//echo 'Connection Successful, Go!';

$sql = "SELECT * FROM departments";
$results = $connection->query($sql);

/* echo '<pre>';
var_dump($results);
echo '</pre>'; */


if ($results && $results->num_rows > 0) {
    
    /* echo '<pre>';
    var_dump($results->fetch_assoc());
    echo '</pre>'; */
    
    // Cicliare tra i risultati e mostraiamoli a schermo
    while ($project = $results->fetch_array()) {
  ?>
      <h1><?= $project['name']; ?></h1>
      <p><?= $project['address']; ?></p>
      <p><?= $project['phone'] ?></p>
      <p>
        <a href="#"><?= $project['email'] ?></a>
      </p>
      <p>
        <a href="#"><?= $project['website'] ?></a>
      </p>
  <?php
    }
} elseif ($results) {
    echo 'Nessun Risultato';
} else {
    echo 'Errore nella query';
}
  

?>