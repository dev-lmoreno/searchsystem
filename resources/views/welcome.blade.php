<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Searchsystem</title>

        <!-- Fonts -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <!-- Styles -->
        <style>
            html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
            }

            .full-height {
                height: 300vh;
            }

            .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
            }

            .title {
                font-size: 84px;
            }

            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 12px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
        <div class="flex-center position-ref">

            <div class="content">
                <div class="title m-b-md">
                    Searchsystem
                </div>

                <form class="form-inline" method="post" action="{{route('bussiness.list')}}">  
                    @csrf
                    <div class="row">
                        <input type="text" class="form-control" name="search" id="search" placeholder="Search..." style="width:500px;">&nbsp;
                        <button type="submit" class="btn btn-primary mb-2"><i class="fa fa-search"></i></button>
                    </div>
                </form>
                @if(isset($result)) 
                <p>Results for "{{$result}}"</p>
                @endif

                @if(isset($bussinesses))
                <div class="card">
                    @foreach($bussinesses as $bussiness)
                    <!-- FOREACH BUSINESS-->
                        <div class="card-body">
                            <h5 class="float-left"><strong>Title: <br></strong></h5>
                            <h5 class="card-title float-left">{{$bussiness->title}}</h5>
                        </div>
                        <div class="card-body">
                            <h5 class="float-left"><strong>Categoria: </strong><br></h5>
                             @foreach($bussiness->categories as $category)
                                <!-- FOREACH CATEGORIES -->
                                <br><br><h5 class="card-title float-left">{{$category->name}}</h5>
                             @endforeach
                             <br><br><a href="{{route('about')}}?bussiness_id={{$bussiness->id}}" class="float-right">About</a>
                        </div>                    
                    @endforeach
                <div class="card">
                @endif
            </div>
        </div>
    </body>
</html>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
