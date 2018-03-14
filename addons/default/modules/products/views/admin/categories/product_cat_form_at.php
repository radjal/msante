<section class="title">
	<?php if ($this->controller == 'admin_categories' && $this->method === 'edit'): ?>
	<h4><?php echo lang('products:category_edit_title')." $category->name" ;?></h4>
	<?php else: ?>
	<h4><?php echo lang('products:category_create_title');?></h4>
	<?php endif ?>
</section>

<section class="item">
<div class="content">
<?php echo form_open($this->uri->uri_string(), 'class="crud'.((isset($mode)) ? ' '.$mode : '').'" id="categories"') ?>

<div class="form_inputs categories">

	<ul>
		<li>
			<label for="title"><?php echo lang('products:name');?> <span>*</span></label>
			<div class="input"><?php echo  form_input('name', $category->name) ?></div>
                        
			<label for="slug"><?php echo lang('products:slug') ?> <span>*</span></label>
			<div class="input"><?php echo  form_input('slug', $category->slug) ?></div>
                        <!--
			<label for="slug"><?php echo lang('products:parent_id') ?> </label>
			<div class="input"><?php echo  form_input('parent_id', $category->parent_id ? $category->parent_id : 0) ?></div>
                        -->
			<div class="input"><?php if(!empty($category->updated_on)) echo $category->updated_on ?></div>
			<div class="input"><?php if(!empty($category->created_on)) echo  $category->created_on ?></div>
                        
			<?php if(!empty($category->id)) echo  form_hidden('id', $category->id) ?>
		</li>
	</ul>

</div>

	<div><?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel') )) ?></div>

<?php echo form_close() ?>
</div>
</section>