<?php

namespace App\Http\Controllers;

use App\Http\Controllers\ApiController;
use App\Models\Retiro;
use App\Models\Usuarios;
use Illuminate\Http\Request;

class RetiroController extends ApiController
{

    public function index()
    {
        $Retiro = Retiro::select('idRetiro', 'idUsuario', 'monto', 'fecha')
            ->get();

        return $this->sendResponse($Retiro, "...");
        // return $this->sendError("Error Conocido", "Error controlado", 200);
    }
    public function store(Request $request)
    {
        try {
            $Retiro = new Retiro();
            $Usuarios = new Usuarios();
            
            if ($request->input('monto') > $request->input('saldo')) {
                
                $Retiro->idRetiro = $request->input('idRetiro');
                $Retiro->idUsuario = $request->input('idUsuario');
                $Retiro->monto = $request->input('monto');
                $Usuarios->saldo = $Usuarios->saldo - $Retiro->monto = $request->input('monto');
                $Usuarios->update();
                $Retiro->save();
                return $this->sendResponse($Retiro, "Retiro realizado con exito");
            } else {
                $this->sendError('Saldo insuficiente');
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), "Error efectuar retiro", 200);
        }
    }
    public function show($id)
    {
        $Retiro = Retiro::where('idRetiro', $id)
            ->select('idRetiro', 'idUsuario', 'monto', 'fecha')
            ->get();
        return $this->sendResponse($Retiro, "Retiro obtenido con exito");
    }
}
