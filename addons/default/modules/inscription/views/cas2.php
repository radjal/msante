<div class="post inscription">
        <div class="message_global">{{ data:msg_global }}</div>


<div id="inscription-wrapper"> 
        <center class="inscription-titre ">   
            Cas N°2
            <p class="alert alert-info">
                Afin de vous identifier dans la base et permettre la mise à jour de votre dossier, veuillez renseigner les champs suivants :
            </p>
            
            <?php echo form_open_multipart('', array('id'=>'cas1', 'class' => 'crud_form')); ?>
            <p>
                <div class="control-group">
                    <label class="control-label" for="onameg">Numéro d'enregistrement à l'onameg</label>
                    <div class="controls">
                        <?php echo form_input('onameg',  $this->input->post('onameg'), 'class="form-control" required'); ?>
                    </div>
                </div>
            
<!--                <div class="control-group">
                    <label class="control-label" for="date_obtention">Date d'obtention</label>
                    <div class="controls">
                        <?php echo form_input(array('type'=>'date', 'name' => 'birth_date'),  $this->input->post('date_obtention'), 'class="form-control" required'); ?>
                    </div>
                </div>-->
<!--            
                <div class="control-group">
                    <label class="control-label" for="birth_date">Date de naissance</label>
                    <div class="controls">
                        <?php echo form_input(array('type'=>'date', 'name' => 'birth_date'),  $this->input->post('birth_date'), 'class="form-control" required'); ?>
                    </div>
                </div>-->
            
                <div class="control-group">
                    <label class="control-label" for="email">Email</label>
                    <div class="controls">
                        <?php echo form_input(array('type'=>'email', 'name' => 'email'),  $this->input->post('email'), 'class="form-control" required'); ?>
                    </div>
                </div>
            
                <div class="control-group"> 
                    <div class="controls">
                                <button class="btn btn-success loader load-replace btn-block" formaction="{{url:site}}inscription/cas2_1" type="submit" class="btn btn-link">Vérifier?</button> 
                    </div>
                </div>
            
            
                
            </p>
            
            
            <?php echo form_close(); ?>
            
            
        </center>  
    
    
    
    {{if response}}
            <p class="alert alert-info"> 
                <strong>Réponse webservice bien recu</strong><br/>
                    {{url}} 
                    {{response}} 
            </p>
    {{else}}
    {{endif}}
    
</div>