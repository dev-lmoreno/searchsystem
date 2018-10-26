
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Index Page</title>
    <link rel="stylesheet" href="{{asset('css/app.css')}}">
  </head>
  <body>
    <div class="container">
    <br />
    @if (\Session::has('success'))
      <div class="alert alert-success">
        <p>{{ \Session::get('success') }}</p>
      </div><br />
     @endif
    <table class="table table-striped">
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      
      @foreach($categories as $category)
      <tr>
        <td>{{$category['id']}}</td>
		<td>{{$category['name']}}</td>
        <td>{{$category['description']}}</td>
        
        <td><a href="{{action('CategoryController@edit', $category['id'])}}" class="btn btn-warning">Edit</a></td>
        <td>
          <form action="{{action('CategoryController@destroy', $category['id'])}}" method="post">
            @csrf
            <input name="_method" type="hidden" value="DELETE">
            <button class="btn btn-danger" type="submit">Delete</button>
          </form>
        </td>
      </tr>
      @endforeach
    </tbody>
  </table>
  </div>
  </body>
</html>