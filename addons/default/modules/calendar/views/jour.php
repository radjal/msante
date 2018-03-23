{{ if showinput }}
    {{ products:productsform_start }}
    <input type="hidden" name="_token" value="{{token}}" />
    <input type="hidden" name="appointment_date" value="{{jourdate}}" />
    <input type="hidden" name="name" value="s{{ data:week }} {{ jour }} {{journo}} " />
    <input type="hidden" id="minAllowedAmount" value="{{ data:min_order_amount }}" />
{{ endif }}

<div class="message_global">{{ data:msg_global }}</div>
<!--<div class="message_jour">{{ data:msg_dujour }}</div>-->
<?php $this->load->view('doctor') ;
        
    $show=$this->input->get('show');
    $show_am = strtolower($show)=='am' ? true : false ;
    $show_pm = strtolower($show)=='pm' ?  true : false ;
    $show_am_attr = $show_am ? 'none' : 'block' ;
    $show_pm_atrr = $show_pm  ? 'none' : 'block' ;
//			$show_am=$show_pm=true;
    ?> 

<div id="weekzone-wrapper" class="jour">
    <div id="weekzone"> 
        <center class="h3">
            {{ jour }} {{journo}}  {{ helper:date format=" m Y" timestamp=jourdate }} 
            <!-- {{jourdate}} {{data:month_name}} {{data:year}}--> 
        </center>
        
        <center class="h3">
            Choisir votre horaire de RDV
        </center>
        
        <center class="h3">
            <button id="btn-am" class="btn btn-default <?= $show_am ? 'active' : '' ?>" onclick="periodShow('am')" type="button">Matin</button>
            <button id="btn-pm"class="btn btn-default <?= $show_pm ? 'active' : '' ?>" onclick="periodShow('pm')" type="button">Après midi</button>
        </center>
        
        <div class="calendar-jour row {{ if passe }}date-passed {{ endif }}">  
            <?php
//            $no_periods = count($appointments); 
//            $x = round($no_periods/3, 0)  ;
            $appts_total = 0 ; $appts_pre_break = $appts_post_break = false;
            $html_pre_break = $html_post_break = '';
            
    //                        echo'<ul>'; 
                        //loop periods
                        $break_passed =false;
                        foreach ($appointments as $periods ) 
                        {   
                            $html = $class = ''; 
                            $html .= $periods['dt'];
                            if($periods['break'] == 'true')
                            {
                                $break_passed = true;
                                $html .= ' En pause';
                                $class .= 'pause ';
//                                $html .= !$appts_pre_break&&$appts_total>0?"<br/>$appts_total&nbsp;RDV avant la pause":'';
                                $appts_pre_break = $appts_total;
                                
                            }
                            if(isset($periods['appointment']) && count($periods['appointment'])>0 )
                            {   
                                $class .= ' has_appt';
                                $appts_total += count($periods['appointment']);
                                $html .= $this->calendar_m->html_caldots($periods['appointment']) ; 
                            } 
                            //output pre render                            
                            if($periods['break'] !== 'true' && !$break_passed) 
                            { 
                                $html_pre_break .=  '<div class="panel panel-default break-pre '.$class.'"><div class="panel-body">'.$html.'</div></div>' ; 
                            } else if($periods['break'] !== 'true' && $break_passed) {
                                $html_post_break .=  '<div class="panel panel-default break-post'.$class.'"><div class="panel-body">'.$html.'</div></div>' ;
                            }
                            //final render 
                        }   
//                        echo'</ul>';
                        //post loop output
                        echo "<div class=\"period-am\" style=\"display:$show_am_attr;\" >$html_pre_break</div>" ;
                        echo "<div class=\"period-pm\" style=\"display:$show_pm_atrr;\" >$html_post_break</div>" ;
                        $appts_post_break = $appts_total - $appts_pre_break ;
                        echo $appts_pre_break>0 ? "$appts_pre_break RDV avant la pause <br/>" : '' ;
                        echo $appts_post_break>0 ? "$appts_post_break RDV après la pause <br/>" : '' ;
                        echo $appts_total >0 ? "$appts_total RDV au total" : '' ; 
            ?> 
            
        </div>
    
    </div>
  </div> 
  

{{ if showinput }}
<div id="order-form-container" class="hidden">
    {{ if user:logged_in }}
        {{ user:profile }}
            <div id="order-details">
            <h4>Prendre RDV</h4>
            <!--<p class="profile_fields">Vous pouvez modifier les informations qui apparraissent ci-dessous en <a href="{{url:site}}edit-profile">modifiant votre profil</a></p>-->
 

            <section>
                <label for="appointment_time">Heure de RDV</label>
                <div class="input">
                    <input name="appointment_time" id="appointment_time" type="text" > 
                </div>   
            </section>

            <section>
                <label for="message">Note</label>
                <div class="input"><textarea name="message" cols="40" rows="10">{{ info_acces }}</textarea>
                </div>   
            </section>

            </div>

            <div id="order-appointment">   
            <h4>Vos coordonnées</h4>
                    <div>
                            <label for="last_name">Nom </label>
                            <div class="input">
                                    <input type="text" name="last_name" value="{{ last_name }}">
                            </div>                            
                            <label for="first_name">Nom </label>
                            <div class="input">
                                    <input type="text" name="first_name" value="{{ first_name }}">
                            </div>                            
                            <label for="maiden_name">Nom de jeune fille</label>
                            <div class="input"><input type="text" name="maiden_name" value="{{ maiden_name }}">
                            </div>                  
                             <label for="mobile">Mobile</label>
                            <div class="input"><input type="text" aria-type="tel" name="mobile" value="{{ mobile }}">
                            </div>             
                    </div>
                    <div>
                            <label for="address">Rue</label>
                            <div class="input"><input type="text" name="address" value="{{ address }}">
                            </div> 
                            <label for="town">Ville</label>

                            <div class="input"><input type="text" name="town" value="{{ town }}">
                            </div>                            
                            <label for="area_name">Quartier</label>
                            <div class="input"><input type="text"aria-type="number"  name="area_name" value="{{ code_postal }}">
                            </div>      
                    </div>  

            </div>
            <div class="buttons" id="order-button-wrapper">
                        <input type="submit" name="orderSend" value="Enregistrer cette commande" class="button">
            </div>
        {{ /user:profile }}
    {{else}}
    <p id="calendar-connect-msg">
        <a href="{{url:site}}users/login">Vous devez vous connecter pour prendre un RDV.</a>
        <a href="{{url:site}}users/register">Enregistrez vous.</a>
    </p>
    {{ endif }}
    <div style="clear: both;"></div>
</div> 
{{ endif }}

{{ if !user:logged_in AND !passe }}
    <!-- login start -->
    <form action="{{url:site}}users/login" method="post" accept-charset="utf-8" id="calendar-login">

        Vous devez vous connecter pour passer une commande. <br/>
                    <input type="text" name="email" value="" placeholder="Identifiant">
                    
                            <input type="password" name="password" maxlength="20" placeholder="Mot de passe">
                            
                            <input type="submit" value="Connexion" name="home-btnLogin"> 
                            
                            <label>Rester connecté <input type="checkbox" name="remember" value="1"></label>
                            
                            <a href="{{url:site}}users/reset_pass">Mot de passe oublié ?</a>	

    <input type="hidden" name="redirect_to" value="{{url:uri_string}}">
    </form>
    <!-- login end -->
{{ endif }}
