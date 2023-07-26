<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\JsonResponse;
use App\Models\Task;

class TaskController extends Controller
{
    public function getTasks(): JsonResponse {
        $tasks = DB::table('task')->get();
        return response()->json($tasks);
    }
}
