<?
function adminer_object() {
  
  class AdminerSoftware extends Adminer {
    
    function name() {
      // custom name in title and heading
      return 'Software';
    }
    
    function login($login, $password) {
      // validate user submitted credentials
      return ($login == 'root' && $password == '');
    }
    
  }
  
  return new AdminerSoftware;
}
include "./adminer.php";
?>