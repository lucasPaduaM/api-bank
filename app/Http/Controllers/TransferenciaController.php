<?php

namespace App\Http\Controllers;

use App\Http\Controllers\ApiController;
use Illuminate\Http\Request;
use App\Models\Transferencia;
use App\Models\Usuarios;

class TransferenciaController extends ApiController
{

    public function index()
    {
        $Transferencia = Transferencia::select('idUsuarioOrigen', 'idUsuarioDestino', 'monto', 'descripcion', 'fecha')->get();
        return $this->sendResponse($Transferencia, "Transferencias obtenida con exito");
    }
    public function store(Request $request)
    {
        try {
            $Usuarios = new Usuarios();
            $Transferencia = new Transferencia();

            if ($request->input('saldo') < $request->input('monto')) {

                $Transferencia->idUsuarioOrigen = $request->input('idUsuarioOrigen');
                $Transferencia->idUsuarioDestino = $request->input('idUsuarioDestino');
                $Transferencia->monto = $request->input('monto');
                $Transferencia->descripcion = $request->input('descripcion');
                $Usuarios->saldo = $Usuarios->saldo - $request->input('monto');
                $Usuarios->saldo = $Usuarios->monto + $request->input('monto');

                $Transferencia->save();
                $Usuarios->update();

                return $this->sendResponse($Transferencia, "Transaccion realizada con exito");
            } else {
                return $this->sendError("El monto ingresado es mayor al saldo disponible, por favor ingrese un valor menor.");
            }
        } catch (\Exception $e) {
            return $this->sendError($e, "Error al realizar transferencia", 200);
        }
    }
    public function show($id)
    {
        $Transferencia = Transferencia::where('idTransferencia', $id)
            ->select('idTransferencia', 'idUsuarioOrigen', 'idUsuarioDestino', 'monto', 'descripcion', 'fecha')
            ->get();
        return $this->sendResponse($Transferencia, "Transaccion obtenido con exito");
    }
}
