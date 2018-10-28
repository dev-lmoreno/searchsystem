<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Bussiness;
use App\State;
use App\City;
use App\Category;
use App\BussinessCategory;

class BussinessController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $bussinesses = Bussiness::paginate(10);
        return view('bussiness.index',compact('bussinesses'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $states = State::all();
        $categories = Category::all();
        return view('bussiness.create',compact('states','categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required',
            'phone' => 'required',
            'address' => 'required',
            'zipcode' => 'required',
            'city' => 'required',
            'description' => 'required',
        ]);
        
        
        $bussiness = new Bussiness();
        $bussiness->title = $request->title;
        $bussiness->phone = $request->phone;
        $bussiness->address = $request->address;
        $bussiness->city_id = $request->city;
        $bussiness->zipcode = $request->zipcode;
        $bussiness->description = $request->description;

        if($bussiness->save()){
            foreach ($request->categories as $category) {
                $bussiness_category = new BussinessCategory();
                $bussiness_category->bussiness_id = $bussiness->id;
                $bussiness_category->category_id = $category;
                $bussiness_category->save();
            }            
        }
        
        return redirect('bussiness')->with('success', 'Information has been added!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //$category = Bussiness::find($id);
        //return view('category.edit',compact('category','id'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        /*$bussiness= Bussiness::find($id);
        $bussiness->name = $request->get('name');
        $bussiness->description = $request->get('description');
        $bussiness->save();
        return redirect('bussiness');*/
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $bussiness = Bussiness::find($id);
        $bussiness->delete();
        return redirect('bussiness')->with('success','Information has been  deleted');
    }

    public function cities($id){
        $state = State::findOrFail($id);
        if ($state) {
            return json_encode([
                'status' => 200,
                'data' => $state->cities
            ]);
        }

        return json_encode([
            'status' => 500
        ]);

    }

    public function about(Request $request){
        //$city = City::where('bussinesses.city_id')->join('city', 'city.id', '=', 'bussinesses.id')->get();
        //dd($city);
        $bussiness = Bussiness::findOrFail($request->bussiness_id);
        return view('about',compact('bussiness'));
    }

    public function search(Request $request){
        if (!trim($request->search)) {
            return view('welcome',compact('bussinesses','result'));
        }
        $result = $request->search;
        $categories = Category::where('name', 'like', '%'.$request->search.'%' )->get()->pluck('id')->toArray();
        $bussinesses = Bussiness::select('bussinesses.*')->join('bussiness_categories', 'bussinesses.id', '=', 'bussiness_categories.bussiness_id')
                       ->where('title', 'like', '%'.$request->search.'%' )
                       ->orWhere('zipcode', 'like', '%'.$request->search.'%')
                       ->orWhere('address', 'like', '%'.$request->search.'%')
                       ->orWhereIn('bussiness_categories.category_id',$categories)
                       ->distinct('id')
                       ->get();

        return view('welcome',compact('bussinesses','result'));
    }

}
