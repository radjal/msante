<div id="container-appt" class="" style="display: none"> 
{{ if user:logged_in }} 
   <?php  
   echo form_open_multipart('appointments/set' , 'class="crud"'); 
   echo'';
   ?>
            <center class="appt-time alert alert-success h3"> 
                <a onclick="$('#container-appt, #weekday-wrapper').slideToggle()"><i class="glyphicon glyphicon-edit"></i></a> 
                <i class="glyphicon glyphicon-time"></i>
                    à <span>{{appointment_time}}</span> 
                    <input class="" name="appointment_time" id="appointment_time" type="hidden"  value="{{ appointment_time }}" />  
                    <input class="" name="doctor_id" id="doctor_id" type="hidden"  value="{{ doctor_id }}" />  
            </center>
                {{ user:profile }} 

                <?php
                echo'';
                ?>
                
                        <input type="hidden" name="appointment_date" value="{{datenumero}}" />        
                        
                        <div id="appt-info"> 
                            <div class="appt-person">
                                    <label for="for_user">Le RDV est pour vous? Oui/non (parent ou proche)</label> 
                                    <div class="for_user_ui" > 
                                        <a onclick="setIsForMe(this)" data-value="yes" class="btn btn-primary btn-sm ">pour vous</a>
                                        <a onclick="setIsForMe(this)" data-value="no" class="btn btn-primary btn-sm ">pour un proche</a> 
                                        <input class="" name="for_user" id="for_user" type="hidden"  value="{{ for_user }}" />  
                                    </div> 
                            </div>  
                            
                            <div id="appt-gender" class="" style="display:none">
                                    <label for="gender">Civilité :</label>
                                    <div class="gender_ui" > 
                                        <a onclick="setGender(this)" data-value="Homme" class="btn btn-primary btn-sm <?= isset($this->current_user->gender) && strtolower($this->current_user->gender) == 'homme' ? 'active btn-success' :null ?>">Homme</a>
                                        <a onclick="setGender(this)" data-value="Femme" class="btn btn-primary btn-sm <?= isset($this->current_user->gender) && strtolower($this->current_user->gender) == 'femme' ? 'active btn-success' :null ?>">Femme</a>
                                        <input class="" name="gender" id="gender" type="hidden" value="{{ gender:value }}"/>   
                                    </div>  
                            </div>  
                            
                            <p class="msgBox alert alert-warning" style="display:none"> <i class="close">×</i>
                                <span> </span>
                            </p>   
                        </div>   
                             
                        <p class="profile_fields-txt alert alert-warning"> <i class="close">×</i>
                                Vous pouvez modifier les informations qui apparraissent ci-dessous en 
                                <a href="{{url:site}}edit-profile">modifiant votre profil</a>
                        </p> 

                        <div id="appt-patient" class="hidden">   
                        <!--<h4>Vos coordonnées</h4>-->
                            <div class="info form-group">

                                    <label for="last_name">Nom de famille </label>
                                    <div class="input">
                                            <input type="text" class="form-control" name="last_name" value="{{ last_name }}" autocomplete="family-name">
                                    </div>                            
                                    <label for="first_name">Prénom </label>
                                    <div class="input">
                                            <input type="text" class="form-control" name="first_name" value="{{ first_name }}"  autocomplete="given-name">
                                    </div> 
                                    <?= $this->current_user->gender ?>
                                    <div class="field-mainden_name" style="display:"<?= isset($this->current_user->gender) and strtolower($this->current_user->gender) == 'homme' ? 'none' :'block' ?>>
                                        <label for="maiden_name">Nom de jeune fille</label>
                                        <div class="input">
                                            <input type="text" class="form-control" name="maiden_name" value="{{ maiden_name }}" autocomplete="additional-name">
                                        </div>   
                                    </div>                
                                     <label for="mobile">Date de naissance</label>
                                    <div class="input">
                                        <input type="text" class="form-control" aria-type="" name="birth_date" value="{{ birth_date }}"  autocomplete="">
                                    </div>             
                                     <label for="mobile">Mobile</label>
                                    <div class="input">
                                        <input type="text" class="form-control" aria-type="tel" name="mobile" value="{{ mobile }}"  autocomplete="tel-national">
                                    </div>             
                            </div>
                            <div class="address form-group"> 

                                    <label for="area_name">Quartier</label>
                                    <div class="input">
                                        <input type="text" class="form-control" name="area_name" value="{{ area_name }}" autocomplete="address-level4">
                                    </div>      

                                    <label for="commune">Commune</label>
                                    <div class="input">
                                        <input type="text" class="form-control" name="district" value="{{ district }}" autocomplete="address-level3">
                                    </div>      

                                    <label for="town">Ville</label>
                                    <div class="input">
                                        <input type="text" class="form-control" name="town" value="{{ town }}" autocomplete="address-level2">
                                    </div>   

                            </div>  
                            <div class="form-group">    
                                    <label for="insurance">Avez-vous une mutuelle santé?</label>
                                        <div class="insurance_ui" >
                                            <a onclick="setField('insurance', this)" class="btn btn-primary btn-sm <?= isset($this->current_user->insurance) && strtolower($this->current_user->insurance) == 'oui' ? 'active btn-success' :null ?>">Oui</a>
                                            <a onclick="setField('insurance', this)" class="btn btn-primary btn-sm <?= isset($this->current_user->insurance) && strtolower($this->current_user->insurance) == 'non' ? 'active btn-success' :null ?>">Non</a>
                                            <input type="hidden" class="form-control" id="insurance" name="insurance" value="{{ insurance }}">
                                        </div>
                            </div>  
                            <div class="form-group">   
                                    <label for="knows_doctor">Avez-vous déjà vu ce médecin ?</label>
                                        <div class="knows_doctor_ui" >
                                            <a onclick="setField('knows_doctor', this)" 
                                               class="btn btn-primary btn-sm">Oui</a>
                                            <a onclick="setField('knows_doctor', this)" 
                                               class="btn btn-primary btn-sm">Non</a>
                                        <input type="hidden" class="form-control" id="knows_doctor" name="knows_doctor" value="{{ knows_doctor }}">
                                        </div> 
                            </div>   

                            <div class="buttons" id="appt-button-wrapper">
                                    <button name="appointmentSend" value="Prendre RDV" type="submit" class="loader btn btn-success">Prendre RDV</button>
                            </div>
                        </div>
                {{ /user:profile }}
    <?php echo form_close(); ?>
{{else}} 
        <center>
            <a href="{{url:site}}users/login" class="btn btn-success">Se connecter</a>
            <p>Ou</p>
            <a href="{{url:site}}users/register" class="btn btn-primary">Créer un compte</a> 
        </center>  
{{ endif }}
<div style="clear: both;"></div> 
<?php //   $this->load->view('jour-register' ) ?> 
</div>   
   