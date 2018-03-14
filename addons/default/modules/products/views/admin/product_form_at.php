<?php echo form_open_multipart($this->uri->uri_string(), 'class="crud"'); ?>
<section class="title"> 
  <!-- We'll use $this->method to switch between orders.create & orders.edit -->
  <h4><?php echo lang('products:'.$this->method). " $products->name"; ?></h4><br/>
    <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'save_exit', 'cancel') )); ?>
</section>
<section class="item">   <div class="form_inputs">
    <ul>
      <li class="<?php echo alternator('', 'even'); ?>" id="form-info">
        <div class="input">
        <label for="name"><?php echo lang('products:name'); ?> <span>*</span></label>
            <?php echo form_input('name', set_value('name', $products->name), 'class="width-15"'); ?>
        </div>
        <div class="input">
        <label for="slug"><?php echo lang('products:slug'); ?> <span>*</span></label>
            <?php echo form_input('slug', set_value('slug', $products->slug), 'class="width-15"'); ?>
        </div>
        <br/>
        <?php echo $this->html_m->form_dropdown_catid($products->cat_id); ?>
        
        <!-- 
        <div class="input">
        <label for="parent_cid"><?php //echo lang('products:parent_cid'); ?> </label>
            <?php //echo $this->html_m->form_dropdown_parent_cid($products->parent_cid); ?>
        </div> 
        -->
        
        <?php echo $this->html_m->form_radio_active($products->active); ?>
        
      </li>
      
      <li class="<?php echo alternator('', 'even'); ?>" id="form-stock">
        <?php echo $this->html_m->form_input('stock', $products->stock); ?> 
        <?php echo $this->html_m->form_radio_units($products->unit, 'class="display:none;"'); ?>
      </li>
      
      <li class="<?php echo alternator('', 'even'); ?>"  id="form-prices"> 
          <?php echo $this->html_m->form_input('price', $products->price); ?> 
              <?php echo $this->html_m->form_input('tax', $products->tax); ?>
        
        <?php echo $this->html_m->form_input('final_price', $products->final_price); ?>
      </li>
	  <!--
      <li class="<?php echo alternator('', 'even'); ?>" id="form-image">
        <?php 
                        // image box 
                            echo '<div id="image_box">';
                            if(!empty($products->image_filename)) 
                            {
                                echo '<img src="'.site_url().UPLOAD_PATH.'products/'.$products->image_filename.'" />';
                            }
                            echo $products->image_filename;
                            echo '</div>';
                            
                            // image empty link
                            if(!empty($products->image_filename)) 
                            {
                                echo '<a href="javascript:void(0)" onclick="$(\'input[name=image_filename]\').val(\'\');$(\'#image_box\').html(\'\');">[ X ]</a><br/>';
                            }
                            //image name in hidden field
                            echo form_hidden('image_filename', set_value('image_filename', $products->image_filename), 'class="width-15"'); 
                            ?>
        <div class="input">
        <label for="image_filename"> <?php echo lang('products:image_filename'); ?> </label>
            <?php echo form_upload('image_filename', set_value('image_filename', $products->image_filename) , 'class="width-15"'); ?>
        </div>
      </li>
      <li class="<?php echo alternator('', 'even'); ?>" id="form-descr"> <?php echo $this->html_m->form_input('origin', $products->origin); ?>
        <div class="input">
        <label for="description"><?php echo lang('products:description'); ?> </label>
            <?php echo form_textarea('description', set_value('description', $products->description), 'class="width-15"'); ?>
        </div>
      </li> -->
      <?php if(isset($products->updated_on)) { ?>
      <li class="<?php echo alternator('', 'even'); ?>" class="form-bottom">
        <div class="input">
        <label for="updated_on"><?php echo lang('products:updated_on'); ?> </label>
          <?php if(!empty($products->updated_on)) echo $products->updated_on ?>
          <?php echo form_hidden('updated_on', $products->updated_on ) ?> </div>
      </li>
      <?php } ?>
      <?php if(isset($products->created_on)) { ?>
      <li class="<?php echo alternator('', 'even'); ?>" class="form-bottom">
        <div class="input">
        <label for="created_on"><?php echo lang('products:created_on'); ?> </label>
          <?php if(!empty($products->created_on)) echo $products->created_on ?>
          <?php echo form_hidden('created_on', $products->created_on ) ?> </div>
      </li>
      <?php } ?>
    </ul>
  </div>
  <div class="buttons">
    <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'save_exit', 'cancel') )); ?>
  </div>
 </section>  
<?php echo form_close(); ?>
