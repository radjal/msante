<div onclick="$('div.cart-list').animate({width:300}, 200).slideToggle()" id="cart-widget-btn">
	Mon panier {{if totals:total_taxed}}{{ totals:total_taxed }}{{else}}0{{endif}}<span> € </span>
</div>

<div class="cart-list" style="display:none;width:0">
	<?php if ($count > 0 ) : ?>
			<ol>
			<?php 
				foreach ($cart as $p => $p_details) {
					echo "<li>{$p_details['appointment_qty']} x {$p_details['name']}</li>";
				}
			?>
			</ol>
			<a href="{{url:site}}appointments" class="btn">Passez la commande</a>
	<?php else: ?>
			Il n'y a rien dans votre panier
	<?php endif; ?>
</div>