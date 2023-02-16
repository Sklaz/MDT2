<?php

?>
<?php include('./resources/layout/head.php'); ?>

<?php
$permCheck = haveGeneralPerm($UserArray['userid'], 1);

if($permCheck == false){
    echo '<meta http-equiv="refresh" content="0; url=login.php" />';
}
?>

<title>ANTARES - Accueil</title>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
  </head>
  <body>
    
    <div class = "about-wrapper">
      <div class = "about-left">
        <div class = "about-left-content">
          <div>
            <div class = "shadow">
              <div class = "about-img">
                <img src = "https://cdn.discordapp.com/attachments/918604024020889680/1075895229225386004/image.png" alt = "about image">
              </div>
            </div>

            <h2>Sklaz</h2>
            <h3>Developpeur</h3>
          </div>

          <ul class = "icons">
            <li><i class = "fab fa-facebook-f"></i></li>
            <li><i class = "fab fa-twitter"></i></li>
            <li><i class = "fab fa-linkedin"></i></li>
            <li><i class = "fab fa-instagram"></i></li>
          </ul>
        </div>
        
      </div>

      <div class = "about-right">
        <h1>ANTARES<span> !</span></h1>
        <h2>WEBSITE</h2>
        <div class = "about-btns">
          <button type = "button" class = "btn1 btn-pink">DISCORD</button>
          <button type = "button" class = "btn1 btn-white">GITHUB</button>
        </div>

        <div class = "about-para">
          <p>Bienvenue sur le site ANTARES, version Sapeur-Pompier.</p>
          <p>Se site est actuellement en construction !</p>
        </div>
        <div class="credit">Made with <span style="color:tomato">❤</span> by <a href="">Sklaz</a></div>
      </div>
    </div>
  </body>

</div>