<div id="container-appt" class="well" style="display: none">

    
    {{ if user:logged_in }}
            <?php echo form_open_multipart('appointments' , 'class="crud"'); ?>
        {{ user:profile }}
            <?php // echo form_open_multipart($this->uri->uri_string() , 'class="crud"'); ?>

                <!--<input type="hidden" name="_token" value="{{token}}" />-->
                <input type="hidden" name="appointment_date" value="{{jourdate}}" />
                <input type="hidden" name="gender" value=" " />
                <!--<input type="hidden" name="name" value="{{ data:week }} {{ jour }} {{journo}} " />-->
                <!--<input type="hidden" id="minAllowedAmount" value="{{ data:min_order_amount }}" />--> 
                <div id="appt-info">
                <p>Il est important que le médecin connaisse votre identité, merci de remplir les champs suivants :</p>
                <!--<p class="profile_fields">Vous pouvez modifier les informations qui apparraissent ci-dessous en <a href="{{url:site}}edit-profile">modifiant votre profil</a></p>-->


                <div class="appt-time">
                    <!--<label for="appointment_time">Heure de RDV</label>-->
                    <div class="input">
                        <input class="" name="appointment_time" id="appointment_time" type="text" /> 
                    </div>   
                </div>

    <!--            <div class="form-group">
                    <label for="message">Note</label>
                    <div class="input">
                        <?php // echo form_textarea('message', set_value('message', null), 'placeholder="Message" class="form-control"');  ?> 
                    </div>   
                </div>-->

                </div>

                <div id="appt-patient">   
                <h4>Vos coordonnées</h4>
                    <div class="form-group">
                            <label for="last_name">Nom </label>
                            <div class="input">
                                    <input type="text" class="form-control" name="last_name" value="{{ last_name }}">
                            </div>                            
                            <label for="first_name">Nom </label>
                            <div class="input">
                                    <input type="text" class="form-control" name="first_name" value="{{ first_name }}">
                            </div> 
                            <div class="hidden field-mainden_name">
                                <label for="maiden_name">Nom de jeune fille</label>
                                <div class="input">
                                    <input type="text" class="form-control" name="maiden_name" value="{{ maiden_name }}">
                                </div>   
                            </div>                
                             <label for="mobile">Mobile</label>
                            <div class="input">
                                <input type="text" class="form-control" aria-type="tel" name="mobile" value="{{ mobile }}">
                            </div>             
                    </div>
                    <div class="form-group"> 
                            <label for="address">Rue</label>
                            <div class="input">
                                <input type="text" class="form-control" name="address" value="{{ address }}">
                            </div>       

                            <label for="area_name">Quartier</label>
                            <div class="input">
                                <input type="text" class="form-control" aria-type="number"  name="area_name" value="{{ area_name }}">
                            </div>      

                            <label for="commune">Commune</label>
                            <div class="input">
                                <input type="text" class="form-control" aria-type="number"  name="commune" value="{{ district }}">
                            </div>      

                            <label for="town">Ville</label>
                            <div class="input">
                                <input type="text" class="form-control" name="town" value="{{ town }}">
                            </div>   
                    </div>  

                </div>
                <div class="buttons" id="appt-button-wrapper">
                        <button name="orderSend" value="Prendre RDV" type="submit" class="btn btn-success col-sm-4 col-sm-offset-4 col-xs-12">Prendre RDV</button>
                </div>
        {{ /user:profile }}
            <?php echo form_close(); ?>
    {{else}}
<!--    <p id="calendar-connect-msg">
        <a href="{{url:site}}users/login" class="btn btn-success">Vous devez vous connecter pour prendre un RDV.</a>
        <a href="{{url:site}}users/register" class="btn btn-primary">Enregistrez vous.</a>
    </p>-->
    
    {{ endif }}
    
    <div style="clear: both;"></div> 
</div>   
  
<?php if(!$this->current_user): ?> 
    <!-- login start -->
<!--    <form action="{{url:site}}users/login" method="post" accept-charset="utf-8" id="calendar-login">
        Vous devez vous connecter pour prendre un RDV. <br/>
                    <input type="text" class="form-control" name="email" value="" placeholder="Identifiant">
                    
                            <input type="password" name="password" maxlength="20" placeholder="Mot de passe">
                            
                            <input type="submit" value="Connexion" name="home-btnLogin"> 
                              
                            <a href="{{url:site}}users/reset_pass">Mot de passe oublié ?</a>	

                <input type="hidden" name="redirect_to" value="{{url:segments default="home"}}">
    </form>-->
    <!-- login end --> 
<?php 
$this->load->view('jour-register') ;
else:  ?>

<?php endif; ?>
