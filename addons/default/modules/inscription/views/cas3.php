 {{if etape2 }}
 <iframe src=""></iframe>
 {{else}}
    <div class="post inscription">
            <div class="message_global">{{ msg_global }}</div>


    <div id="inscription-wrapper"> 
         
            <center class="inscription-titre ">   
                Cas N°3

                <p>
                    <button onclick="$('#inscription-wrapper .alert').hide();$('#inscription').show()" class="btn btn-info btn-block" href="{{url:site}}inscription/cas3/etape1" type="button"  class="btn btn-link">Vous inscrire à l’ONAMEG ?</button> 

                </p>

                <p>
                    <button onclick="$('#inscription-wrapper .alert').hide();$('#contactez').show()" class="btn btn-primary btn-block" href="{{url:site}}inscription/cas3/etape1" type="button" class="btn btn-link">Contacter l’ONAMEG ?</button> 

                </p>

            </center>  
        
        
        
        <div id="inscription" style="display: none" class="alert alert-info">
            Afin de procéder à votre inscription, veuillez renseigner les champs suivants :
        </div>
        <div id="contactez" style="display: none" class="alert alert-info">
                            Pour contacter l’ONAMEG,
                            Veuillez composer le : <a class="btn btn-default" href="tel:0121221313"><i class="glyphicon glyphicon-earphone"></i> 0121221313</a> <br/>(Numéro de téléphone du standard de l’ONAMEG)
                ou vous rendre directement dans nos bureaux à : (adresse de l’ONAMEG)
        </div> 
        
         
    </div>
 {{endif}}