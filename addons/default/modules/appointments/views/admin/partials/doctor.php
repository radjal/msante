<div id="appointment-extra">  DOCTOR
    		<ul>
			<li class="<?php echo alternator('', 'even'); ?>">
                            <?php 
                            echo $doctor['name']  ?> 
			</li>
			<li class="<?php echo alternator('', 'even'); ?>">
                            <?php echo $doctor['address']  ?> 
			</li>
			<li class="<?php echo alternator('', 'even'); ?>">
                            <?php echo $doctor['town']  ?> 
                            <?php echo $doctor['area_name']  ?> 
			</li>
			<li class="<?php echo alternator('', 'even'); ?>">
                            <?php echo $doctor['telephone']  ?> <br/>
                            <?php echo $doctor['mobile']  ?> <br/>
                            <?php echo $doctor['email']  ?> <br/>
			</li>
			<li class="<?php echo alternator('', 'even'); ?>">
                            <?php echo $doctor['description']  ?> <br/>
			</li>
		</ul>
</div>
