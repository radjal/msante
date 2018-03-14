<div class="product-container">
{{ products:productsform_start }}

<section  class="product">
            {{ if user:has_cp_permissions ==1 }} 
                <a target="_blank" class="adminlink" href="{{url:site}}admin/products/edit/{{id}}">Modifier</a>
            {{endif}}
            <h2>
                {{ name }}
            </h2>
            <div>
                <a href="{{url:site}}products/view/{{ id }}" title="{{ name }}\n{{ description }}">{{ img_html }}</a>
            </div>
            
            <div>
                <span class="price">{{ final_price }}</span>€

            </div>
            <div>
                    {{ input_html }} 
            </div>
            <div>      
            {{ if unit =='kg' }}
                        Au kilo
                    {{ endif }}
                    {{ if unit =='unitary' }}
                        Vente a l'unité
                    {{ endif }}
                    {{ if unit =='100g' }}
                        Par 100 grammes
                    {{ endif }}
                    {{ if origin }}
                    <br/>Origine {{origin}}
                    {{ endif }}

                    {{#cat_name#}}  
                    
            </div>
        {{if description }}
            <div>
                {{ description }}
            </div>
        {{endif}}   

</section>


{{ products:productsform_end }}

<?php if($show_comments):?>
<?php echo $this->comments->form();?>

<div id="existing-comments">
        <h4><?php echo lang('comments:title') ?></h4>
        <?php echo $this->comments->display() ?>
</div>		
<?php endif;?>

			
</div>