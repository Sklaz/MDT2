<?php

?>
<?php
session_start();
require_once './_assets/php/connection.php';
require_once './_assets/php/helper.php';

$session_id = session_id();
$loggedcheck = $con->query("SELECT id FROM mdt_sessions WHERE session_id = '{$session_id}'");

if($loggedcheck->num_rows > 0){
    header("location: index.php");
    exit;
}

$collar = $password = "";
$collar_err = $password_err = "";
 
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    if(empty(trim($_POST["collar"]))){
        $collar_err = 'Veuillez entrer le nom d\'utilisateur.';
    } else{
        $collar = trim($_POST["collar"]);
    }
    
    if(empty(trim($_POST['password']))){
        $password_err = 'Veuillez entrer un mot de passe.';
    } else{
        $password = trim($_POST['password']);
    }
    
    if(empty($collar_err) && empty($password_err)){
        $check = LogUserIn($collar, $password, $session_id);

        if($check == true){
            header("location: index.php");
            exit;
        }else{
            $password_err = 'Votre mot de passe est incorrect.';
            $collar_err = 'Votre nom d\'utilisateur ou mot de passe est incorect.';
        }
    }

}
?>
<html>
<head>
	<title> ANTARES -  </title>
	<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
	<link rel="stylesheet" type="text/css" href="_assets/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="_assets/css/custom.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="login-content-holder">
        <div class="login-form-holder">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-6">
                                <h4 style="text-align: center;">Connexion</h4>
	      						<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
		      					    <div class="form-group <?php echo (!empty($collar_err)) ? 'has-error' : ''; ?>">
                                        <b>Nom d'utilisateur:</b>
                				        <input type="text" name="collar"class="form-control" value="<?php echo $collar; ?>">
                				        <span class="help-block"><?php echo $collar_err; ?></span>
            					   </div>    
            					   <div class="form-group <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                                        <b>Mot de passe:</b>
                				        <input type="password" name="password" class="form-control">
                				        <span class="help-block"><?php echo $password_err; ?></span>
            				        </div>
            				        <div class="form-group">
                				        <input type="submit" class="btn btn-success btn-block" value="Se connecter">
           		 			        </div>
							    </form>
						    </div>
                            <br>
                            <div class="col-sm-12 col-md-12 col-lg-6">
                                <h4 style="text-align: center;">Information</h4>
                                <p>Ce portail communautaire est géré par PDRP Network™ et seul le personnel autorisé peut se connecter. <br><br> Veuillez noter que votre IP est <?php echo $_SERVER['REMOTE_ADDR']; ?> et toutes les tentatives de connexion sont enregistrées et surveillées de près.</p>
                                <p>Si vous avez besoin d'un compte, veuillez contacter un membre de l'équipe d'administration.</p>
                            </div>
                        </div>
					</div>
				</div>
                <br />
                <div id="copyright" class="text-center text-white">
					<small>OM Solutions©2018</small></br>
                    <small>PDRP Network™ <?php echo date("Y"); ?></small>
                </div>
			</center>
		</div>
	</div>
</body>