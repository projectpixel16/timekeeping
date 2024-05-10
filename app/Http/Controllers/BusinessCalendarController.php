<?php

namespace App\Http\Controllers;

use App\Models\BusinessCalendar;
use App\Models\Holidays;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class BusinessCalendarController extends Controller
{
    public function create_calendar(Request $request){
        $formData=[
            'year'=>'',
            'start_date'=>'',
            'end_date'=>'',
        ];
        return response()->json($formData);
    }

    public function create_holiday(Request $request){
        $formData[]=[
            'holiday_date'=>'',
            'holiday_name'=>'',
            'holiday_type'=>'',
        ];
        return response()->json($formData);
    }


    public function add_calendar(Request $request){

        $holidays = $request->input('holidays');
        $validated=$this->validate($request,[
            'year'=>['unique:business_calendars','required','numeric'],
            'start_date'=>['unique:business_calendars','required'],
            'end_date'=>['unique:business_calendars','required']
        ]);
        
        $calendar_id = BusinessCalendar::insertGetId($validated);
        
        if($holidays > 0){
            foreach(json_decode($holidays) as $h){

                Holidays::create([
                    'business_calendar_id' => $calendar_id,
                    'holiday_type_id'=>$h->holiday_type,
                    'holiday_date'=>$h->holiday_date,
                    'holiday_name'=>$h->holiday_name
                ]);
                        
            }
        }
    }

    public function edit_calendar($id){
        $calendar = BusinessCalendar::find($id);
        $holidays = Holidays::where('business_calendar_id','=',$id)->get();
        return response()->json([
            'calendar'=>$calendar,
            'holidays'=>$holidays
        ],200);
    }

    public function update_calendar(Request $request, $id){
        $calendar=BusinessCalendar::where('id',$id)->first();
        $validated=$this->validate($request,[
            'year'=>['required', 'string',
            Rule::unique('business_calendars', 'year')
            ->ignore($id)],
            'start_date'=>['required', 
            Rule::unique('business_calendars', 'start_date')
            ->ignore($id)],
            'end_date'=>['required',
            Rule::unique('business_calendars', 'end_date')
            ->ignore($id)],
        ]);

        $calendar->update($validated);

        $holidays = $request->input('holidays');
        foreach(json_decode($holidays) as $h){

            if(Holidays::where('business_calendar_id', '=', $id)->where('id','=',$h->id)->exists()){
                $calendar=Holidays::where('id',$h->id)->first();
                $calendar->update([
                    'holiday_type_id'=>$h->holiday_type_id,
                    'holidate_date'=>$h->holiday_date,
                    'holiday_name'=>$h->holiday_name
                ]);
              
            } else {
                Holidays::create([
                    'business_calendar_id' => $id,
                    'holiday_type_id'=>$h->holiday_type_id,
                    'holiday_date'=>$h->holiday_date,
                    'holiday_name'=>$h->holiday_name
                ]);
            }
        }

    }

    public function delete_holiday($id){

        $hol=Holidays::find($id);
        $hol->delete(); 
    }

    public function view_calendar($id){
        $calendar = BusinessCalendar::find($id);
        $holidays = Holidays::where('business_calendar_id','=',$id)->get();
        return response()->json([
            'calendar'=>$calendar,
            'holidays'=>$holidays
        ],200);
    }

    public function search_calendar(Request $request){
        $filter=$request->get('filter');
       
        if($filter!=null){
           
            $calendar=BusinessCalendar::where('year','LIKE',"%$filter%")
            ->orWhere('start_date','LIKE',"%$filter%")
            ->orWhere('end_date','LIKE',"%$filter%")
            ->orderBy('year','DESC')->paginate(10);
      

            return response()->json($calendar);
        }else{
            //$departments = Departments::paginate(10);
            $calendar = BusinessCalendar::orderBy('year','DESC')->paginate(10);
            return response()->json($calendar);
        }
    }

}
