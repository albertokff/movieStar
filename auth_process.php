<?php

    require_once("globals.php");
    require_once("db.php");
    require_once("models/User.php");
    require_once("models/Message.php");
    require_once("dao/UserDAO.php");

    $message = new Message($BASE_URL);

    $userDao = new UserDAO($conn, $BASE_URL);

    $type = filter_input(INPUT_POST, "type");

    if($type === "register") {

        $name = filter_input(INPUT_POST, "name");
        $lastname = filter_input(INPUT_POST, "lastname");
        $email = filter_input(INPUT_POST, "email");
        $password = filter_input(INPUT_POST, "password");
        $confirmpassword = filter_input(INPUT_POST, "confirmpassword");

        if ($name && $lastname && $email && $password) {

            if ($password === $confirmpassword) {

                if ($userDao->findByEmail($email) === false) {
                    
                    $user = new User();

                    $userToken = $user->generateToken();
                    $finalPassword = $user->generatePassword($password);

                    $user->name = $name;
                    $user->lastname = $lastname;
                    $user->email = $email;
                    $user->password = $finalPassword;
                    $user->token = $userToken;

                    $auth = true;

                    $userDao->create($user, $auth);

                } else {
                    $message->setMessage("E-mail já está sendo utilizado por outro usuário. Tente outro!", "error", "back");
                }

            } else {
                $message->setMessage("Atenção! As senhas digitadas não correspondem.", "error", "back");
            }
        } else {
            $message->setMessage("Por favor, preencha todos os campos.", "error", "back");
        }

    } else if ($type === "login") {
        
        $email = filter_input(INPUT_POST, "email");
        $password = filter_input(INPUT_POST, "password");

        if ($userDao->authenticateUser($email, $password)) {

        } else {
            $message->setMessage("Usuário e/ou senha incorretos.", "error", "back");
        }

    } else {
        $message->setMessage("Informações inválidas!", "error", "index.php");
    }
