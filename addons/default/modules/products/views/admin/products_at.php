<section class="title"> 
	<h4><?php echo lang('products:item_list'); ?></h4>
        <?php $this->load->view('admin/partials/search') ?>

</section>

<section class="item">
	<?php echo form_open('admin/products/delete');?>
	
	<?php if (!empty($products)): ?>
	
		<table>
			<thead>
				<tr>
					<th><?php echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all'));?></th>
					<?php echo $this->html_m->table_header('id') ?>
					<!-- <th><?php echo lang('products:image'); ?></th> -->
                                        <?php echo $this->html_m->table_header('name') ?>
                                        <?php //echo $this->html_m->table_header('parent_cid') ?>
                                        <?php echo $this->html_m->table_header('cat_id') ?>
                                        <?php echo $this->html_m->table_header('active') ?>
                                        <?php echo $this->html_m->table_header('unit') ?>
                                        <?php echo $this->html_m->table_header('stock') ?>
                                        <?php echo $this->html_m->table_header('price') ?>
                                        <?php echo $this->html_m->table_header('tax') ?>
                                        <?php echo $this->html_m->table_header('final_price') ?>
                                       
					<th></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="12">
						<div class="inner"><?php $this->load->view('admin/partials/pagination'); ?><?php echo $total_rows ?> enregistrements</div> 
                                        </td>
				</tr>
			</tfoot>
			<tbody>
				<?php foreach( $products as $product ): ?>
				<tr>
					<td><?php echo form_checkbox('action_to[]', $product->id); ?></td>
                                        <!-- <td><?php
                                            if(!empty($product->image_filename))
                                            {
                                                $imgurl = site_url().UPLOAD_PATH.'products/'.$product->image_filename ;
                                                echo '<img src="'.$imgurl.'" height="30" />';
                                            }
                                            ?>
                                        </td> -->
                                        <td>
                                           <?php echo $product->id; ?>
                                        </td>
                                        <td>
                                            <a href="/admin/products/edit/<?php echo $product->id; ?>">
                                           <?php echo $product->name; ?>
                                            </a>
                                        </td>
                                        <!--<td>
                                            <a href="/admin/products?searchBtn=Search&parent_cid=<?php //echo $product->parent_cid; ?>">
                                            (<?php //echo $product->parent_cid ; ?>)
                                            <?php //echo $this->products_categories_m->category_name($product->parent_cid); ?>
                                            </a>
                                        </td> -->
					<td>
                                            <a href="/admin/products?searchBtn=Search&cat_id=<?php echo str_replace("\r\n", ' ', $product->cat_id) ; ?>">
                                            [ + ]
                                            </a>
                                            <?php 
                                                    foreach (explode("\r\n", $product->cat_id) as $cid) {
                                                    echo '<a href="/admin/products?searchBtn=Search&cat_id='.$cid.'">';
                                                        echo $this->products_categories_m->category_name($cid);
                                                        echo "</a>\r\n";
                                                    }

                                            //echo $this->products_categories_m->category_name($product->cat_id); 
                                            ?>
                                        </td>
                                        <td><?php echo $product->active; ?></td>
                                        <td><?php echo lang('products:unit_'.$product->unit); ?></td>
                                        <td><?php echo $product->stock; ?></td>
                                        <td><?php echo $product->price; ?></td>
                                        <td><?php echo $product->tax; ?></td>
                                        <td><?php echo $product->final_price; ?></td>

                                        
                                       
					<td class="actions">
						<?php 
						//anchor('products', lang('products:view'), 'class="button" target="_blank"');
						echo anchor('admin/products/edit/'.$product->id, lang('products:edit'), 'class="button"');
						echo anchor('admin/products/copy/'.$product->id, lang('products:copy'), 'class="button"');
//						echo anchor('admin/products/delete/'.$product->id, 	lang('products:delete'), array('class'=>'button')); 
                                                ?>
					</td> 
				</tr>
				<?php endforeach; ?>
			</tbody>
		</table>
		
		<div class="table_action_buttons">
			<?php 
                        $this->load->view('admin/partials/buttons', array('buttons' => array('delete'))); 
                        ?>
		</div>
		
	<?php else: ?>
		<div class="no_data"><?php echo lang('products:no_items'); ?></div>
	<?php endif;?>
	
	<?php echo form_close(); ?>
</section>