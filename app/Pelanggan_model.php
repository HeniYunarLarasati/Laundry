<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pelanggan_model extends Model
{
  protected $table="pelanggan";
  protected $primaryKey="id";
  protected $fillable = [
    'nama', 'alamat', 'telp', 
  ];
}
