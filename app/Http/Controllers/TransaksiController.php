<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Pelanggan_model;
use App\Petugas_model;
use App\Transaksi_model;
use Illuminate\Support\Facades\Validator;
use Auth;
use DB;

class TransaksiController extends Controller
{
  public function store(Request $req)
  {
    if(Auth::user()->level=="petugas"){
    $validator = Validator::make($req->all(),
    [

      'id_pelanggan' => 'required',
      'id_petugas' => 'required',
      'tgl_transaksi' => 'required',
      'tgl_selesai' => 'required'
    ]);
    if($validator->fails()){
      return Response()->json($validator->errors());
    }
    $simpan = Transaksi_model::create([

      'id_pelanggan' => $req->id_pelanggan,
      'id_petugas' => $req->id_petugas,
      'tgl_transaksi' => $req->tgl_transaksi,
      'tgl_selesai' => $req->tgl_selesai,

    ]);
    return Response()->json(['status'=> 'Data peminjaman berhasil dimasukkan']);
  } else {
      return Response()->json(['status'=> 'Data peminjaman gagal dimasukkan, anda bukan petugas']);
    }
  }

  //Detail Peminjaman_model

  public function tampil(){
    if(Auth::user()->level=="petugas"){
  $datas = Transaksi_model::get();
  $count = $datas->count();
  $anggota = array();
  $status = 1;
  foreach ($datas as $dt_sw){
    $anggota[] = array(
      'id' => $dt_sw->id,
      'id_pelanggan' => $dt_sw->id_pelanggan,
      'id_petugas' => $dt_sw->id_petugas,
      'tgl_transaksi' => $dt_sw->tgl_transaksi,
      'tgl_selesai' => $dt_sw->tgl_selesai,
      'created_at' => $dt_sw->created_at,
      'updated_at' => $dt_sw->updated_at,
    );
  }
  return Response()->json(compact('count','anggota'));
} else {
  return Response()->json(['status'=> 'Gabisa, kamu bukan petugas :(']);
}
}

public function update($id,Request $req)
{
  if(Auth::user()->level=="petugas"){
  $validator=Validator::make($req->all(),
  [
    'id_pelanggan' => 'required',
    'id_petugas' => 'required',
    'tgl_transaksi' => 'required',
    'tgl_selesai' => 'required',
  ]);
  if($validator->fails()){
    return Response()->json($validator->errors());
  }
  $ubah=Transaksi_model::where('id',$id)->update([

    'id_pelanggan' => $req->id_pelanggan,
    'id_petugas' => $req->id_petugas,
    'tgl_transaksi' => $req->tgl_transaksi,
    'tgl_selesai' => $req->tgl_selesai,
  ]);
    return Response()->json([
                             'message'=>'Data transaksi berhasil diubah']);
  } else {
    return Response()->json([
                             'message'=>'Data transaksi gagal diubah, anda bukan petugas']);
  }
}



public function delete($id)
{
  if(Auth::user()->level=="petugas"){
  $hapus=Transaksi_model::where('id',$id)->delete();
    return Response()->json([
                             'message'=>'Data transaksi berhasil dihapus']);
  } else {
    return Response()->json([
                             'message'=>'Data transaksi gagal dihapus, anda bukan petugas']);
  }

}

public function deletedetail($id)
{
  if(Auth::user()->level=="petugas"){
  $hapus=Detail_model::where('id',$id)->delete();
    return Response()->json([
                             'message'=>'Data detail berhasil dihapus']);
  } else {
    return Response()->json([
                             'message'=>'Data detail gagal dihapus, anda bukan petugas']);
  }

}
}
