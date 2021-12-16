package bean;


/**
 * 用户类
 *
 * @Author Mr.A
 * @Description //TODO lenovo
 * @Param
 * @return
 **/
public class User {

    private Integer uId;
    private String uName;
    private String uPwd;
    private Integer uAuthor;


    public User() {
    }

    public User(String uName, String uPwd) {
        this.uName = uName;
        this.uPwd = uPwd;
    }

    public User(Integer uId, String uName, String uPwd, Integer uAuthor) {
        this.uId = uId;
        this.uName = uName;
        this.uPwd = uPwd;
        this.uAuthor = uAuthor;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPwd() {
        return uPwd;
    }

    public void setuPwd(String uPwd) {
        this.uPwd = uPwd;
    }

    public Integer getuAuthor() {
        return uAuthor;
    }

    public void setuAuthor(Integer uAuthor) {
        this.uAuthor = uAuthor;
    }

    @Override
    public String toString() {
        return "User{" +
                "uId=" + uId +
                ", uName='" + uName + '\'' +
                ", uPwd='" + uPwd + '\'' +
                ", uAuthor='" + uAuthor + '\'' +
                '}';
    }
}
