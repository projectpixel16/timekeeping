<?php

namespace App\Http\Controllers;

use App\Models\AllowanceList;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class AllowanceListController extends Controller
{

    public function all_allowances(){
      
        $allowance = AllowanceList::orderBy('allowance_name','ASC')->get();
        return response()->json($allowance);
    }

    public function search_allowance(Request $request){
        $filter=$request->get('filter');
       
        if($filter!=null){
            $allowance=AllowanceList::where('allowance_name','LIKE',"%$filter%")->orderBy('allowance_name','ASC')->paginate(10);
            return response()->json($allowance);
        }else{
            $allowance = AllowanceList::orderBy('allowance_name','ASC')->paginate(10);
            return response()->json($allowance);
        }
    }


    public function create_allowance(Request $request){
        $formData=[
            'allowance_name'=>'',
        ];
        return response()->json($formData);
    }

    public function add_allowance(Request $request){

        $validated=$this->validate($request,[
            'allowance_name'=>['unique:allowance_lists','required','string']
        ]);
        AllowanceList::create($validated);
    }

      public function edit_allowance($id){
        $allowance = AllowanceList::find($id);
        return response()->json([
            'allowance'=>$allowance
        ],200);
    }

    public function update_allowance(Request $request, $id){
        $allowance=AllowanceList::where('id',$id)->first();
        $validated=$this->validate($request,[
            'allowance_name'=>['required', 'string',
            Rule::unique('allowance_lists', 'allowance_name')
            ->ignore($id)]
        ]);

        $allowance->update($validated);
    }
}
