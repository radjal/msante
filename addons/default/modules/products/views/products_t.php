<div class="products-container">

    <div class="categories-list">
        <ul>
        {{ products:categories order="asc" order_by="name" no_cat_id="4,5" }}
        <li><a href="{{url:site}}products/category/{{ slug }}">{{ name }}</a></li>
        {{ /products:categories }}
        </ul>
    </div>



    
{{ if items_exist }}
    {{ products:productsform_start action="products" }}
{{endif}}

<section>
{{ if items_exist }}

{{ products }}

        <div class="products"> 
            <div>
                <a href="{{url:site}}products/view/{{ id }}" title="{{description}}">{{ name }}</a>
            </div>
            <div>
                <a href="{{url:site}}products/view/{{ id }}" title="{{ name }} {{description}}">{{ img_html }}</a>
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

                    {{if cat_name}}<br/><a href="{{url:site}}products/category/{{cat_slug}}">{{cat_name}}</a>{{endif}}
                    
            </div>
            
            <div>
                {{ description }}
            </div>
            
            {{ if user:has_cp_permissions ==1 }} 
                <a target="_blank" class="adminlink" href="{{url:site}}admin/products/edit/{{id}}">Modifier</a>
            {{endif}}

        </div>        


{{ /products }}
{{ else }}
<h3>Pas de produits</h3>
{{endif}}

</section>

{{ if items_exist }}
{{ products:productsform_end }}
{{ products:jscarttotal }}

    {{ pagination:links }}
    {{result_count}} produits.
{{endif}}
<?php if($show_comments):?>
<div id="comments">

    <?php echo $this->comments->form();?>

    <div id="existing-comments">
            <h4><?php echo lang('comments:title') ?></h4>
            <?php echo $this->comments->display() ?>
    </div>    
</div>		
<?php endif;?>

</div>