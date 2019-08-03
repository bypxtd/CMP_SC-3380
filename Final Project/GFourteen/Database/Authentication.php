<?php

class Authentication extends Entity
{
    protected $userID;
    protected $password;    // HASHED!
    protected $roles;

    /**
     * consider using open() or init() instead of the constructor directly
     */
    public function __construct($hashedPassword, $roles, $userID)
    {
        $this->password = $hashedPassword;
        $this->roles = $roles;
        $this->userID = $userID;
    }

    public function getPK()
    {
        return $this->userID;
    }

    /**
     * initializes a new authentication object
     *
     * @param   string      $plaintextPassword  password
     * @param   string      $roles              role
     * @param   string      $userID             user id
     * @param   string[]    $rolesArray         array of roles to match against
     * @return  Authentication|boolean          a new authentication object that's not in the database already
     *                                          or false if the userID is in use
     */
    public static function init($plaintextPassword, $roles, $userID, $rolesArray = array('c', 'e', 'a'))
    {
        // attempt open existing auth
        $auth = self::open($userID);

        // if we get a result, the user id is already in use
        if ($auth !== false) {
            return false;
        }

        // hash password
        $hashedPassword = password_hash($plaintextPassword, PASSWORD_DEFAULT);
        unset($plaintextPassword);

        // validate roles
        if (!in_array($roles, $rolesArray)) {
            return false;
        }

        return new self($hashedPassword, $roles, $userID);
    }

    public function setRoles($roles)
    {
        $this->roles = $roles;
    }

    public function setPassword($oldPassword, $newPassword, $newPasswordConfirm) {
        // verify
        if (!password_verify($oldPassword, $this->password)) {
            return false;
        } else {
            unset($oldPassword);
        }

        // hash the new password
        $newHash = password_hash($newPassword, PASSWORD_DEFAULT);
        unset($newPassword);

        // verify confirmation
        if (!password_verify($newPasswordConfirm, $newHash)) {
            return false;
        } else {
            unset($newPasswordConfirm);
        }

        // set new
        $this->password = $newHash;

        return true;
    }

    /**
     * validates input vs. own properties
     */
    public function validate($plaintextPassword, $roles = null)
    {
        if (empty($plaintextPassword)) {
            return false;
        }

        // invalid password
        if (!password_verify($plaintextPassword, $this->password)) {
            return false;
        }

        // invalid roles (if set)
        if (!empty($roles)) {
            if ($roles !== $this->roles) {
                return false;
            }
        }

        // good!
        return true;
    }

    public function __debugInfo()
    {
        return array(
            'Password' => null, // don't show password hash
            'Roles' => $this->roles,
            'UserID' => $this->userID
        );
    }
}
