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
      <li class="active">Dashboard</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="panel panel-default">
      <div class="panel-body">
          <div class="form-group">
            <label for="email" class="col-md-4 control-label">ID</label>

            <div class="col-md-6">
              <input id="name" type="text" class="form-control" name="name" value="<?php echo e($data['CATEGORY_ID']); ?>" required autofocus disabled>
            </div>
          </div>

          <div class="form-group">
            <label for="email" class="col-md-4 control-label">Name</label>

            <div class="col-md-6">
              <input id="name" type="text" class="form-control" name="name" value="<?php echo e($data['CATEGORY_NAME']); ?>" required autofocus disabled>
            </div>
          </div>

          <div class="form-group">
            <div for="email" class="col-md-4 control-label"><a href="<?php echo e(Config::$baseurl); ?>index.php?controller=category&action=index" class="btn btn-info"><<</a></div>
           

            <div class="col-md-6">
              
            </div>
          </div>

        </form>
      </div>
    </div>
  </section>
  <!-- /.content -->
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>