<a  class="btn orange"id="search-btn" onclick="$('#search').slideToggle()"><?php echo lang('products:search') ?></a>

<div id="search" style="display: none">
    <form method="get">
        <button type="submit" class="btn blue" name="searchBtn" value="<?php echo lang('products:search') ?>" /><?php echo lang('products:search') ?></button>
        <a class="btn gray" href="/admin/products"><?php echo lang('products:reset') ?></a>
        <br/>
        <?php 
                $cat_ids = $this->input->get('cat_id') ;
                // correct if not array
                if(is_string($cat_ids)) $cat_ids = explode (' ', $cat_ids); 
                echo $this->html_m->form_dropdown_catid($cat_ids); 
        ?>
        <br/>
        <?php echo $this->html_m->form_radio_active($this->input->get('active')) ?>

        <br/>
        <?php echo $this->html_m->form_radio_units($this->input->get('unit')) ?>
        
        <br/>
        <?php echo $this->html_m->form_input('id', $this->input->get('id')) ?>
        <?php echo $this->html_m->form_input('name', $this->input->get('name')) ?>
        <?php echo $this->html_m->form_input('stock', $this->input->get('stock')) ?>
        <?php echo $this->html_m->form_input('price', $this->input->get('price')) ?>
        <?php echo $this->html_m->form_input('tax', $this->input->get('tax')) ?>
        <?php echo $this->html_m->form_input('final_price', $this->input->get('final_price')) ?>
        <?php //echo $this->html_m->form_input('parent_cid', $this->input->get('parent_cid'), '', 'Id '.lang('products:'.'parent_cid') ) ?>
        <?php //echo $this->html_m->form_input('cat_id', $this->input->get('cat_id'), '', 'Id '.lang('products:'.'cat_id') ) ?>
        <?php echo form_hidden('sortdir', $this->input->get('sortdir') !='' ? $this->input->get('sortdir') : 'asc' ) ?>
        <?php echo form_hidden('sort', $this->input->get('sort') !='' ? $this->input->get('sort') : 'id' ) ?>
        <br/>
        <button class="btn blue" type="submit" name="searchBtn" value="<?php echo lang('products:search') ?>" /><?php echo lang('products:search') ?></button>
        <a class="btn gray" href="/admin/products"><?php echo lang('products:reset') ?></a>
    </form>
</div>
<div id="views">
</div>