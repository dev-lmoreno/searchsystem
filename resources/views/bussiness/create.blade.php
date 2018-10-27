@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Create Bussiness</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
					@if ($errors->any())
						<div class="alert alert-danger">
						  <ul>
						      @foreach ($errors->all() as $error)
						          <li>{{ $error }}</li>
						      @endforeach
						  </ul>
						</div>
					@endif                    
					<form method="post" action="{{route('bussiness.store')}}" enctype="multipart/form-data">
						@csrf
						<div class="row">
						  <div class="form-group col-md-8">
						    <label for="Name">Title:</label>
						    <input type="text" class="form-control" name="title" id="title">
						  </div>
						</div>
						<div class="row">
						    <div class="form-group col-md-8">
						      <label for="Description">Phone:</label>
						      <input type="phone" class="form-control" name="phone" id="phone">
						    </div>
						</div>						
						<div class="row">
						    <div class="form-group col-md-8">
						      <label for="Description">Address:</label>
						      <input type="text" class="form-control" name="address" id="address">
						    </div>
						</div>
						<div class="row">
						    <div class="form-group col-md-8">
						      <label for="Description">Zipcode:</label>
						      <input type="text" class="form-control" name="zipcode" id="zipcode">
						    </div>
						</div>
						<div class="row">
						    <div class="form-group col-md-8">
						      <label for="Description">Description:</label>
						      <textarea class="form-control" id="exampleFormControlTextarea1" name="description" rows="3"></textarea>
						    </div>
						</div>
						<div class="row">
							<div class="form-group col-md-8">
						      <label for="Description">State:</label>
								<select class="form-control" required id="states">
									<option value="">Choose State</option>
									@foreach($states as $state)
										<option value="{{$state->id}}" >{{$state->name}}</option>
									@endforeach
								</select>									
							</div>						
						</div>	
						<div class="row">
							<div class="form-group col-md-8">
						      <label for="Description">City:</label>
								<select class="form-control" name="city" id="cities" required disabled></select>									
							</div>						
						</div>	
						<div class="row">
							<div class="form-group col-md-8">
						      <label for="Description">Categories:</label>
								<select id="example-getting-started" multiple="multiple" name="categories[]">
									@foreach($categories as $category)
										<option value="{{$category->id}}" >{{$category->name}}</option>
									@endforeach								    
								</select>									
							</div>						
						</div>							


						<div class="row">
						  <div class="form-group col-md-8" style="margin-top:60px">
						    <button type="submit" class="btn btn-success">Submit</button>
						  </div>
						</div>
					</form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
		$("#states").change(function(){
			if (this.value) {
				var url = "{{ route('cities.list','%id%') }}";
				url = url.replace('%id%',this.value);
		        $.ajax({
		            url : url,
		            type: 'GET',
		      		headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
		            processData: false,
		            success: function( result ) {
		            	let data = JSON.parse(result);
		            	if (data.status == 200) {
		            		for (var i =  0; i < data.data.length; i++) {
		            			$('#cities').append($('<option>', {
		            				value:data.data[i].id, text:data.data[i].name
		            			}));
		            		}
		            		$('#cities').removeAttr('disabled');
		            	}
		            }
		        });				
			}
		});
    });	
</script>
@endsection
