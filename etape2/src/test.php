<?php 
$mysqli = new mysqli('data', 'monuser', 'password', 'mabase');
if ($mysqli->connect_errno) {
    printf("Connect failed: %s\n", $mysqli->connect_error);
    exit();
}

// Insert une nouvelle ligne
if ($mysqli->query("INSERT INTO matable (compteur) SELECT COUNT(*)+1 FROM matable") === TRUE) {
    echo "Count updated<br />";
}

// Récupérer le nombre de lignes
if ($result = $mysqli->query("SELECT * FROM matable")) {
    printf("Count : %d<br />", $result->num_rows);
    $result->close();
}

$mysqli->close();
?>
