<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Pelanggan_model;
use Illuminate\Support\Facades\Validator;
use Auth;

class PelangganController extends Controller
{
  // CREATE
  public function store(Request $req)
  {
    if(Auth::user()->level=="admin"){
    $validator = Validator::make($req->all(),
    [
      'nama' => 'required',
      'alamat' => 'required',
      'telp' => 'required'
    ]);
    if($validator->fails()){
      return Response()->json($validator->errors());
    }
    $simpan = Pelanggan_model::create([
      'nama' => $req->nama,
      'alamat' => $req->alamat,
      'telp' => $req->telp,

    ]);
    return Response()->json(['status'=> 'Data pelanggan berhasil dimasukkan']);
  } else {
      return Response()->json(['status'=> 'Data pelanggan gagal dimasukkan, anda bukan admin']);
    }
  }

  //READ
  public function tampil(){
    if(Auth::user()->level=="admin"){
  $datas = Pelanggan_model::get();
  $count = $datas->count();
  $pelanggan = array();
  $status = 1;
  foreach ($datas as $dt_sw){
    $pelanggan[] = array(
      'id' => $dt_sw->id,
      'nama_pelanggan' => $dt_sw->nama,
      'alamat' => $dt_sw->alamat,
      'telp' => $dt_sw->telp,
      'created_at' => $dt_sw->created_at,
      'updated_at' => $dt_sw->updated_at,
    );
  }
  return Response()->json(compact('count','pelanggan'));
} else {
  return Response()->json(['status'=> 'Gabisa, kamu bukan admin :(']);
}
}

// UPDATE
public function update($id,Request $req)
{
  if(Auth::user()->level=="admin"){
  $validator=Validator::make($req->all(),
  [
    'nama' => 'required',
    'alamat' => 'required',
    'telp' => 'required',
  ]);
  if($validator->fails()){
    return Response()->json($validator->errors());
  }
  $ubah=Pelanggan_model::where('id',$id)->update([
    'nama' => $req->nama,
    'alamat' => $req->alamat,
    'telp' => $req->telp,
  ]);
    return Response()->json([
                             'message'=>'Data pelanggan berhasil diubah']);
  } else {
    return Response()->json([
                             'message'=>'Data pelanggan gagal diubah, anda bukan admin']);
  }
}

//DELETE
public function delete($id)
{
  if(Auth::user()->level=="admin"){
  $hapus=Pelanggan_model::where('id',$id)->delete();
    return Response()->json([
                             'message'=>'Data pelanggan berhasil dihapus']);
  } else {
    return Response()->json([
                             'message'=>'Data pelanggan gagal dihapus, anda bukan admin']);
  }

}
}
