package bean;


/**
 * 产品类
 * @Author Mr.A
 * @Description //TODO lenovo
 * @Param
 * @return
 **/
public class Product {
    private Integer pId;
    private String pName;
    private String pDescription;
    private Double pPrice;
    private String pImage;

    public Product() {
    }

    public Product(Integer pId, String pName, String pDescription, Double pPrice, String pImage) {
        this.pId = pId;
        this.pName = pName;
        this.pDescription = pDescription;
        this.pPrice = pPrice;
        this.pImage = pImage;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDescription() {
        return pDescription;
    }

    public void setpDescription(String pDescription) {
        this.pDescription = pDescription;
    }

    public Double getpPrice() {
        return pPrice;
    }

    public void setpPrice(Double pPrice) {
        this.pPrice = pPrice;
    }

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pId=" + pId +
                ", pName='" + pName + '\'' +
                ", pDescription='" + pDescription + '\'' +
                ", pPrice=" + pPrice +
                ", pImage='" + pImage + '\'' +
                '}';
    }
}
