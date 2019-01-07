package com.example.demoboot.bean;

public class Item {
    private int id;
    private int no;
    private String value;
    private String address;
    private String stock;
    private String info;
    private String image;
    private String produceAddress;
    private String brand;
    private String name;
    private String kind;
    private String onindex;
    private String ishot;

    public String getOnindex() {
        return onindex;
    }

    public void setOnindex(String onindex) {
        this.onindex = onindex;
    }

    public String getIsfeatured() {
        return ishot;
    }

    public void setIsfeatured(String isfeatured) {
        this.ishot = isfeatured;
    }

    public int getId() {
        return id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getProduceAddress() {
        return produceAddress;
    }

    public void setProduceAddress(String produceAddress) {
        this.produceAddress = produceAddress;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getIshot() {
        return ishot;
    }

    public void setIshot(String ishot) {
        this.ishot = ishot;
    }

    @Override
    public String toString() {
        return "Item{" +
                "id=" + id +
                ", no=" + no +
                ", value='" + value + '\'' +
                ", address='" + address + '\'' +
                ", stock='" + stock + '\'' +
                ", info='" + info + '\'' +
                ", image='" + image + '\'' +
                ", produceAddress='" + produceAddress + '\'' +
                ", brand='" + brand + '\'' +
                ", name='" + name + '\'' +
                ", kind='" + kind + '\'' +
                ", onindex='" + onindex + '\'' +
                ", ishot='" + ishot + '\'' +
                '}';
    }
}
