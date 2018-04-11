<div class="post inscription">
        <div class="message_global">{{ msg_global }}</div>


<div id="inscription-wrapper"> 
        <center class="inscription-titre ">   
            Cas N°1
            <p class="alert alert-info">
                Afin de créer votre compte praticien, veuillez renseigner les champs suivants :
            </p>
            
            <?php echo form_open_multipart('', array('id'=>'cas1', 'class' => 'crud_form')); ?>
            <p>
                <div class="control-group">
                    <label class="control-label" for="email">RNGPS</label>
                    <div class="controls">
                        <?php echo form_input('rngps',  $this->input->post('rngps'), 'class="form-control" required'); ?>
                    </div>
                </div>
            
                <div class="control-group">
                    <label class="control-label" for="email">Date de naissance</label>
                    <div class="controls">
                        <?php echo form_input(array('type'=>'date', 'name' => 'birth_date'),  $this->input->post('birth_date'), 'class="form-control" '); ?>
                    </div>
                </div>
            
                <div class="control-group"> 
                    <div class="controls">
                                  <br/>
                        <!--<button class="btn btn-success btn-block loader load-replace" formaction="{{url:site}}inscription/cas1_1" type="button" onclick="cas1_check()" class="btn btn-link">Vérifier(XSS) ?</button>--> 
                                  <br/>
                        <button class="btn btn-success btn-block loader load-replace" formaction="{{url:site}}inscription/cas1_1" type="submit" class="btn btn-link">Vérifier</button> 
                    </div>
                </div>
            
            
                
            </p>
            
            
            <?php echo form_close(); ?>
            
            
        </center>  
    {{if response}}
            <p class="alert alert-info"> 
                <strong>Réponse webservice bien recu</strong><br/>
                    {{ response }}  
            </p>
    {{endif}}
</div>