<?php

class DbHandler
{	
    private $conn;

    function __construct()
    {
        require_once dirname(__FILE__) . '/DbConnect.php';
		require_once dirname(__FILE__) . '/PassHash2.php';
        // opening db connection
        $db = new DbConnect();
        $this->conn = $db->connect();
    }

    public function createUser($name, $email, $password)
    {
        require_once 'PassHash.php';
        $response = array();

        // First check if user already existed in db
        if (!$this->isUserExists($email)) {
            // Generating password hash
            $password_hash = PassHash::hash($password);

            // Generating API key
            $api_key = $this->generateApiKey();

            // insert query
            $stmt = $this->conn->prepare("INSERT INTO users(name, email, password_hash, api_key, status) values(?, ?, ?, ?, 1)");
            $stmt->bind_param("ssss", $name, $email, $password_hash, $api_key);

            $result = $stmt->execute();

            $stmt->close();

            // Check for successful insertion
            if ($result) {
                // User successfully inserted
                return USER_CREATED_SUCCESSFULLY;
            } else {
                // Failed to create user
                return USER_CREATE_FAILED;
            }
        } else {
            // User with same email already existed in the db
            return USER_ALREADY_EXISTED;
        }

        return $response;
    }

    /**
     * Checking user login
     * @param String $email User login email id
     * @param String $password User login password
     * @return boolean User login status success/fail
     */
    public function checkLogin($email, $password)
    {
        // fetching user by email
        $stmt = $this->conn->prepare("SELECT UserPass FROM users WHERE UserName = ?");

        $stmt->bind_param("s", $email);

        $stmt->execute();

        $stmt->bind_result($password_hash);

        $stmt->store_result();

        if ($stmt->num_rows > 0) {
            // Found user with the email
            // Now verify the password

            $stmt->fetch();

            $stmt->close();
			 
			 // Right password returns true.
			$result = PassHash2::verify_password($password, $password_hash);
			if ($result === TRUE)
			{
				  echo "Correct password: pass\n";
				return TRUE;
			}
			else
			{
				 echo "Wrong password: FAIL ".$password_hash."\n";
				return FALSE;
			}
	
            //if (strcmp($password_hash, $password) == 0) {
                // User password is correct				
	            // echo "Correct password ";
              //  return TRUE;
           // } else {
                // user password is incorrect
			//	echo "Wrong password ".$password_hash;
               // return FALSE;
           // }
        } else {
            $stmt->close();

            // user not existed with the email
            return FALSE;
        }
    }

    /**
     * Checking for duplicate user by email address
     * @param String $email email to check in db
     * @return boolean
     */
    private function isUserExists($email)
    {
        $stmt = $this->conn->prepare("SELECT id from users WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows;
        $stmt->close();
        return $num_rows > 0;
    }
    public function returnID($email)
    {
        $stmt = $this->conn->prepare("SELECT id from users WHERE UserName = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->bind_result($userid);
        $stmt->fetch();
//        $stmt->store_result();
        $stmt->close();
        return $userid;
    }
    public function returnEmp($email)
    {
        $stmt = $this->conn->prepare("SELECT employee from users WHERE UserName = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->bind_result($employee);
        $stmt->fetch();
//        $stmt->store_result();
        $stmt->close();
        return $employee;
    }
    public function returnuserRole($email)
    {
        $stmt = $this->conn->prepare("SELECT RoleId from users WHERE UserName = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->bind_result($role);
        $stmt->fetch();
//        $stmt->store_result();
        $stmt->close();
        return $role;
    }
    public function getUserByEmail($email)
    {
        $stmt = $this->conn->prepare("SELECT name, email, api_key, status, created_at FROM users WHERE email = ?");
        $stmt->bind_param("s", $email);
        if ($stmt->execute()) {
            // $user = $stmt->get_result()->fetch_assoc();
            $stmt->bind_result($name, $email, $api_key, $status, $created_at);
            $stmt->fetch();
            $user = array();
            $user["name"] = $name;
            $user["email"] = $email;
            $user["api_key"] = $api_key;
            $user["status"] = $status;
            $user["created_at"] = $created_at;
            $stmt->close();
            return $user;
        } else {
            return NULL;
        }
    }

    public function getApiKeyById($user_id)
    {
        $stmt = $this->conn->prepare("SELECT api_key FROM users WHERE id = ?");
        $stmt->bind_param("i", $user_id);
        if ($stmt->execute()) {
            // $api_key = $stmt->get_result()->fetch_assoc();
            // TODO
            $stmt->bind_result($api_key);
            $stmt->close();
            return $api_key;
        } else {
            return NULL;
        }
    }


    public function getUserId($api_key)
    {
        $stmt = $this->conn->prepare("SELECT id FROM users WHERE api_key = ?");
        $stmt->bind_param("s", $api_key);
        if ($stmt->execute()) {
            $stmt->bind_result($user_id);
            $stmt->fetch();
            // TODO
            // $user_id = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            return $user_id;
        } else {
            return NULL;
        }
    }


    public function isValidApiKey($api_key)
    {
        $stmt = $this->conn->prepare("SELECT id from users WHERE api_key = ?");
        $stmt->bind_param("s", $api_key);
        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows;
        $stmt->close();
        return $num_rows > 0;
    }

    /**
     * Generating random Unique MD5 String for user Api key
     */
    private function generateApiKey()
    {
        return md5(uniqid(rand(), true));
    }


    public function
    checkJobCardValid($jobcard){
        $stmt = $this->conn->prepare("SELECT jobcard from tracker WHERE  jobcard = ?");
        $stmt->bind_param("s", $jobcard);
        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows;
        $stmt->close();
        return $num_rows > 0;
    }
public function createJobCard($model,$chasis,$color,$location,$engine,$name,$phone,$sname, $sphone,$charges,$reg, $emp,$user,$inst)
{
    $stmt = $this->conn->prepare("INSERT INTO jobcard(createDate,txnDate,createdBy,
customerName,customerPhone,chassisno,
                      engineno,color,location,amountcharged,carModel,approved,existingCustomer,
closed,maintenance,vatinclusive,totalCharges,invoiceFinancier,transferjobcard,contactPersonCommission,carReg,salesrep,contactpersonName,contactpersonMobile)
                    VALUES(NOW(),Now(),?,?,?,?,?,?,?,?,?
                      ,0,0,0,0,1,?,0,0,?,?,?,?,?);");
    if($inst==NULL){
    $inst=0;
}



    if ($stmt->bind_param("sssssssssssssss" ,$user, $name, $phone, $chasis, $engine,
        $color, $location, $charges,$model,$charges,$inst,$reg,$emp,$sname,$sphone)
    ) {
        if ($stmt->execute()) {
            $insertNo = $stmt->insert_id;

            return $insertNo;


        }else{

           echo "hhh". $stmt->error;
            return "error".$stmt->error;
        }

    }
}
public function getJCardCuctomer($jobcard){
    $stmt = $this->conn->prepare("SELECT customer from jobcard WHERE approved=1 AND id = ? ");
    $stmt->bind_param("s", $jobcard);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($customer);
    $stmt->fetch()[$customer];
    if($customer>0){
        $stmt=$this->conn->prepare(" SELECT customer.company as name,customer.idNo as idnum,customer.Mobile as tel,jobcard.backuprequired from customer,jobcard where customer.id=? and jobcard.id=?");
        $stmt->bind_param("ss", $customer,$jobcard);
        $stmt->execute();
        $details = $stmt->get_result();
        $stmt->store_result();
    }
    else{

        $stmt=$this->conn->prepare("SELECT jobcard.customerName as name,jobcard.customerPhone as tel,jobcard.customerID as idnum,jobcard.backuprequired from jobcard where jobcard.id=?");
        $stmt->bind_param("s", $jobcard);
        $stmt->execute();
        $details = $stmt->get_result();
        $stmt->store_result();


    }

    return $details;
}

    public function updateCustomerDetails($jobcard)
    {

        $stmt = $this->conn->prepare("SELECT customer from jobcard where id=? ");
        $stmt->bind_param("i", $jobcard);
        $stmt->execute();
        $details = $stmt->get_result();
        $stmt->store_result();
        if($stmt->num_rows < 1) {
            $stmt = $this->conn->prepare("UPDATE tracker JOIN jobcard ON jobcard.id =? and tracker.jobcard=? SET
            tracker.supplier = jobcard.supplier,
            tracker.amountCharged = jobcard.amountcharged,
            tracker.commission=jobcard.contactPersonCommission");
            $stmt->bind_param("ii", $jobcard,$jobcard);
            if( $stmt->execute()){
                return $stmt->insert_id;
            }
            else{
                return 'error' ;
//                    $stmt->error;
            }
        }
        else{
            return 022;
        }
        $stmt->close();

    }

    public function createTracker($jobcard,$model,$chasis,$color, $location,$imei,$device,$user,$bimei,$bdevice,$msisdn,$emp)
    {
        $stmt = $this->conn->prepare("INSERT INTO tracker (jobcard, location, imeino, deviceno, model, chassisno, color, createDate, createdBy, txnDate,
            backupimeino, backupdeviceno,mobileapp,appMSISDN,installer,financier )
          VALUES(?,?,?,?,?,?,?,NOW(),?,NOW(),?,?,1,?,?,?)");
        if($stmt->bind_param("ssssssssssss", $jobcard, $location, $imei, $device, $model,$chasis,$color,$user,$bimei,$bdevice,$msisdn,$emp,("select jobcard.finacier from jobcard where jobcard=?"))){
          if( $stmt->execute()){
              $insertNo=$stmt->insert_id;
              $response=$this->updateCustomerDetails($jobcard);
              if($response!='error'){
                  return $insertNo;
              }
              else{
                  return $insertNo;
              }

          }
            else{
//                $stmt->error;
                return 'error';
            }

        }
        else{
            return 'error';
        }

        $stmt->close();
    }

public function validCode($code){
    $stmt = $this->conn->prepare("SELECT Serialno from deviceserial WHERE Serialno = ?");
    $stmt->bind_param("s", $code);
    $stmt->execute();
    $stmt->store_result();
    $num_rows = $stmt->num_rows;
    $stmt->close();
    return $num_rows > 0;
}
    public function checkJobimeiExist($code){
        $stmt = $this->conn->prepare("SELECT imeino from tracker WHERE imeino = ?");
        $stmt->bind_param("s", $code);
        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows;
        $stmt->close();
        return $num_rows > 0;
    }
    public function checkJobDeviceExist($code){
        $stmt = $this->conn->prepare("SELECT deviceno from tracker WHERE deviceno = ?");
        $stmt->bind_param("s", $code);
        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows;
        $stmt->close();
        return $num_rows > 0;
    }

    public function checkIssueDevice($code){
        $stmt = $this->conn->prepare("SELECT ifnull((SUM(devicecard.qtyin)-SUM(devicecard.qtyout)),-1)
                        from devicecard,deviceserial,inventory,devicetype
                        WHERE deviceserial.Serialno=? and devicecard.device=(select deviceserial.id from
                        deviceserial WHERE deviceserial.Serialno=?) and deviceserial.Devicefamily=inventory.id
                         and inventory.device=devicetype.id
                         and devicetype.id=2");
        $stmt->bind_param("ss", $code,$code);
        $stmt->execute();
        $stmt->store_result();
        $stmt->bind_result($count);
        $stmt->fetch()[$count];
//        echo "countDvice : ".$count.'</br>';
        if($count==0){
            if($this->checkJobDeviceExist($code)){
                return 3;
            }
            else{
                return 2;
            }
        }
        else{
//            echo "null devices count".'</br>';
            return 3;
        }
        if($count==1){
            //device not issued
            return 1;
        }
    }





    public function checkIssueImei($code){

        $stmt = $this->conn->prepare("SELECT ifnull((SUM(devicecard.qtyin)-SUM(devicecard.qtyout)),-1)
                        from devicecard,deviceserial,inventory,devicetype
                        WHERE deviceserial.Serialno=? and devicecard.device=(select deviceserial.id from
                        deviceserial WHERE deviceserial.Serialno=?) and deviceserial.Devicefamily=inventory.id
                         and inventory.device=devicetype.id
                         and devicetype.id=1");
        $stmt->bind_param("ss", $code,$code);
        $stmt->execute();
        $stmt->store_result();
        $stmt->bind_result($count);
        $stmt->fetch()[$count];
//        echo "countImei: ".$count.'</br>';
        if($count==0){
            if($this->checkJobimeiExist($code)){
                return 3;
            }
            else{
                return 2;
            }
        }
        else{
//            echo "null imei count".'</br>';
            return 3;
        }
        if($count==1){
            //device not issued
            return 1;
        }
    }




}

?>
