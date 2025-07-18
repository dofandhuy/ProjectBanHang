
package entity;

import java.util.ArrayList;
import java.util.List;


public class Product {
    Category cate;
    private String id;
    private String name;
    private String image;
    private double price;
    private int quantity;
    private String description;
    List<Size> size = new ArrayList<>();
    List<Color> color = new ArrayList<>();

    public Product() {
    }

    public Product( String id,Category cate, String name,  double price, int quantity,String image, String description) {
        this.cate = cate;
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
    }

    public Product(String id, String name, String image) {
        this.id = id;
        this.name = name;
        this.image = image;
    }

    
    public Product(String id, String name, double price, String description, int quantity, String image) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.image = image;
    }

    public Category getCate() {
        return cate;
    }

    public void setCate(Category cate) {
        this.cate = cate;
    }

    public List<Size> getSize() {
        return size;
    }

    public void setSize(List<Size> size) {
        this.size = size;
    }

    public List<Color> getColor() {
        return color;
    }

    public void setColor(List<Color> color) {
        this.color = color;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", image=" + image + ", price=" + price + ", quantity=" + quantity + ", description=" + description + '}';
    }

}
