<?php

class DbOperation
{
    private $conn;
    private $arr = array();

    //Constructor
    function __construct()
    {
        require_once dirname(__FILE__) . '/Constants.php';
        require_once dirname(__FILE__) . '/DbConnect.php';
        // opening db connection
        $db = new DbConnect();
        $this->conn = $db->connect();
    }

    //Function to create a new user
    public function createUser($username, $pass, $email, $name, $surname, $phone)
    {
        if (!$this->isUserExist($username, $email, $phone)) {
            $password = md5($pass);
            $stmt = $this->conn->prepare("INSERT INTO users (username, password, email, name, surname, phone) VALUES (?, ?, ?, ?, ?,?)");
            $stmt->bind_param("ssssss", $username, $password, $email, $name, $surname, $phone);
            if ($stmt->execute()) {
                return USER_CREATED;
            } else {
                return USER_NOT_CREATED;
            }
        } else {
            return USER_ALREADY_EXIST;
        }
    }


    private function isUserExist($username, $email, $phone)
    {
        $stmt = $this->conn->prepare("SELECT id FROM users WHERE username = ? OR email = ? OR phone = ?");
        $stmt->bind_param("sss", $username, $email, $phone);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }

    public function userLogin($username, $pass)
    {
        $password = md5($pass);
        $stmt = $this->conn->prepare("SELECT id FROM users WHERE username = ? AND password = ?");
        $stmt->bind_param("ss", $username, $password);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }

    /*
     * After the successful login we will call this method
     * this method will return the user data in an array
     * */

    public function getUserByUsername($username)
    {
        $stmt = $this->conn->prepare("SELECT id, username, email, phone FROM users WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->bind_result($id, $uname, $email, $phone);
        $stmt->fetch();
        $user = array();
        $user['id'] = $id;
        $user['username'] = $uname;
        $user['email'] = $email;
        $user['phone'] = $phone;
        return $user;
    }

    public function getPC()
    {
        $result = array();
        $stmt = mysqli_query($this->conn,"SELECT *  FROM pc");
        //$sql = "SELECT *  FROM pc";
        //$stmt = $this->conn->prepare(sql);
        while ($row = mysqli_fetch_object($stmt)) {
            array_push($result, $row);
        }
        return $result;
    }

    public function createOrder($id_pc, $id_order)
    {
        $stmt = $this->conn->prepare("INSERT INTO order_pc (id_pc, id_order) VALUES (?, ?)");
        $stmt->bind_param("ssssss", $username, $password, $email, $name, $surname, $phone);
        if ($stmt->execute()) {
            return ORDER_CREATED;
        } else {
            return ORDER_NOT_CREATED;
        }
    }



}