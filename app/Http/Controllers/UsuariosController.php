<?php

namespace App\Http\Controllers;

use App\Http\Controllers\ApiController;
use Illuminate\Http\Request;
use App\Models\Usuarios;

class UsuariosController extends ApiController
{

    public function index()
    {
        $Usuarios = Usuarios::select('idUsuario', 'nombre', 'email', 'saldo')
            ->get();

        return $this->sendResponse($Usuarios, "Usuario obtenido con exito");
        // return $this->sendError("Error Conocido", "Error controlado", 200);
    }
    public function store(Request $request)
    {
        try {
            $Usuarios = new Usuarios();
            $Usuarios->idUsuario = $request->input('idUsuario');
            $Usuarios->nombre = $request->input('nombre');
            $Usuarios->email = $request->input('email');
            $Usuarios->saldo = $request->input('saldo');
            $Usuarios->save();
            return $this->sendResponse($Usuarios, "Usuario creado con exito");
        } catch (\Exception $e) {
            return $this->sendError($e, "Error al crear usuario", 200);
        }
    }
    public function show($id)
    {
        $Usuarios = Usuarios::where('idUsuario', $id)
            ->select('idUsuario', 'nombre', 'email', 'saldo')
            ->get();
        return $this->sendResponse($Usuarios, "Usuario obtenido con exito");
    }
}
