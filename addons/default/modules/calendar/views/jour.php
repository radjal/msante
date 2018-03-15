{{ if showinput }}
    {{ products:productsform_start }}
    <input type="hidden" name="_token" value="{{token}}" />
    <input type="hidden" name="delivery_date" value="{{jourdate}}" />
    <input type="hidden" name="name" value="s{{ data:week }} {{ jour }} {{journo}} " />
    <input type="hidden" id="minAllowedAmount" value="{{ data:min_order_amount }}" />
{{ endif }}

<div class="message_global">{{ data:msg_global }}</div>
<div class="message_jour">{{ data:msg_dujour }}</div>

<div id="weekzone-wrapper" class="jour">
    <div id="weekzone">
        <center class="calendar-jour-titre">{{ jour }} {{journo}}</center>
            <div class="calendarjour {{ if passe }}date-passed {{ endif }}">
            {{ if entrees }}
                    <section id="entrees">
                    <div class="calendar_separator">Entrées</div>
						<div class="content">
                                     {{ entrees }}
                                     <p{{if stock<="0"}} class="no-stock"{{endif}}>
                                         {{ input_html }} {{ name }} {{ final_price }}€ {{ if description }}<span>{{ description }}</span>{{endif}} {{ if informations }}<span>{{ informations }}</span>{{endif}} <br />	
                                     </p>
                                     {{ /entrees }}
						</div>
                    </section>
            {{ endif }}  

            {{ if plats }}
                    <section id="plats">
                    <div class="calendar_separator">Plats</div>
						<div class="content">
                                     {{ plats }}
                                     <p{{if stock<="0"}} class="no-stock"{{endif}}>
                                         {{ input_html }} {{ name }} {{ final_price }}€ {{ if description }}<span>{{ description }}</span>{{endif}} {{ if informations }}<span>{{ informations }}</span>{{endif}} <br />	
                                     </p>
                                     {{ /plats }}
						</div>
                    </section>
            {{ endif }}  

            {{ if desserts }}
                    <section id="desserts">
                    <div class="calendar_separator">Desserts</div>
						<div class="content">
                                     {{ desserts }}
                                     <p{{if stock<="0"}} class="no-stock"{{endif}}>
                                         {{ input_html }} {{ name }} {{ final_price }}€ {{ if description }}<span>{{ description }}</span>{{endif}} {{ if informations }}<span>{{ informations }}</span>{{endif}} <br />	
                                     </p>
                                     {{ /desserts }}
						</div>
                    </section>
            {{ endif }}  

            {{ if boissons }}
                    <section id="boissons">
                    <div class="calendar_separator">Boissons</div>
						<div class="content">
                                     {{ boissons }}
                                     <p{{if stock<="0"}} class="no-stock"{{endif}}>
                                     {{ input_html }} {{ name }} {{ final_price }}€ {{ if description }}<span>{{ description }}</span>{{endif}} {{ if informations }}<span>{{ informations }}</span>{{endif}} <br />	
                                     </p>
                                     {{ /boissons }}
						</div>
                    </section>
            {{ endif }}  
            </div> 
        
        {{ if showinput }}
            {{ products:jscarttotal }}
        {{ endif }}
        
    </div>
  </div> 
  

{{ if showinput }}
<div id="order-form-container">
    {{ if user:logged_in }}
        {{ user:profile }}
            <div id="order-details">
            <h4>Passez la commande</h4>
            <p class="profile_fields">Vous pouvez modifier les informations qui apparraissent ci-dessous en <a href="{{url:site}}edit-profile">modifiant votre profil</a></p>
            
            <section> <label for="payment_type">Type de paiement </label>
                <div class="input">
                    <label><input type="radio" name="payment_type" value="cc" {{ if user:moyen_de_paiement == 'Carte bancaire' }} checked="checked" {{ endif }}>
                        Carte de crédit</label>
                    <label><input type="radio" name="payment_type" value="cheque" {{ if user:moyen_de_paiement == 'Chèque bancaire' }} checked="checked" {{ endif }}>
                        Chèque</label>
                    <label><input type="radio" name="payment_type" value="cash" {{ if user:moyen_de_paiement == 'Espèces' }} checked="checked" {{ endif }}>
                        Espèces</label>
                    <label><input type="radio" name="payment_type" value="meal_coupon" {{ if user:moyen_de_paiement == 'Chèque déjeuner' }} checked="checked" {{ endif }}>
                        Ticket restaurant</label>
                </div>   
            <p class="profile_fields">Vous pouvez nous régler en espèces, calendar bancaire,chèque bancaire ou ticket restaurant.</p>
            </section>


            <section>
                <label for="delivery_time">Heure de livraison souhaitée</label>
                <div class="input">
                    <select name="delivery_time" id="delivery_time"> 
                        <option value="">-----</option>                         
                        <option value="11h30 - 12h00" {{ if user:heure_de_livraison == '11h30 - 12h00' }} selected="selected" {{ endif }} >11h30 - 12h00</option>
                        <option value="12h00 - 12h30" {{ if user:heure_de_livraison == '12h00 - 12h30' }} selected="selected" {{ endif }} >12h00 - 12h30</option>
                        <option value="12h30 - 13h00" {{ if user:heure_de_livraison == '12h30 - 13h00' }} selected="selected" {{ endif }} >12h30 - 13h00</option>
                        <option value="13h00 - 13h30" {{ if user:heure_de_livraison == '13h00 - 13h30' }} selected="selected" {{ endif }} >13h00 - 13h30</option>
                        <option value="13h30 - 14h00" {{ if user:heure_de_livraison == '13h30 - 14h00' }} selected="selected" {{ endif }} >13h30 - 14h00</option>

                    </select>
                </div>   
            </section>

            <section>
                <label for="message">Votre message </label>
                <div class="input"><textarea name="message" cols="40" rows="10">{{ info_acces }}</textarea>
                </div>   
            </section>

            </div>

            <div id="order-delivery">   
            <h4>Vos coordonnées</h4>
                    <div>
                            <label for="d_name">Nom </label>
                            <div class="input">
                                    <input type="text" name="d_fullname" value="{{ first_name }} {{ last_name }}">
                            </div>                            
                            <label for="d_company">Société livrée</label>
                            <div class="input"><input type="text" name="d_company" value="{{ societe }}">
                            </div>                  
                             <label for="d_mobile">Mobile</label>
                            <div class="input"><input type="text" aria-type="tel" name="d_mobile" value="{{ mobile }}">
                            </div>          
                             <label for="d_phone">Téléphone</label>
                            <div class="input"><input type="text" aria-type="tel" name="d_phone" value="{{ phone }}">
                            </div>          
                    </div>
                    <div>
                            <label for="d_street1">Rue</label>
                            <div class="input"><input type="text" name="d_street1" value="{{ address }}">
                            </div> 
                            <label for="d_town">Ville</label>

                            <div class="input"><input type="text" name="d_town" value="{{ ville }}">
                            </div>                            
                            <label for="d_zipcode">Code postal</label>
                            <div class="input"><input type="text"aria-type="number"  name="d_zipcode" value="{{ code_postal }}">
                            </div>      
                    </div>  

            </div>
            <div class="buttons" id="order-button-wrapper">
                        <input type="submit" name="orderSend" value="Enregistrer cette commande" class="button">
            </div>
        {{ /user:profile }}
    {{else}}
    <p id="calendar-connect-msg">
        <a href="{{url:site}}users/login">Vous devez vous connecter pour passer une commande.</a>
    </p>
    {{ endif }}
    <div style="clear: both;"></div>
</div>
	{{ products:productsform_end showbutton='false' }}
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
