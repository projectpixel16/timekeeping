<script setup>
    import { onMounted, ref } from 'vue';
    import { useRouter } from "vue-router";
    import { HomeIcon, FolderIcon, ChevronRightIcon, CubeIcon, BellIcon, EnvelopeIcon, UsersIcon, NewspaperIcon, ClockIcon } from '@heroicons/vue/24/solid';
  

    const router = useRouter()
    const employeeprofileDrop = ref(false);
    const masterfileDrop = ref(false);
    const timemanagementDrop = ref(false);
    const notificationDrop = ref(false);
    const messageDrop = ref(false);
    const accountDrop = ref(false);
    const reportDrop = ref(false);
    const dropdown = ref(false);

    let userid = localStorage.getItem('id')
    let details=ref('')

  
    onMounted(async () => {
        checkLogin()
    })


    const checkLogin = async() => {
        if(!userid){
            logout()
        } else {
            let response = await axios.get(`/api/get_employee_details/${userid}`);
		    details.value = response.data;
           
        }
    }

    const logout = () => {
	    localStorage.removeItem('token')
	    router.push('/')
    }

</script>
<template>
    <div >
        <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row default-layout-navbar " id="navbar">
            <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center ">
                <a class="navbar-brand  brand-logo mt-2 h1 !text-lg !font-extrabold" href="#">
                    <div class="flex justify-between space-x-2">
                        <span class="text-violet-900"><CubeIcon fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-7 h-7"></CubeIcon></span>
                        <span class="tracking-normal text-gray-900 !font-black uppercase">Company Name</span>
                    </div>
                </a>
                <!-- <a class="navbar-brand brand-logo" href="../../index-2.html"><img src="../../images/logo.svg" alt="logo"/></a>
                <a class="navbar-brand brand-logo-mini" href="../../index-2.html"><img src="../../images/logo-mini.svg" alt="logo"/></a> -->
            </div>
            <div class="navbar-menu-wrapper d-flex align-items-stretch">
                <!-- <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                    <span class="fas fa-bars"></span>
                </button> -->
                <!-- <ul class="navbar-nav">
                    <li class="nav-item nav-search d-none d-md-flex">
                        <div class="nav-link">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                <span class="input-group-text">
                                    <i >
                                        <MagnifyingGlassIcon fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4"/>
                                    </i>
                                </span>
                                </div>
                                <input type="text" class="form-control" placeholder="Search" aria-label="Search">
                            </div>
                        </div>
                    </li>
                </ul> -->
                <ul class="navbar-nav navbar-nav-right">
                   
                    <!-- <li class="nav-item dropdown">
                        <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" @click="notificationDrop = !notificationDrop" href="#" data-toggle="dropdown">
                            <i class="fas fa-bell mx-0">
                                <BellIcon fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 pt-1 pr-1"/>
                            </i>
                            <span class="count">16</span>
                        </a>
                        <Transition
                            enter-active-class="transition ease-out duration-250"
                            enter-from-class="opacity-0 h-1/2"
                            enter-to-class="opacity-100 h-full"
                            leave-active-class="transition ease-in duration-100"
                            leave-from-class="opacity-100 h-full"
                            leave-to-class="opacity-0 h-1/2"
                        >
                            <div v-show="notificationDrop">
                                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
                                    <a class="dropdown-item">
                                        <p class="mb-0 font-weight-normal float-left">You have 16 new notifications
                                        </p>
                                        <span class="badge badge-pill badge-warning float-right">View all</span>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-thumbnail">
                                        <div class="preview-icon bg-danger">
                                            <i class="fas fa-exclamation-circle mx-0"></i>
                                        </div>
                                        </div>
                                        <div class="preview-item-content">
                                        <h6 class="preview-subject font-weight-medium">Application Error</h6>
                                        <p class="font-weight-light small-text">
                                            Just now
                                        </p>
                                        </div>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-thumbnail">
                                        <div class="preview-icon bg-warning">
                                            <i class="fas fa-wrench mx-0"></i>
                                        </div>
                                        </div>
                                        <div class="preview-item-content">
                                        <h6 class="preview-subject font-weight-medium">Settings</h6>
                                        <p class="font-weight-light small-text">
                                            Private message
                                        </p>
                                        </div>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-thumbnail">
                                        <div class="preview-icon bg-info">
                                            <i class="far fa-envelope mx-0"></i>
                                        </div>
                                        </div>
                                        <div class="preview-item-content">
                                        <h6 class="preview-subject font-weight-medium">New user registration</h6>
                                        <p class="font-weight-light small-text">
                                            2 days ago
                                        </p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </Transition>
                    </li> -->
                    <!-- <li class="nav-item dropdown">
                        <a class="nav-link count-indicator dropdown-toggle" id="messageDropdown" href="#" @click="messageDrop = !messageDrop" data-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-envelope mx-0">
                                <EnvelopeIcon  fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 pt-1 pr-1"/>
                            </i>
                            <span class="count">25</span>
                        </a>
                        <Transition
                            enter-active-class="transition ease-out duration-250"
                            enter-from-class="opacity-0 h-1/2"
                            enter-to-class="opacity-100 h-full"
                            leave-active-class="transition ease-in duration-100"
                            leave-from-class="opacity-100 h-full"
                            leave-to-class="opacity-0 h-1/2"
                        >
                        <div v-show="messageDrop">
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"  aria-labelledby="messageDropdown">
                                <div class="dropdown-item">
                                    <p class="mb-0 font-weight-normal float-left">You have 7 unread mails
                                    </p>
                                    <span class="badge badge-info badge-pill float-right">View all</span>
                                </div>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <img src="../../images/faces/face4.jpg" alt="image" class="profile-pic">
                                    </div>
                                    <div class="preview-item-content flex-grow">
                                    <h6 class="preview-subject ellipsis font-weight-medium">David Grey
                                        <span class="float-right font-weight-light small-text">1 Minutes ago</span>
                                    </h6>
                                    <p class="font-weight-light small-text">
                                        The meeting is cancelled
                                    </p>
                                    </div>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <img src="../../images/faces/face2.jpg" alt="image" class="profile-pic">
                                    </div>
                                    <div class="preview-item-content flex-grow">
                                    <h6 class="preview-subject ellipsis font-weight-medium">Tim Cook
                                        <span class="float-right font-weight-light small-text">15 Minutes ago</span>
                                    </h6>
                                    <p class="font-weight-light small-text">
                                        New product launch
                                    </p>
                                    </div>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item preview-item">
                                    <div class="preview-thumbnail">
                                        <img src="../../images/faces/face3.jpg" alt="image" class="profile-pic">
                                    </div>
                                    <div class="preview-item-content flex-grow">
                                    <h6 class="preview-subject ellipsis font-weight-medium"> Johnson
                                        <span class="float-right font-weight-light small-text">18 Minutes ago</span>
                                    </h6>
                                    <p class="font-weight-light small-text">
                                        Upcoming board meeting
                                    </p>
                                    </div>
                                </a>
                            </div>
                        </div>
                        </Transition>
                    </li> -->
                    <li class="nav-item nav-profile dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown" @click="accountDrop = !accountDrop">
                            <img :src="'/images/default.jpg'" alt="profile"/>
                        </a>
                        <Transition
                            enter-active-class="transition ease-out duration-250"
                            enter-from-class="opacity-0 h-1/2"
                            enter-to-class="opacity-100 h-full"
                            leave-active-class="transition ease-in duration-100"
                            leave-from-class="opacity-100 h-full"
                            leave-to-class="opacity-0 h-1/2"
                        >
                            <div v-show="accountDrop">
                                <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                                    <a href="user_settings" class="dropdown-item cursor-pointer">
                                        <i class="fas fa-cog text-primary"></i>
                                        Settings
                                    </a>
                                <div class="dropdown-divider"></div>
                                    <a class="dropdown-item cursor-pointer" @click="logout">
                                        <i class="fas fa-cog text-primary"></i>
                                        Logout
                                    </a>
                                </div>
                            </div>
                        </Transition>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- partial -->
        <div class="container-fluid page-body-wrapper" id="container-navbar">
            <div class="theme-setting-wrapper" id="navbar-2">
                <!-- <div id="settings-trigger"><i class="fas fa-fill-drip"></i></div> -->
                <div id="theme-settings" class="settings-panel">
                <i class="settings-close fa fa-times"></i>
                <p class="settings-heading">SIDEBAR SKINS</p>
                <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Light</div>
                <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark</div>
                <p class="settings-heading mt-2">HEADER SKINS</p>
                <div class="color-tiles mx-0 px-4">
                    <div class="tiles primary"></div>
                    <div class="tiles success"></div>
                    <div class="tiles warning"></div>
                    <div class="tiles danger"></div>
                    <div class="tiles info"></div>
                    <div class="tiles dark"></div>
                    <div class="tiles default"></div>
                </div>
                </div>
            </div>
           
            <!-- partial -->
            <!-- partial:../../partials/_sidebar.html -->
            
            <div class="sidebar sidebar-offcanvas " id="navbar-3"> 
                <nav class="sidebar sidebar-offcanvas fixed bg-red-100 bottom-0 top-0 mt-16 hover:overflow-y-scroll overflow-y-hidden " id="sidebar">
                    <ul class="nav ps">
                        <!-- fixed h-full hover:overflow-y-scroll -->
                        <li class="nav-item nav-profile">
                            <div class="nav-link">
                            <div class="profile-image">
                                <img :src="'/images/default.jpg'"  alt="image"/>
                            </div>
                            <div class="profile-name">
                                <p class="name">
                                Welcome {{ details.firstname }}!
                                </p>
                                <!-- <p class="designation">
                                Super Admin
                                </p> -->
                            </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/dashboard">
                            <i class="fa fa-home menu-icon">
                                <HomeIcon fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5" />
                            </i>
                            <span class="menu-title">Dashboard</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" @click="masterfileDrop = !masterfileDrop" href="#" aria-expanded="false" aria-controls="page-layouts">
                                <i class="fab fa-trello menu-icon">
                                    <FolderIcon fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5" />
                                </i>
                                <span class="menu-title">Masterfile</span>
                                <i class="menu-arrow">
                                    <ChevronRightIcon fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4"/>
                                </i>
                            </a>
                            <Transition
                                enter-active-class="transition ease-out duration-250"
                                enter-from-class="opacity-0 h-1/2"
                                enter-to-class="opacity-100 h-full"
                                leave-active-class="transition ease-in duration-100"
                                leave-from-class="opacity-100 h-full"
                                leave-to-class="opacity-0 h-1/2"
                            >
                                <div class="" id="page-layouts" v-show="masterfileDrop">
                                    <ul class="nav flex-column sub-menu">
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/department">Department</a></li>
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/business_unit">Business Unit</a></li>
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/holiday_type">Holiday Type</a></li>
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/business_calendar">Business Calendar</a></li>
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/leave_types">Leave Types</a></li>
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/work_schedule">Work Schedule</a></li>
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/allowance">Allowance</a></li>
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/evaluation">Evaluation Type</a></li>
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/employee_progression">Employee Progression</a></li>
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/employee_status">Employee Status</a></li>
                                        <!-- <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/holidays">Holidays</a></li> -->
                                    </ul>
                                </div>
                            </Transition>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" @click="employeeprofileDrop = !employeeprofileDrop" href="#" aria-expanded="false" aria-controls="page-layouts">
                                <i class="fab fa-trello menu-icon">
                                    <UsersIcon fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5" />
                                </i>
                                <span class="menu-title">Employee Profile</span>
                                <i class="menu-arrow">
                                    <ChevronRightIcon fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4"/>
                                </i>
                            </a>
                            <Transition
                                enter-active-class="transition ease-out duration-250"
                                enter-from-class="opacity-0 h-1/2"
                                enter-to-class="opacity-100 h-full"
                                leave-active-class="transition ease-in duration-100"
                                leave-from-class="opacity-100 h-full"
                                leave-to-class="opacity-0 h-1/2"
                            >
                                <div class="" id="page-layouts" v-show="employeeprofileDrop">
                                    <ul class="nav flex-column sub-menu">
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/new_employee/personal_info/new">New Employee</a></li>
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/prof_profile/prof_index">Professional Profile</a></li>
                                    </ul>
                                </div>
                            </Transition>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" @click="timemanagementDrop = !timemanagementDrop" href="#" aria-expanded="false" aria-controls="page-layouts">
                                <i class="fab fa-trello menu-icon">
                                    <ClockIcon fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5" />
                                </i>
                                <span class="menu-title">Time Management</span>
                                <i class="menu-arrow">
                                    <ChevronRightIcon fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4"/>
                                </i>
                            </a>
                            <Transition
                                enter-active-class="transition ease-out duration-250"
                                enter-from-class="opacity-0 h-1/2"
                                enter-to-class="opacity-100 h-full"
                                leave-active-class="transition ease-in duration-100"
                                leave-from-class="opacity-100 h-full"
                                leave-to-class="opacity-0 h-1/2"
                            >
                                <div class="" id="page-layouts" v-show="timemanagementDrop">
                                    <ul class="nav flex-column sub-menu">
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/scheduling">Scheduling</a></li>
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/leave_app/report/daily/time/record">Daily Time Record</a></li>
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/leave_app/apply/new">Leave Application</a></li>
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/time_sheet/from/to">Time Sheet</a></li>
                                    </ul>
                                </div>
                            </Transition>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="collapse" @click="reportDrop = !reportDrop" href="#" aria-expanded="false" aria-controls="page-layouts">
                                <i class="fab fa-trello menu-icon">
                                    <NewspaperIcon fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5" />
                                </i>
                                <span class="menu-title">Reports</span>
                                <i class="menu-arrow">
                                    <ChevronRightIcon fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4"/>
                                </i>
                            </a>
                            <Transition
                                enter-active-class="transition ease-out duration-250"
                                enter-from-class="opacity-0 h-1/2"
                                enter-to-class="opacity-100 h-full"
                                leave-active-class="transition ease-in duration-100"
                                leave-from-class="opacity-100 h-full"
                                leave-to-class="opacity-0 h-1/2"
                            >
                                <div class="" id="page-layouts" v-show="reportDrop">
                                    <ul class="nav flex-column sub-menu">
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/reports/employee_records">Employee Records</a></li>
                                        <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="/leave_app/from/to/employee">Leave Report</a></li>
                                    </ul>
                                </div>
                            </Transition>
                        </li>
                    </ul>
                </nav>
            </div>
            <slot></slot>

          
        </div>
       
    </div>
  
</template>