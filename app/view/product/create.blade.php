@extends('layouts.admin')

{{-- @section('panel-profile')
<p id="tk-panel-profile">
  {{ $data['USER_NAME'] }} - Administrator
  <small>Member since Nov. 2012</small>
</p>
@endsection --}}

@section('content')
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
        <form class="form-horizontal" method="POST" action="{{ Config::$baseurl }}index.php?controller=product&action=store"  enctype="multipart/form-data">
          <div class="form-group">
            <label for="email" class="col-md-4 control-label">Name</label>
            <div class="col-md-6">
              <input id="name" type="text" class="form-control" name="name" value="" required autofocus>
            </div>
          </div>

          <div class="form-group">
            <label for="email" class="col-md-4 control-label">Category</label>
            <div class="col-md-6">
              <select name="category">
                @foreach($category as $item)
                  <option value="{{ $item['CATEGORY_ID'] }}">{{$item['CATEGORY_NAME']}}</option>
                @endforeach
              </select>
            </div>
          </div>

          <div class="form-group">
            <label for="email" class="col-md-4 control-label">Description</label>
            <div class="col-md-6">
              <textarea name="desc"></textarea>
            </div>
          </div>

          <div class="form-group">
            <label for="email" class="col-md-4 control-label">Price</label>
            <div class="col-md-6">
              <input id="name" type="number" class="form-control" name="price" value="" required autofocus>
            </div>
          </div>

          <div class="form-group">
            <label for="email" class="col-md-4 control-label">Stok</label>
            <div class="col-md-6">
              <input id="name" type="number" class="form-control" name="stok" value="" required autofocus>
            </div>
          </div>

          <div class="form-group">
            <label for="email" class="col-md-4 control-label">File</label>
            <div class="col-md-6">
              <input id="name" type="file" class="form-control" name="photo" value="" required autofocus>
            </div>
          </div>

          <div class="form-group">
            <div class="col-md-8 col-md-offset-4">
              <button type="submit" class="btn subscribe_btn" name="submit">
                Add
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </section>
  <!-- /.content -->
</div>
@endsection