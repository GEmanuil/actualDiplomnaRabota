package johnatanasov.diplomawork;

import java.io.Serializable;

public class regInfoClass implements Serializable {
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    private String teachStud;

    public regInfoClass() {
        this.firstname = "Eman";
        this.lastname = "Geor";
        this.email = "em@abv.bg";
        this.password = "1234";
        this.teachStud = "student";
    }
    public regInfoClass(String firstname, String lastname, String email, String password, String teachStud) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
        this.teachStud = teachStud;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public String getTeachStud(){
        return teachStud;
    }
    public void setTeachStud(String teachStud){
        this.teachStud = teachStud;
    }
}
