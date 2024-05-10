<?php

namespace App\Http\Controllers;

use App\Models\HolidayTypes;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class HolidayTypesController extends Controller
{

    public function all_holiday_types(){
          
        $holidaytypes = HolidayTypes::orderBy('type_name','ASC')->get();
        return response()->json($holidaytypes);
        
    }


    public function search_holidaytypes(Request $request){
        $filter=$request->get('filter');
       
        if($filter!=null){
            $holidaytypes=HolidayTypes::where('type_name','LIKE',"%$filter%")->orderBy('type_name','ASC')->paginate(10);
            return response()->json($holidaytypes);
        }else{
            $holidaytypes = HolidayTypes::orderBy('type_name','ASC')->paginate(10);
            return response()->json($holidaytypes);
        }
  
    }


    public function create_holidaytype(Request $request){
        $formData=[
            'type_name'=>'',
            'percentage'=>'',
        ];
        return response()->json($formData);
    }

    public function add_holidaytype(Request $request){

        $validated=$this->validate($request,[
            'type_name'=>['unique:holiday_types','required','string'],
            'percentage'=>['required','numeric']
        ]);
        HolidayTypes::create($validated);
    }

      public function edit_holidaytype($id){
        $holidaytypes = HolidayTypes::find($id);
        return response()->json([
            'holidaytypes'=>$holidaytypes
        ],200);
    }

    public function update_holidaytype(Request $request, $id){
        $holidaytypes=HolidayTypes::where('id',$id)->first();
        $validated=$this->validate($request,[
            'type_name'=>['required', 'string',
            Rule::unique('holiday_types', 'type_name')
            ->ignore($id)],
            'percentage'=>['required','numeric']
        ]);

        $holidaytypes->update($validated);
    }
}
