package LCXMB.pojo;

public class User_login {
    private String username;

    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public User_login(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User_login() {
    }
}