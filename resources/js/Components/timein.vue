<script setup>
    import { onMounted, ref } from "vue"
    import { useRouter } from "vue-router" //use if link is used inside the page
    import { ExclamationCircleIcon, CubeIcon } from '@heroicons/vue/24/solid'
    const router = useRouter() //use if link is used inside the page

    const showTime = () => {
    var date = new Date();
    var h = date.getHours(); // 0 - 23
    var m = date.getMinutes(); // 0 - 59
    var s = date.getSeconds(); // 0 - 59
    var session = "AM";
    
    if(h == 0){
        h = 12;
    }
    
    if(h > 12){
        h = h - 12;
        session = "PM";
    }
    
    h = (h < 10) ? "0" + h : h;
    m = (m < 10) ? "0" + m : m;
    s = (s < 10) ? "0" + s : s;
    
    var time = h + ":" + m + ":" + s + " " + session;
    document.getElementById("MyClockDisplay").innerText = time;
    document.getElementById("MyClockDisplay").textContent = time;
    
    setTimeout(showTime, 1000);
    
}

onMounted(async () => {
    showTime()
})

</script>
<template>
    <div>
		<div class="container-scroller ">
			<div class="container-fluid page-body-wrapper full-page-wrapper ">
                <!-- 
                !bg-blue-800 - na accept na ka system ang scanned qr
                !bg-green-700 - success
                !bg-yellow-600 - already logged in
                !bg-gray-800 - wala ga exist ang employee
                 -->
				<div class="content-wrapper d-flex align-items-center auth !bg-purple-800">
                    <div class="mt-10 absolute z-10 top-0 mx-10">
                        <h2 class="m-0 leading-none text-white">KRONOS</h2>
                        <p class="!text-base text-white ">QR Code Scanner</p>
                    </div>
					<div class="row w-100">
						<div class="w-full mx-auto">
							<div class="auth-form-transparent p-5 text-center">
								<div class="flex justify-center d-flex align-items-center py-1 ">
									<span id="MyClockDisplay" class="text-[170px] font-bold text-white"></span>
								</div>
                                <div class="mt-5">
                                    <form id="barcode-form" class="text-center mx-auto">
                                        <input type='text' name='empno' id='empno' class='form-control !text-white placeholder:!text-white text-center bg-transparent !border-none ' placeholder='Scanning ... ' required='required' autofocus="" oninput="changeBack()">
                                    </form>
                                </div>
                                <div class="flex justify-center">
                                    <div class=" border-2 rounded-xl text-white w-[650px] mx-auto p-4 text-2xl absolute ">
                                        <div class="flex justify-center space-x-2">
                                            <span>Sample Lorem</span>
                                            <span class="font-bold">10:10</span>
                                        </div>
                                    </div>
                                </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
   
</template>