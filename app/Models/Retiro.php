<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Retiro extends Model
{
    use HasFactory;
    protected $connection='bank_db';
    protected $table='retiro';
    protected $primaryKey = "idRetiro";
    public $timestamps=false;
}
