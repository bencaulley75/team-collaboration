<?php
if(isset($_POST['submit'])) {
  $selectedColor = $_POST['colors'];
  $red = 'not selected';
  $green = 'not selected';
  $blue = 'not selected';

  switch ($selectedColor) {
    case "red":
      $red = 'selected';
      break;
    case "green":
      $green = 'selected';
      break;
    case "blue":
      $blue = 'selected';
      break;
  }

  echo "Selected color: " . $selectedColor . "<br>";
  echo "Red: " . $red . "<br>";
  echo "Green: " . $green . "<br>";
  echo "Blue: " . $blue . "<br>";
}
?>



