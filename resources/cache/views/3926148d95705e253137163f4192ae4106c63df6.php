<?php $__env->startSection('content'); ?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Product</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      
      <h2>Category</h2>
      <a href="<?php echo e(Config::$baseurl); ?>index.php?controller=product&action=create" class="btn btn-primary">Add</a>
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
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
          <td><?php echo e($item['CATEGORY_NAME']); ?></td>
          <td>
            <a href="<?php echo e(Config::$baseurl); ?>index.php?controller=product&action=edit&id=<?php echo e($item['PRODUCT_ID']); ?>" class="btn btn-info">Update</a> |
            <a href="<?php echo e(Config::$baseurl); ?>index.php?controller=product&action=destroy&id=<?php echo e($item['PRODUCT_ID']); ?>" class="btn btn-danger">Delete</a>
          </td>
          <?php $i++; ?>
        </tr>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
      <?php else: ?>
          <tr>
            <td colspan="2">Data Not Found</td>
          </tr>
      <?php endif; ?>
        </tbody>
      </table>
    </section>
    <!-- /.content -->
  </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>