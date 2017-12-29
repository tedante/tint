@extends('layouts.user2')
@section('content')
<!-- Header-Section-End  -->

<!-- Product-Section-Strat  -->
<div class="container">
	{{-- {{var_dump($data)}} --}}
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
		@if($data != NULL)
      <?php $i = 1?>
        @foreach($data as $item)
        <tr>
          
          <th>{{ $i }}</th>
          <td>{{ $item['PRODUCT_NAME'] }}</td>
          <td>{{ $item['PRODUCT_PRICE'] }}</td>
          {{-- <td><a href="{{ Config::$baseurl }}index.php?controller=category&action=show&id={{ $item['CATEGORY_ID'] }}">{{ $item['CATEGORY_NAME'] }}</a></td> --}}
          <td>
            <a href="{{ Config::$baseurl }}index.php?controller=cart&action=destroy&id={{ $item['ORDER_ID'] }}" class="btn btn-danger">Delete</a>
          </td>
          <?php $i++; ?>
        </tr>
        @endforeach
        <tr>
        	
         <th colspan="2">Total</th>
          {{-- <td><a href="{{ Config::$baseurl }}index.php?controller=category&action=show&id={{ $item['CATEGORY_ID'] }}">{{ $item['CATEGORY_NAME'] }}</a></td> --}}
          <td>{{ $jumlah }}</td>
          <td></td>
        </tr>
      @else
          <tr>
            <td colspan="4">Data Not Found</td>
          </tr>
      @endif
     
        </tbody>
      </table>
      <a href="{{ Config::$baseurl }}index.php?controller=cart&action=buy&id={{ $item['CART_ID'] }}" class="btn btn-primary">Buy</a>
	</div>
</div>
	</section>
	<!-- Compare-Ection-End  -->
	@endsection