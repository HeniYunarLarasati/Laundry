<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DetailTrans_model extends Model
{
    protected $table = "detail_trans";
    protected $primaryKey = "id";
    protected $fillable = [
      'id_trans', 'id_jenis', 'qty', 'subtotal'
    ];
}
