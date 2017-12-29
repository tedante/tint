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
          <div class="form-group">
            <label for="email" class="col-md-4 control-label">ID</label>

            <div class="col-md-6">
              <input id="name" type="text" class="form-control" name="name" value="{{ $data['CATEGORY_ID'] }}" required autofocus disabled>
            </div>
          </div>

          <div class="form-group">
            <label for="email" class="col-md-4 control-label">Name</label>

            <div class="col-md-6">
              <input id="name" type="text" class="form-control" name="name" value="{{ $data['CATEGORY_NAME'] }}" required autofocus disabled>
            </div>
          </div>

          <div class="form-group">
            <div for="email" class="col-md-4 control-label"><a href="{{ Config::$baseurl }}index.php?controller=category&action=index" class="btn btn-info"><<</a></div>
           

            <div class="col-md-6">
              {{-- <input id="name" type="text" class="form-control" name="name" value="{{ $data['CATEGORY_NAME'] }}" required autofocus disabled> --}}
            </div>
          </div>

        </form>
      </div>
    </div>
  </section>
  <!-- /.content -->
</div>
@endsection