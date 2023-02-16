<?php
?>
<?php include('./resources/layout/head.php'); ?>

<?php
$permCheck = haveGeneralPerm($UserArray['userid'], 2);

if($permCheck == false OR !isset($_GET['cid'])){
    echo '<meta http-equiv="refresh" content="0; url=index.php" />';
}
?>

<?php
	 $civInfo = getCivInfo($_GET['cid']);
?>


<title>ANTARES - Victime <?php echo $civInfo['name']; ?></title>

<div class="container-fluid" style="margin-top: 25px;">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="card custom-card">
                <div class="card-header">
                    Civilian Lookup:  <?php echo $civInfo['name']; ?>
                </div>
                <div class="card-body">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="channel">Nom victime</label>
                                <input type="text" class="form-control" name="name" value="<?php echo $civInfo['name']; ?>" disabled>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="channel">Date de naissance</label>
                                <input type="text" class="form-control" name="vrm" value="<?php echo $civInfo['dob']; ?>" disabled>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="channel">Addresse</label>
                                <input type="text" class="form-control" name="vrm" value="<?php echo $civInfo['address']; ?>" disabled>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="channel">Dossier médical</label>
                                <input type="text" class="form-control" name="insurer" value="<?php echo $civInfo['markers']; ?>" disabled>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="channel">Véhicule</label>
                                <div class="card custom-card">
                                    <div class="card-body">
                                        <?php
                                        $vehicles = getVehiclesForCiv($civInfo['civid']);

                                        foreach($vehicles as $vehicle){
                                        ?>
                                        <a href="./vrm-check.php?vid=<?php echo $vehicle['vehicleid']; ?>"><?php echo $vehicle['vehicle']; ?> - <?php echo $vehicle['vrm']; ?></a><br>
                                        <?php
                                        }
                                        ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>