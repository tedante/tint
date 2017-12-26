@extends('layouts.user')
@section('content')
<!-- Review-Section-Strat  -->
<section class="review_area section-padding">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-body">
						<form class="form-horizontal" method="POST" action="index.php?controller=login&action=login_proccess">
							<div class="form-group">
								<label for="email" class="col-md-4 control-label">Username</label>

								<div class="col-md-6">
									<input id="email" type="text" class="form-control" name="username" value="" required autofocus>
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-md-4 control-label">Password</label>

								<div class="col-md-6">
									<input id="password" type="password" class="form-control" name="password" value="" required autofocus>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-6 col-md-offset-4">
									<div class="checkbox">
										<label>
											<input type="checkbox" name="remember"> Remember Me
										</label>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-8 col-md-offset-4">
									<button type="submit" class="btn subscribe_btn" name="submit">
										Login
									</button>

									<a class="btn btn-link" href="">
										Forgot Your Password?
									</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Compare-Ection-End  -->
@endsection