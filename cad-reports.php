<?php
?>
<?php include('./resources/layout/head.php'); ?>

<?php
$permCheck = haveGeneralPerm($UserArray['userid'], 64);

if($permCheck == false){
    echo '<meta http-equiv="refresh" content="0; url=index.php" />';
}
?>


<title>ANTARES - Rapport intervention</title>

<div class="container" style="margin-top: 25px;">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="card">
				<div class="card-header"><a href="./cad-history.php" target="_blank" style="position: absolute; right: 10px;">Historique appel(s)</a> Créer rapport intervention</div>
				<div class="card-body">
					<?php
						if(isset($_POST['submitCADReport'])) { 
                            $incident = $con->escape_string($_POST['incident']);
                            $cad = $con->escape_string($_POST['cad']);
                            $located = $con->escape_string($_POST['located']);
                            $otherUnits = $con->escape_string($_POST['otherUnits']);
                            $arrested = $con->escape_string($_POST['arrested']);
                            $person = $con->escape_string($_POST['person']);
                            $arrestedFor = $con->escape_string($_POST['arrestedFor']);
                            $foundItems = $con->escape_string($_POST['foundItems']);
                            $whatHappened = $con->escape_string($_POST['whatHappened']);
                            createCadReport($UserArray['userid'],$incident,$cad,$located,$otherUnits,$arrested,$person,$arrestedFor,$foundItems,$whatHappened);
                    ?>
                    <div class="alert alert-success"><b>Rapport intervention envoyé</b> Le rapport est maintenant enregistré !</div>
                    <?php
						}
					?>
					<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                        <div class="row">
    						<div class="form-group col-sm-12 col-md-6">
        						<label for="channel">Nom</label>
    	       					<input type="text" class="form-control" name="username" value="<?php echo $UserArray['first_name'] . ' ' . $UserArray['surname']; ?>" disabled>
                               <small id="emailHelp" class="form-text text-muted"><I>Votre nom (automatique)</I></small>
  				  	       	</div>
                            <div class="form-group col-sm-12 col-md-6">
                                <label for="channel">Nom d'utilisateur</label>
                                <input type="text" class="form-control" name="collar" value="<?php echo $UserArray['collar']; ?>" disabled>
                               <small id="emailHelp" class="form-text text-muted"><I>Votre nom d'utilisateur (automatique)</I></small>
                            </div>
                            <div class="form-group col-sm-12 col-md-6">
                                <label for="channel">De quel type d'incident s'agit-il ?</label>
                                <input type="text" class="form-control" name="incident">
                                <small id="emailHelp" class="form-text text-muted"><I>À quel type d'incident avez-vous assisté ?</I></small>
                            </div>
                            <div class="form-group col-sm-12 col-md-6">
                                <label for="channel">Quelle était le numéro d'intervention ?</label>
                                <input type="text" class="form-control" name="cad">
                                <small id="emailHelp" class="form-text text-muted"><I>49/28JUN2018</I></small>
                            </div>
                            <div class="form-group col-sm-12 col-md-6">
                                <label for="channel">Qui d'autre était sur l'incident ?</label>
                                <textarea class="form-control" name="otherUnits"></textarea>
                                <small id="emailHelp" class="form-text text-muted"><I>Samu, PN, PM, GN, DIR etc...</I></small>
                            </div>
                            <div class="form-group col-sm-12 col-md-6">
                                <label for="channel">Ou était localisé l'intervention ?</label>
                                <textarea class="form-control" name="located"></textarea>
                                <small id="emailHelp" class="form-text text-muted"><I>Sur la voie publique, à domicile etc...</I></small>
                            </div>
                            <div class="form-group col-sm-12 col-md-6">
                                <label for="channel">Avez-vous transporté la victime ?</label>
                                <select class="form-control" name="arrested">
                                    <option value="Oui">Oui</option>
                                    <option value="Non">Non</option>
                                </select>
                                <small id="emailHelp" class="form-text text-muted"><I></I></small>
                            </div>
                            <div class="form-group col-sm-12 col-md-6">
                                <label for="channel">Information victime</label>
                                <input type="text" class="form-control" name="person" placeholder="Nom, prénom JJ/MM/AAAA">
                                <small id="emailHelp" class="form-text text-muted"><I>Charlie SCHMIT, 06/12/1945</I></small>
                            </div>
                            <div class="form-group col-sm-12 col-md-6">
                                <label for="channel">Type de transport</label>
                                <input type="text" class="form-control" name="arrestedFor">
                                <small id="emailHelp" class="form-text text-muted"><I>Urgence relative, urgence absolu, malaise simple, etc...</I></small>
                            </div>
                            <div class="form-group col-sm-12 col-md-6">
                                <label for="channel">Personne a contacter ?</label>
                                <input type="text" class="form-control" name="foundItems">
                                <small id="emailHelp" class="form-text text-muted"><I>Ami(e)s, Famille, etc...</I></small>
                            </div>
                            <div class="form-group col-sm-12 col-md-12">
                                <label for="channel">Soins réalisés durant l'intervention</label>
                                <textarea class="form-control" name="whatHappened"></textarea>
                                <small id="emailHelp" class="form-text text-muted"><I>Les gestes effectué(s)..</I></small>
                            </div>
                        </div>
  						<div class="form-group" style="width: 100%;">
							<input type="submit" name='submitCADReport' class="btn btn-success btn-block" value="Envoyer rapport intervention">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
