<?php
?>
<?php include('./resources/layout/head.php'); ?>

<?php
$permCheck = haveGeneralPerm($UserArray['userid'], 64);
$permCheck2 = haveGeneralPerm($UserArray['userid'], 128);

if($permCheck == false && $permCheck2 == false){
    echo '<meta http-equiv="refresh" content="0; url=index.php" />';
}

$unitInfo = getUnitForUser($UserArray['collar']);

if($unitInfo == true){
    echo '<meta http-equiv="refresh" content="0; url=unit-control.php" />';
}
?>


<title>ANTARES - RADIO</title>

<div class="container" style="margin-top: 25px;">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-sm-12 col-md-12 col-lg-6">
            <div class="card">
                <div class="card-header">Allumer la radio</div>
                <div class="card-body">
                    <?php
                        if(isset($_POST['signOn'])) { 
                            $unit = $con->escape_string($_POST['unit']);
                            signOn($UserArray['collar'], $unit);
                            echo '<meta http-equiv="refresh" content="0; url=unit-control.php" />';
                        }
                    ?>
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                        <div class="form-group col-md-12">
                            <label for="channel">Le véhicule</label>
                            <input type="text" class="form-control" name="unit" placeholder="Entrer le nom du véhicule ..." required>
                        </div>
                        <div class="form-group" style="width: 100%;">
                            <input type="submit" name='signOn' class="btn btn-success btn-block" value="Allumer">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
