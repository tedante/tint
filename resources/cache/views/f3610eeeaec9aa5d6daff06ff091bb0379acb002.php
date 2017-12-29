<?php $__env->startSection('content'); ?>
<!-- Header-Section-End  -->

<!-- Product-Section-Strat  -->
<div class="container">
	
	<div class="row">
	 <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
		<?php if($data != NULL): ?>
      <?php $i = 1?>
        <?php $__currentLoopData = $data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <tr>
          
          <th><?php echo e($i); ?></th>
          <td><?php echo e($item['PRODUCT_NAME']); ?></td>
          <td><?php echo e($item['PRODUCT_PRICE']); ?></td>
          
          <td>
            <a href="<?php echo e(Config::$baseurl); ?>index.php?controller=cart&action=destroy&id=<?php echo e($item['ORDER_ID']); ?>" class="btn btn-danger">Delete</a>
          </td>
          <?php $i++; ?>
        </tr>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        <tr>
        	
         <th colspan="2">Total</th>
          
          <td><?php echo e($jumlah); ?></td>
          <td></td>
        </tr>
      <?php else: ?>
          <tr>
            <td colspan="4">Data Not Found</td>
          </tr>
      <?php endif; ?>
     
        </tbody>
      </table>
      <a href="<?php echo e(Config::$baseurl); ?>index.php?controller=cart&action=buy&id=<?php echo e($item['CART_ID']); ?>" class="btn btn-primary">Buy</a>
	</div>
</div>
	</section>
	<!-- Compare-Ection-End  -->
	<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.user2', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>