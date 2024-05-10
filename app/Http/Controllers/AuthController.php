<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class AuthController extends Controller
{
   public function login_form(){
        $formData = [
            'email'=>null,
            'password'=> null,
        ];

        return response()->json($formData);
   }

   public function login_process(Request $request){
       
    
   
        $credentials = [
            'email' => $request->email,
            'password' => $request->password,
        ];

         if (Auth::attempt($credentials)) {
            //$user = User::where('email', $request->email)->first();
            $user = $request->user();
           $success['token'] = $user->createToken('MyApp')->plainTextToken;
           $success['name'] = $user->name;

           $response = [
                'success' => true,
                'data' => $success,
                'message' => 'User login successfully'
           ];

           return response()->json($response, 200);
         } else {

            $response = [
                'success' => false,
                'message' => 'Unauthorized'
           ];
           
           return response()->json($response,200);     
        }

    }

    public function logout(Request $request) {
        Auth::logout();
        return redirect('/');
      }

//     public function dashboard(){
//         $credentials=[
//             'name' => Auth::user()->name,
//             'temp_password' => Auth::user()->temp_password,
//         ];
//         return response()->json($credentials);
//    }

//    public function change_password(){
//         $credentials=[
//             'id' => Auth::user()->id,
//             'name' => Auth::user()->name,
//         ];
//         return response()->json($credentials);
//     }

//     public function create_credential(Request $request){
//         $formData=[
//             'new_password'=>'',
//             'confirm_password'=>'',
//         ];
//         return response()->json($formData);
//     }

//     public function edit_password(Request $request){
//         $employees=User::where('id',$request->user_id)->first();
//         $validated=$this->validate($request,[
//             'password'=>['required','min:6','max:10'],
//         ]);
//         $validated=[
//             'temp_password'=>null,
//             'change_password'=>1
//         ];
//         $employees->update($validated);
//     }

}
