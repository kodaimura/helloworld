<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Models\Task;

class TaskController extends Controller
{
    public function getTasks(): JsonResponse {
        $tasks = DB::table('task')->get();
        return response()->json($tasks);
    }

    public function postTask(Request $request): JsonResponse {
        $taskName = $request->input('task_name');
        $description = $request->input('description');
        $dueDate = $request->input('due_date');
        $percentage = $request->input('percentage');

        $tasks = DB::table('task')->insert([
            'task_name' => $taskName,
            'description' => $description,
            'due_date' => $dueDate,
            'percentage' => $percentage, 
        ]);
        return response()->json($tasks);
    }
}
