<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\JenisCuci_model;
use Illuminate\Support\Facades\Validator;
use Auth;

class JenisCuciController extends Controller
{
  // CREATE
  public function store(Request $req)
  {
    if(Auth::user()->level=="admin"){
    $validator = Validator::make($req->all(),
    [
      'nama_jenis' => 'required',
      'harga_per_kilo' => 'required',
    ]);
    if($validator->fails()){
      return Response()->json($validator->errors());
    }
    $simpan = JenisCuci_model::create([
      'nama_jenis' => $req->nama_jenis,
      'harga_per_kilo' => $req->harga_per_kilo,
    ]);
    return Response()->json(['status'=> 'Data jenis cuci berhasil dimasukkan']);
  } else {
      return Response()->json(['status'=> 'Data jenis cuci gagal dimasukkan, anda bukan admin']);
    }
  }

  //READ
  public function tampil(){
    if(Auth::user()->level=="admin"){
  $datas = JenisCuci_model::get();
  $count = $datas->count();
  $jenis = array();
  $status = 1;
  foreach ($datas as $dt_sw){
    $jenis[] = array(
      'id' => $dt_sw->id,
      'nama_jenis' => $dt_sw->nama_jenis,
      'harga_per_kilo' => $dt_sw->harga_per_kilo,
      'created_at' => $dt_sw->created_at,
      'updated_at' => $dt_sw->updated_at,
    );
  }
  return Response()->json(compact('count','jenis'));
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
    'nama_jenis' => 'required',
    'harga_per_kilo' => 'required',
  ]);
  if($validator->fails()){
    return Response()->json($validator->errors());
  }
  $ubah=JenisCuci_model::where('id',$id)->update([
    'nama_jenis' => $req->nama_jenis,
    'harga_per_kilo' => $req->harga_per_kilo,
  ]);
    return Response()->json([
                             'message'=>'Data jenis cuci berhasil diubah']);
  } else {
    return Response()->json([
                             'message'=>'Data jenis cuci gagal diubah, anda bukan admin']);
  }
}

//DELETE
public function delete($id)
{
  if(Auth::user()->level=="admin"){
  $hapus=JenisCuci_model::where('id',$id)->delete();
    return Response()->json([
                             'message'=>'Data jenis cuci berhasil dihapus']);
  } else {
    return Response()->json([
                             'message'=>'Data jenis cuci gagal dihapus, anda bukan admin']);
  }

}
}
