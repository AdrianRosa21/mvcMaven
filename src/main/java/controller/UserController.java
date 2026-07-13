package controller;

import model.User;

public class UserController {

    public User getUser(String username) {

        return new User(
                username,
                "p4$$w0rd123"
        );
    }
}