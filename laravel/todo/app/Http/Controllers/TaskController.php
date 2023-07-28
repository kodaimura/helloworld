<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Models\Task;

class TaskController extends Controller
{
    public function getTasks(): JsonResponse {
        $tasks = DB::table('task')->get();
        return response()->json($tasks);
    }

    public function getTask($id): JsonResponse {
        $tasks = DB::table('task')->where('id', $id)->first();
        return response()->json($tasks);
    }

    public function putTask(Request $request, $id): JsonResponse {
        $rules = [
            'task_name' => ['required', 'max:50'],
            'due_date' => ['date'],
            'percentage' => ['integer'],
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        
        $taskName = $request->input('task_name');
        $description = $request->input('description');
        $dueDate = $request->input('due_date');
        $percentage = $request->input('percentage');

        DB::table('task')
        ->where('id', $id)
        ->update([
            'task_name' => $taskName,
            'description' => $description,
            'due_date' => $dueDate,
            'percentage' => $percentage, 
        ]);
        return response()->json(200);
    }

    public function postTask(Request $request): JsonResponse {
        $rules = [
            'task_name' => ['required', 'max:50'],
            'due_date' => ['date'],
            'percentage' => ['integer'],
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $taskName = $request->input('task_name');
        $description = $request->input('description');
        $dueDate = $request->input('due_date');
        $percentage = $request->input('percentage');

        DB::table('task')->insert([
            'task_name' => $taskName,
            'description' => $description,
            'due_date' => $dueDate,
            'percentage' => $percentage, 
        ]);
        return response()->json(200);
    }
}
