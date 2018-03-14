<!-- AJAX cart list -->
<table border="0" class="table-list" cellspacing="0">
        <thead>
        <tr>                
                <?php echo $this->html_m->table_header('product_id') ?> 
                <?php echo $this->html_m->table_header('name') ?>              
                <?php echo $this->html_m->table_header('product_qty') ?>
                <?php echo $this->html_m->table_header('line_price') ?>
                <?php echo $this->html_m->table_header('tax') ?>
                <?php echo $this->html_m->table_header('final_price') ?>
                <?php echo $this->html_m->table_header('unit') ?>
                <?php echo $this->html_m->table_header('origin') ?>
                <?php //echo $this->html_m->table_header('image_filename') ?>
                <!-- -->
                <th></th>
                
        </tr>
        </thead>
        <tbody>
                <?php foreach ($order_details as $details): ?>
                <tr>           
                        <td><?php echo $details->product_id ?></td>
                        <td><?php echo $details->name ?></td>
                        <td><?php echo $details->product_qty ?></td>
                        <td><?php echo $details->line_price ?>&nbsp;€</td>
                        <td><?php echo $details->tax ?>&nbsp;%</td>
                        <td><?php echo $details->final_price ?>&nbsp;€</td>
                        <td><?php echo $details->unit ?></td>
                        <td><?php echo $details->origin ?></td>
<!--                        <td><img src="<?php echo site_url().UPLOAD_PATH.'products/'. $details->image_filename ?>" height="40px"/>
</td>-->
                        <td></td>
                </tr>
                <?php endforeach ?>
        </tbody>
</table>