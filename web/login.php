<?php
/**
 * Example Application
 *
 * @package Example-application
 */
require_once "../configuration/config.php";
require_once "../configuration/dbconfig.php";

session_start();
if (isset($_SESSION['User'])){
    header("Location: index.php");
    exit();
}
if (isset($_GET['login'])) {
    $errMsg = '';
    $msg = '';
    // Get data from FORM
    $username = $_GET['username'];
    $password = $_GET['password'];

    if ($username == '')
        $errMsg = 'Please enter username <br/>';
    if ($password == '')
        $errMsg .= 'Please enter password';
    if ($errMsg == '') {

        $query = "SELECT User_ID, First_Name, Email, Last_Name, `Password` FROM user WHERE Email = '$username';";

        $statement = $pdo->prepare($query);

        $statement->execute();

        try {
            $row = $statement->fetch(PDO::FETCH_ASSOC);
            if (($row['Email'] == $username) && ($password == $row['Password'])) {
                $_SESSION['User'] = $row['User_ID'];
                $msg = "Log in successful!";
                header("Location: login.php");
            } else {
                $errMsg = "Incorrect username or password";
            }
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        }

    }


}
$pdo = null;


$smarty->assign('errMsg', $errMsg);
$smarty->assign('msg', $msg);

$smarty->display('login.tpl');