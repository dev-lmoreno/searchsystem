<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bussiness extends Model
{
    //
    public function categories(){
    	return $this->hasMany('App\BussinessCategory','bussiness_id','id')
    	->join('categories', 'bussiness_categories.category_id', '=', 'categories.id');
    }
}
