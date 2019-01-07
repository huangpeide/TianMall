package com.example.demoboot.bean;

public class GoodsAndNum {
    private Item item;
    private int num;

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "GoodsAndNum{" +
                "item=" + item +
                ", num=" + num +
                '}';
    }
}
