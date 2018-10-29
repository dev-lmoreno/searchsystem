<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    public function get_state(){
		return $this->hasOne('App\State', 'id', 'state_id');
	}
}
