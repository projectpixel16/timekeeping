<?php

namespace App\Http\Controllers;
use App\Models\BusinessUnits;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class BusinessUnitsController extends Controller
{

    public function all_businessunits(){
      
        $business = BusinessUnits::orderBy('bu_name','ASC')->get();
        return response()->json($business);
    }

    public function create_business(Request $request){
        $formData=[
            'bu_name'=>'',
            'contact_no'=>'',
            'address'=>'',
        ];
        return response()->json($formData);
    }

    public function add_business(Request $request){

        $validated=$this->validate($request,[
            'bu_name'=>['unique:business_units','required','string'],
            'contact_no'=>['string'],
            'address'=>['string']
        ]);
        BusinessUnits::create($validated);
    }

    public function search_business(Request $request){
        $filter=$request->get('filter');
       
        if($filter!=null){
            $business=BusinessUnits::where('bu_name','LIKE',"%$filter%")
            ->orWhere('address','LIKE',"%$filter%")
            ->orWhere('contact_no','LIKE',"%$filter%")
            ->orderBy('bu_name','ASC')->paginate(10);
           
        }else{
            $business = BusinessUnits::orderBy('bu_name','ASC')->paginate(10);
        }

        return response()->json($business);
    }

    public function edit_business($id){
        $business = BusinessUnits::find($id);
        return response()->json([
            'business'=>$business
        ],200);
    }

    public function update_business(Request $request, $id){
        $business=BusinessUnits::where('id',$id)->first();
        $validated=$this->validate($request,[
            'bu_name'=>['required', 'string',
            Rule::unique('business_units', 'bu_name')
            ->ignore($id)],
            'contact_no'=>['string'],
            'address'=>['string']
        ]);

        $business->update($validated);
    }

}
