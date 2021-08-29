<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Usuarios extends Model
{
    use HasFactory;
    protected $connection='bank_db';
    protected $table='usuarios';
    protected $primaryKey = "idUsuario";
    public $timestamps=false;
}
