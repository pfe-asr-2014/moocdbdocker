<?php

/*
 * Execute queries on the PostgreSQL server (POSTed SQL query and connection params
 *
 * FIXME Copyright (C) ... FIXME
 */
print '<html> <head> <title>R&eacute;sultat de l&#39;ex&eacute;cution</title> ';
print '   <link rel="stylesheet" type="text/css" href="contenu.css" />';
print '     </head><body>';
$server='tspmoocdbpostgres_1';

// The database to query is selected in the interface
$database=strtolower($_POST['database']);

// Change this to fit your setup
$user='pg_reader';
$pass= 'tpinfint';
print '<h2>R&eacute;sultat de l&#39;ex&eacute;cution</h2>';
$connection_string='host='.$server.' dbname='.$database.' user='.$user.' password='.$pass;
//print "<p><b>".$connection_string."</b></p>";
//print_r($connection_string);

$dbconn = pg_connect($connection_string);
if($dbconn == null) { 
     print '<p id="shortResult"></p>';
	  print '<p id="fullResult"></p>';
     die('Could not connect: ' . pg_last_error());
}

//print_r($_POST);
// Performing SQL query

// fetch the POSTed SQL query
$query = $_POST['submitedquery'];
$query=stripslashes($query);

/* // fix common error : missing semi-colon */
/* if ($query[strlen($query)-1] != ";") */
/* { $query=$query.";"; } */

// process multiple queries, one at a time
$sqlcode=explode(";", $query);
foreach ($sqlcode as $reqsql1) 
  {
    $reqsql1=ltrim($reqsql1);
    print "<p><b>$reqsql1</b></p>";
    
    $result = pg_query($reqsql1) ;
    if($result == null) { 
         print '<p id="shortResult"></p>';
		   print '<p id="fullResult"></p>';
      	die('Query failed: ' . pg_last_error());
      }

    print '<p id="shortResult">Nombre de tuples = '.pg_num_rows($result) .'</p>';
    print '<p id="fullResult">';
    
    // Printing results in HTML
    echo "<table border=1>\n";

    // display field names
    echo '<tr>';
    $i = 0; 
    while ($i < pg_num_fields($result)) 
      { 
        $fieldName = pg_field_name($result, $i); 
        echo '<td>' . $fieldName . '</td>'; 
        $i = $i + 1; 
      } 
    echo '</tr>';

    while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
      echo "\t<tr>\n";
      foreach ($line as $col_value) {
        echo "\t\t<td>$col_value</td>\n";
      }
      echo "\t</tr>\n";
    }
    echo "</table>\n</p>";

    // Free resultset
    pg_free_result($result);
  }
print '     </body></html>';
// Closing connection
pg_close($dbconn);
?>

