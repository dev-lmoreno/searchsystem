@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                	List Bussiness &nbsp
                	<a href="{{route('bussiness.create')}}" class="btn btn-success">Create Bussiness</a>
                </div>

                <div class="card-body">
                    @if (session('success'))
                        <div class="alert alert-success" role="alert">
                            {{ session('success') }}
                        </div>
                    @endif
                    @foreach($bussinesses as $bussiness)
                    	<div>
                        <div class="card" style="width: 690px;">
                          <div class="card-body">
                            <h5 class="card-title">{{$bussiness->title}}</h5>
                            <p class="card-text">{{$bussiness->description}}</p>
                          </div>
                        </div>
                    @endforeach

                    {{$bussinesses->links()}}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
