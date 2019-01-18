package hello.bookPojos;

public class Contact {

    private String mail;
    private String surname;
    private String name;
    private String gender;
    private String prefix;
    private String mobile;

    public Contact(){}


    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }


    @Override
    public String toString() {
        return "Contact{" +
                "mail='" + mail + '\'' +
                ", surname='" + surname + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", prefix='" + prefix + '\'' +
                ", mobile='" + mobile + '\'' +
                '}';
    }
}
