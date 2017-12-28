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
        <li class="active">Category</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      {{-- {{var_dump($data)}} --}}
      <h2>Category</h2>
      <a href="{{ Config::$baseurl }}index.php?controller=category&action=create" class="btn btn-primary">Add</a>
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
      @if($data != NULL)
      <?php $i = 1?>
        @foreach($data as $item)
        <tr>
          
          <th>{{ $i }}</th>
          <td>{{ $item['CATEGORY_NAME'] }}</td>
          <td>
            <a href="{{ Config::$baseurl }}index.php?controller=category&action=edit&id={{ $item['CATEGORY_ID'] }}" class="btn btn-info">Update</a> |
            <a href="{{ Config::$baseurl }}index.php?controller=category&action=destroy&id={{ $item['CATEGORY_ID'] }}" class="btn btn-danger">Delete</a>
          </td>
          <?php $i++; ?>
        </tr>
        @endforeach
      @else
          <tr>
            <td colspan="2">Data Not Found</td>
          </tr>
      @endif
        </tbody>
      </table>
    </section>
    <!-- /.content -->
  </div>
@endsection