<?php

require_once '../include/DbHandler.php';
require_once '../include/PassHash.php';
require '.././libs/Slim/Slim.php';

\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();

// User id from db - Global Variable
$user_id = NULL;

/**
 * Adding Middle Layer to authenticate every request
 * Checking if the request has valid api key in the 'Authorization' header
 */
function authenticate(\Slim\Route $route) {
    // Getting request headers
    $headers = apache_request_headers();
    $response = array();
    $app = \Slim\Slim::getInstance();

    // Verifying Authorization Header
    if (isset($headers['Authorization'])) {
        $db = new DbHandler();

        // get the api key
        $api_key = $headers['Authorization'];
        // validating api key
        if (!$db->isValidApiKey($api_key)) {
            // api key is not present in users table
            $response["error"] = true;
            $response["message"] = "Access Denied. Invalid Api key";
            echoRespnse(401, $response);
            $app->stop();
        } else {
            global $user_id;
            // get user primary key id
            $user_id = $db->getUserId($api_key);
        }
    } else {
        // api key is missing in header
        $response["error"] = true;
        $response["message"] = "Api key is misssing";
        echoRespnse(400, $response);
        $app->stop();
    }
}



/**
 * User Login
 * url - /login
 * method - POST
 * params - email, password
 */
$app->post('/login', function() use ($app) {
    // check for required params
    verifyRequiredParams(array('email', 'password'));

    // reading post params
    $email = $app->request()->post('email');
    $password = $app->request()->post('password');
    $response = array();

    $db = new DbHandler();
    // check for correct email and password
	
    if ($db->checkLogin($email, $password)) { 
        $userid=$db->returnID($email);
        $empID=$db->returnEmp($email);
        $role=$db->returnuserRole($email);
        $response['error'] = false;
        $response['userId'] = $userid;
        $response['emp'] = $empID;
        $response['role'] = $role;

    } else {
        // user credentials are wrong
        $response['error'] = true;
        $response['message'] = 'Login failed. Incorrect credentials';
    }

    echoRespnse(200, $response);
});

$app->post('/jcard', function()use ($app) {
    verifyRequiredParams(array('jobcard'));
    $jobcard=$app->request()->post('jobcard');
    $response = array();
    $db = new DbHandler();
    $stat=$db->checkJobCardValid($jobcard);
    if(!$stat){
        $result= $db->getJCardCuctomer($jobcard);
        if($result!=NULL) {
            $response["error"] = false;
            $response["message"] = "good details";
            $response["client"] = array();
            while ($task = $result->fetch_assoc()) {
                $tmp = array();
                $tmp["name"] = $task["name"];
                $tmp["phone"] = $task["tel"];
                $tmp["id"] = $task["idnum"];
                $tmp["jobcard"] = $jobcard;
                $tmp["backuprequired"] =$task ["backuprequired"];
                $tmp["error"] = false;
                array_push($response["client"], $tmp);

            }
            echoRespnse(200, $response);
        }
        else{
            $response["error"] = true;
            $response["message"] = "jobcard has no details";
            echoRespnse(200, $response);
        }
    }
    else{
        $response["error"] = true;
        $response["message"] = "Jobcard is in use";
        echoRespnse(200, $response);
    }

});
$app->post('/createJobcard', function()use ($app) {
    verifyRequiredParams(array('location','phone','sname','sphone','charges'
    ,'user','emp'));
    $response = array();
    $model=$app->request()->post('model');
    $chasis=$app->request()->post('chasis');
    $color=$app->request()->post('color');
    $location=$app->request()->post('location');
    $engine=$app->request()->post('engine');
    $name=$app->request()->post('name');
    $phone=$app->request()->post('phone');
    $sname=$app->request()->post('sname');
    $sphone=$app->request()->post('sphone');
    $charges=$app->request()->post('charges');
    $inst=$app->request()->post('inst');
    $reg=$app->request()->post('reg');
    $emp=$app->request()->post('emp');
    $user=$app->request()->post('user');
    $db = new DbHandler();
    $result=$db->createJobCard( $model,$chasis,$color,$location,$engine,$name,$phone,$sname, $sphone,$charges,$reg, $emp,$user,$inst);

    if ($result != 'error') {
        $response["error"] = false;
        $response["message"] = $result;
        echoRespnse(200, $response);
    } else {
        $response["error"] = true;
        $response["message"] = $result;
        echoRespnse(200, $response);
    }
});
$app->post('/validate', function()use ($app) {
    verifyRequiredParams(array('model','chasis','color','location','imei','device','jobcard','user'));
    $response = array();
    $jobcard=$app->request()->post('jobcard');
    $model=$app->request()->post('model');
    $chasis=$app->request()->post('chasis');
    $color=$app->request()->post('color');
    $location=$app->request()->post('location');
    $imei=$app->request()->post('imei');
    $device=$app->request()->post('device');
    $user=$app->request()->post('user');
    $bimei=$app->request()->post('bimei');
    $bdevice=$app->request()->post('bdevice');
    $msisdn=$app->request()->post('msisdn');
    $emp=$app->request()->post('emp');
    $db = new DbHandler();

    if(!$db->validCode($imei)){
        $response["error"] = true;
        $response["message"] = "IMEI number does not exist";
        echoRespnse(200, $response);
    }else if(!$db->validCode($device)){
        $response["error"] = true;
        $response["message"] = "Device number does not exist";
        echoRespnse(200, $response);
    }else{
        $deviceStat=$db->checkIssueDevice($device);
        $imeiStat=$db->checkIssueImei($imei);
        if($imeiStat==1 || $imeiStat==3){

            $response["error"] = true;
            $response["message"] = "Imei is Invalid";
            echoRespnse(200, $response);
        }

        else if($deviceStat==1 || $deviceStat==3){

            $response["error"] = true;
            $response["message"] = "device Number  is Invalid";
            echoRespnse(200, $response);

        }
        else
        {
            $result=$db->createTracker($jobcard,$model,$chasis,$color, $location,$imei,$device,$user,$bimei,$bdevice,$msisdn,$emp);
            if ($result != 'error') {
                $response["error"] = false;
                $response["message"] =$result;
                $response["trackerId"] = $result;
                echoRespnse(200, $response);
            } else {
                $response["error"] = true;
                $response["message"] = "Tracker was not created";
                echoRespnse(200, $response);
            }
        }



    }






});




function verifyRequiredParams($required_fields) {
    $error = false;
    $error_fields = "";
    $request_params = array();
    $request_params = $_REQUEST;
    // Handling PUT request params
    if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
        $app = \Slim\Slim::getInstance();
        parse_str($app->request()->getBody(), $request_params);
    }
    foreach ($required_fields as $field) {
        if (!isset($request_params[$field]) || strlen(trim($request_params[$field])) <= 0) {
            $error = true;
            $error_fields .= $field . ', ';
        }
    }

    if ($error) {
        // Required field(s) are missing or empty
        // echo error json and stop the app
        $response = array();
        $app = \Slim\Slim::getInstance();
        $response["error"] = true;
        $response["message"] = 'Required field(s) ' . substr($error_fields, 0, -2) . ' is missing or empty';
        echoRespnse(400, $response);
        $app->stop();
    }
}

/**
 * Validating email address
 */
function validateEmail($email) {
    $app = \Slim\Slim::getInstance();
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $response["error"] = true;
        $response["message"] = 'Email address is not valid';
        echoRespnse(400, $response);
        $app->stop();
    }
}

/**
 * Echoing json response to client
 * @param String $status_code Http response code
 * @param Int $response Json response
 */
function echoRespnse($status_code, $response) {
    $app = \Slim\Slim::getInstance();
    // Http response code
    $app->status($status_code);

    // setting response content type to json
    $app->contentType('application/json');

    echo json_encode($response);
}

$app->run();
?>