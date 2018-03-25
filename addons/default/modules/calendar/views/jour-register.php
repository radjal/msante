<div class="col-lg-4 col-lg-offset-4 col-sm-6 col-sm-offset-3" >
 
    <div class="module-header">
            <h3>
                <?php echo lang('user:register_header') ?>
            </h3>
    </div> 
    <div class="well">
   
    <?php // echo form_open('register', array('id' => 'register')) ?>
    <?php 
        //use GET var for redirect via menu
        if(!empty($this->agent->referrer()) ) 
        {
            $redirect_to = $this->agent->referrer();
            echo "<!-- ref: $redirect_to -->";
        }
        echo form_open('register', array('id' => 'register' ), array('redirect_to' => $redirect_to));
        ?>
    <ul>

            <?php if ( ! Settings::get('auto_username')): ?>
            <li>
                    <label for="username"><?php echo lang('user:username') ?></label>
                    <input type="text" name="username" maxlength="100" class="form-control input-sm"/>
            </li>
            <?php endif ?>

            <li>
                    <label for="email"><?php echo lang('global:email') ?></label>
                    <input type="text" name="email" maxlength="100" class="form-control input-sm"/>
                    <?php echo form_input('d0ntf1llth1s1n', ' ', 'class="default-form" style="display:none"') ?>
            </li>
            
            <li>
                    <label for="email">Confirmez votre email</label>
                    <input type="text" name="email" maxlength="100" class="form-control input-sm"/> 
            </li>

            <li>
                    <label for="password"><?php echo lang('global:password') ?></label>
                    <input type="password" name="password" maxlength="100" class="form-control input-sm" />
            </li>
  
            <li>
                    <label for="first_name"><?php echo lang('user:first_name') ?></label>
                    <input type="first_name" name="first_name" maxlength="100" class="form-control input-sm" />
            </li>
  
            <li>
                    <label for="last_name"><?php echo lang('user:last_name') ?></label>
                    <input type="last_name" name="last_name" maxlength="100" class="form-control input-sm" />
            </li>
  
            <li>
                    <label for="mobile">No de mobile</label>
                    <input type="mobile" name="mobile" maxlength="100" class="form-control input-sm" />
            </li> 

            <li>
                    <?php echo form_submit('btnSubmit', lang('user:register_btn'), 'class="btn btn-primary" style="margin-top:10px"') ?>
            </li>
    </ul>
    <?php echo form_close() ?>
    </div>
</div> 