<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transferencia extends Model
{
    use HasFactory;
    protected $connection='bank_db';
    protected $table='transferencia';
    protected $primaryKey = "idTransferencia";
    public $timestamps=false;
}
