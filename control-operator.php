<?php
?>
<?php include('./resources/layout/head.php'); ?>

<?php
$permCheck = haveGeneralPerm($UserArray['userid'], 2);

if($permCheck == false){
    echo '<meta http-equiv="refresh" content="0; url=index.php" />';
}
?>

<?php

	$calls = getActiveCalls('ASC');
	$availableUnits = getAvailableUnits();
?>

<title>ANTARES - Opérateur</title>

<div class="container-fluid" style="margin-top: 25px;">
	<div id="panicSection">
		<?php
		$num = $con->query("SELECT * FROM units WHERE status = 0")->num_rows;

			if($num > 0){

				$unit = mysqli_fetch_assoc($con->query("SELECT * FROM units WHERE status = 0"));
		?>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="alert alert-danger state0" style="text-align: center;">
					<b>Bouton panique activé par <?php echo $unit['unit']; ?> (<?php echo $unit['collar']; ?>)</b>
				</div>
			</div>
		</div>
		<?php
			}
		?>
	</div>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-7"><div id="refreshDiv">
			<div class="row">
				<?php
					foreach($calls as $call){
				?>
				<div class="col-md-6">
					<div class="card custom-card" style="margin-bottom: 10px;">
						<div class="card-header">
							<?php echo $call['callid'] . "/" . $call['dateline'] . " - " . $call['type']; ?>
						</div>
						<div class="card-body" style="padding-bottom: 0 !important;">
							<div class="row">
								<div class="col-md-6">
									<b>Heure de l'appel:</b><br><?php echo $call['created']; ?><br>
								</div>
								<div class="col-md-6">
									<b>État de l'appel:</b><br><i><?php if($call['status'] == 1){ echo "Reçu"; }elseif($call['status'] == 2){ echo "Non traité"; }elseif($call['status'] == 3){ echo "Traité"; } ?></i><br>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-8">
									<b>Adresse:</b><br><?php echo $call['location']; ?> <br>
								</div>
								<div class="col-md-4">
									<b>Interlocuteur:</b><br><?php if($call['caller'] == false){ echo "Anonymous"; }else{ echo "<a href=\"./pnc-check.php?cid=" . $call['caller']['civid'] . "\">" . $call['caller']['name'] . "</a>"; } ?><br>
								</div>
							</div>
							<Br>
							<div class="row">
								<div class="col-md-12">
									<b>Description:</b><br><?php echo $call['description']; ?><br>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-4">
									<b>Importance:</b><br><?php echo $call['police_grade']; ?><br>
								</div>
								<div class="col-md-4">
									<b>Priorité de l'appel:</b><br><?php echo $call['rmu_grade']; ?><br>
								</div>
								<div class="col-md-4">
									<b>Canal radio:</b><br><?php echo $call['channel']; ?><br>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-12 text-center">
									<b>Véhicule(s) engagé(s)</b>
								</div>
							</div>
						</div>
						<table class="table table-responsive-xl" id="availableUnits">
							<tbody>
								<?php
									foreach($call['units'] as $unit){
								?>
								<tr class="state<?php echo preg_replace("/[\s_]/", "-", $unit['status']); ?>">
									<td><b><?php echo $unit['unit'] . " - " . $unit['collar'] . " - State " . $unit['status']; ?></b></td>
								</tr>
								<?php
									}
								?>
							</tbody>
						</table>
					</div>
				</div>
				<?php
					}
				?>
			</div>
		</div></div>
		<div class="col-md-3">
			<div class="card custom-card">
				<div class="card-header">
					<a href="#" onclick="toggleDiv('editCAD')"><i class="fa fa-plus"></i></a> 
					Modifier l'appel
				</div>
				<div class="card-body" id="editCAD" style="display: none;">
					<?php
					if(isset($_POST['updateCall'])) { 
			  	  		updateCall($_POST['cad'],$_POST['police_grade'],$_POST['rmu_grade'],$_POST['channel']);
			  	  		updateCallStatus($_POST['cad'], 2);
					}
					?>
					<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
						<div class="form-group col-md-12">
    						<label for="channel">Selectionner appel</label>
    						<div id="test">
    							<select class="form-control" name="cad">
    								<?php
    								foreach($calls as $call){
    								?>
    								<option value="<?php echo $call['callid']; ?>"><?php echo $call['callid'] . "/" . $call['dateline'] . " - " . $call['type']; ?></option>
    								<?php
    								}
    								?>
    							</select>
    						</div>
  						</div>
  						<div class="form-group col-md-12">
    						<label for="channel">Canal radio</label>
    						<select class="form-control" name="channel">
    							<option value="Channel 1">Priority Channel 1</option>
    							<option value="Channel 2">Priority Channel 2</option>
    							<option value="Channel 3">Priority Channel 3</option>
    							<option value="Channel 4">Priority Channel 4</option>
    							<option value="Channel 5">Priority Channel 5</option>
    							<option value="Channel 6">Priority Channel 6</option>
    						</select>
  						</div>
  						<div class="form-group col-md-12">
    						<label for="grade">Importance</label>
    						<select class="form-control" name="police_grade">
    							<option value="N/A">N/A</option>
    							<option value="High">Haute</option>
    							<option value="Low">Basse</option>
    						</select>
  						</div>
  						<div class="form-group col-md-12">
    						<label for="grade">Priorité de l'appel</label>
    						<select class="form-control" name="rmu_grade">
    							<option value="N/A">N/A</option>
    							<option value="Priority 1">Priorité 1</option>
    							<option value="Priority 2">Priorité 2</option>
    							<option value="Priority 3">Priorité 3</option>
    							<option value="Priority 4">Priorité 4</option>
								<option value="Priority 5">Priorité 5</option>
								<option value="Priority 6">Priorité 6</option>
								<option value="Priority 7">Priorité 7</option>
								<option value="Priority 8">Priorité 8</option>
								<option value="Priority 9">Priorité 9</option>
    						</select>
  						</div>
  						<div class="form-group col-md-12">
  							<input type="submit" name='updateCall' class="btn btn-success btn-block" value="Enregistrer">
  						</div>
  					</form>
				</div>
			</div>
			<br>
			<div class="card custom-card">
				<div class="card-header">
					<a href="#" onclick="toggleDiv('refreshMessages')"><i class="fa fa-plus"></i></a> 
					<a data-toggle="modal" data-target="#sendMessage"><i class="fa fa-comment-alt"></i></a> 
					Messages
				</div>
				<table class="table table-responsive-xl" id="refreshMessages">
					<tbody>
						<?php
						$messages = getRecentMessages("DISPATCH");

						foreach($messages AS $message){
						?>
						<tr>
							<td><b><?php echo $message['post']; ?></b> to <i><?php echo $message['recive']; ?></i><br><?php echo $message['content']; ?></td>
						</tr>
						<?php
						}
						?>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="modal fade" id="sendMessage" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content" style="margin-top: 100px;">
      			<div class="modal-header">
        			<h5 class="modal-title" id="sendMessage">Send Message</h5>
      			</div>
      			<div class="modal-body">
      				<div class="container">
        				<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
							<div class="row">
								<div class="form-group col-md-12">
    								<label for="channel">Select Unit</label>
    								<select name="unit" class="form-control">
    									<?php
    									foreach($availableUnits as $unit){
    									?>
    									<option value="<?php echo strtoupper($unit['unit']); ?>"><?php echo $unit['unit']; ?> (<?php echo $unit['collar']; ?>)</option>
    									<?php
    									}
    									?>
    								</select>
  								</div>
  								<div class="form-group col-md-12">
    								<label for="grade">Enter Message</label>
    								<input type="text" class="form-control" name="message">
  								</div>
								<div class="form-group" style="width: 100%;">
									<input type="submit" name='sendMessage' class="btn btn-success btn-block" value="Send Message">
           						</div>
           					</div>
						</form>
						<?php
							if(isset($_POST['sendMessage'])) { 
			  	  				sendMessage($_POST['unit'], 'DISPATCH', $_POST['message']);
							}
						?> 
					</div>
      			</div>
    		</div>
  		</div>
	</div>


<script> 
function refreshDiv() { 
    $('#refreshDiv').load(document.URL +  ' #refreshDiv');
} 

function refreshMessages(){
	$('#refreshMessages').load(document.URL +  ' #refreshMessages');
}

function panicSection(){
	$('#panicSection').load(document.URL +  ' #panicSection');
}

function refreshModals(){
	$('#test').load(document.URL +  ' #test');
}

function toggleDiv(div){
	$(`#${div}`).slideToggle();
}

function playAudio(){
	document.getElementById('player').play();
}

function stopAudio(){
	document.getElementById('player').stop();
}

window.setInterval(refreshDiv, 3000);
window.setInterval(refreshMessages, 3000);
window.setInterval(panicSection, 3000);
window.setInterval(refreshModals, 10000);
</script>