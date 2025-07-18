package dao;

import context.DBContext;
import entity.Account;
import entity.Bill;
import entity.Category;
import entity.Color;
import entity.BillDetail;
import entity.Cart;
import entity.Item;
import entity.Product;
import entity.Size;

import java.sql.Statement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getLast() {
        String query = "select top 1 * from product";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getString(1),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product where category_id=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(String product_id) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product where product_id=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getString(1),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product where product_name like ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Account login(String user_name, String user_pass) {
        String query = "select * from users\n"
                + "where [user_name] = ?\n"
                + "and [user_pass] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user_name);
            ps.setString(2, user_pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Account checkAcc(String user_email) {
        try {
            String query = "select * from users where user_email = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user_email);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signup(String user_name, String user_email, String user_pass) {
        try {
            String query = "insert into users values(?,?,?,?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user_name);
            ps.setString(2, user_email);
            ps.setString(3, user_pass);
            ps.setString(4, "FALSE");
            ps.executeUpdate();
        } catch (Exception e) {
        };
    }

    public void ProductDelete(String product_id) {
        String sql = "delete from product_size where product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        String sql1 = "delete from product_color where product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql1);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        String sql2 = "delete from product_img where product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql2);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        String sq3 = "delete from product where product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sq3);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void insertProduct(Product product) {
        String sql = "insert into product (product_id,category_id,product_name,product_price,product_describe,quantity,img) values(?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product.getId());
            ps.setInt(2, product.getCate().getCid());
            ps.setString(3, product.getName());
            ps.setDouble(4, product.getPrice());
            ps.setString(5, product.getDescription());
            ps.setInt(6, product.getQuantity());
            ps.setString(7, product.getImage());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        String sql1 = "insert into product_size (product_id,size) values(?,?)";
        try {
            conn = new DBContext().getConnection();
            for (Size i : product.getSize()) {
                ps = conn.prepareStatement(sql1);
                ps.setString(1, i.getProduct_id());
                ps.setString(2, i.getSize());
                ps.executeUpdate();
            }
        } catch (Exception e) {
        }
        String sql2 = "insert into product_color (product_id,color) values(?,?)";
        try {
            conn = new DBContext().getConnection();
            for (Color i : product.getColor()) {
                ps = conn.prepareStatement(sql2);
                ps.setString(1, i.getProduct_id());
                ps.setString(2, i.getColor());
                ps.executeUpdate();
            }
        } catch (Exception e) {
        }
    }

    public List<Account> getAllUser() {
        List<Account> list = new ArrayList<>();
        String query = "select * from users";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void setAdmin(int user_id, String isAdmin) {
        String sql = "update users set isAdmin= ? where user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(2, user_id);
            ps.setString(1, isAdmin.toUpperCase());
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public List<Bill> getBillInfo() {
        List<Bill> list = new ArrayList<>();
        String sql = "select b.bill_id, u.user_name,b.phone,b.address,b.date,b.total,b.payment from bill b inner join users u on b.user_id = u.user_id";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account u = new Account(rs.getString(2));
                list.add(new Bill(rs.getInt(1), u, rs.getFloat(6), rs.getString(7), rs.getString(4), rs.getDate(5), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Bill> getBillsByUser(int userId) {
        List<Bill> list = new ArrayList<>();
        String sql = "SELECT bill_id, phone, address, date, total, payment FROM bill WHERE user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Bill bill = new Bill(
                        rs.getInt("bill_id"),
                        null, // user không cần thiết ở đây
                        rs.getFloat("total"),
                        rs.getString("payment"),
                        rs.getString("address"),
                        rs.getDate("date"),
                        rs.getInt("phone")
                );
                list.add(bill);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<BillDetail> getDetail(int bill_id) {
        List<BillDetail> list = new ArrayList<>();
        String sql = "select d.detail_id, p.product_id, p.product_name, p.img, d.quantity, d.size, d.color, d.price from bill_detail d "
                + "inner join product p on d.product_id = p.product_id where d.bill_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bill_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString(2), rs.getString(3), rs.getString(4));
                list.add(new BillDetail(rs.getInt(1), p, rs.getInt(5), rs.getString(6), rs.getString(7), rs.getFloat(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    //lay item trong cart theo user_id
    public Item getItemByUserAndProduct(int userId, String productId, String size, String color) {
        String sql = "SELECT * FROM Cart WHERE user_id = ? AND product_id = ? AND size = ? AND color = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, productId);
            ps.setString(3, size);
            ps.setString(4, color);
            ResultSet rs = ps.executeQuery();
            DAO pdao = new DAO();
            if (rs.next()) {
                Product p = pdao.getProductByID(productId);
                int quantity = rs.getInt("quantity");
                return new Item(p, quantity, size, color);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateQuantity(int userId, Item item) {
        String sql = "UPDATE Cart SET quantity = ? WHERE user_id = ? AND product_id = ? AND size = ? AND color = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, item.getQuantity());
            ps.setInt(2, userId);
            ps.setString(3, item.getProduct().getId());
            ps.setString(4, item.getSize());
            ps.setString(5, item.getColor());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addToCart(int userId, Item item) {
        // Kiểm tra xem item này đã tồn tại trong DB chưa
        Item existingItem = getItemByUserAndProduct(userId, item.getProduct().getId(), item.getSize(), item.getColor());

        if (existingItem != null) {
            // Nếu đã có: cập nhật số lượng mới = cũ + mới
            int newQuantity = existingItem.getQuantity() + item.getQuantity();
            item.setQuantity(newQuantity);
            updateQuantity(userId, item);
        } else {
            // Nếu chưa có: thêm mới vào DB
            String sql = "INSERT INTO [dbo].[cart]\n"
                    + "           ([product_id]\n"
                    + "           ,[quantity]\n"
                    + "           ,[user_id]\n"
                    + "           ,[size]\n"
                    + "           ,[color])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?)";
            try {
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(sql);
                ps.setString(1, item.getProduct().getId());

                ps.setInt(2, item.getQuantity());
                ps.setInt(3, userId);
                ps.setString(4, item.getSize());
                ps.setString(5, item.getColor());

                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public Cart getCartByUser(int userId) {
        Cart cart = new Cart();
        String sql = "SELECT * FROM Cart WHERE user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            DAO pdao = new DAO();
            while (rs.next()) {
                Product p = pdao.getProductByID(rs.getString("product_id"));
                int quantity = rs.getInt("quantity");
                String size = rs.getString("size");
                String color = rs.getString("color");

                Item item = new Item(p, quantity, size, color);
                cart.addItem(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cart;
    }

    public void removeFromCart(int userId, String productId, String size, String color) {
        String sql = "DELETE FROM cart WHERE user_id = ? AND product_id = ? AND size = ? AND color = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, productId);
            ps.setString(3, size);
            ps.setString(4, color);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public int insertBill(Bill bill) {
        String sql = "INSERT INTO [dbo].[bill]\n"
                + "           ([user_id]\n"
                + "           ,[total]\n"
                + "           ,[payment]\n"
                + "           ,[address]\n"
                + "           ,[date]\n"
                + "           ,[phone])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, bill.getAccount().getId());
            ps.setInt(6, bill.getPhone());
            ps.setString(4, bill.getAddress());
            ps.setDate(5, new java.sql.Date(System.currentTimeMillis()));
            ps.setFloat(2, bill.getTotal());
            ps.setString(3, bill.getPayment());
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // trả về bill_id vừa tạo
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;

    }

    public void insertBillDetail(int billId, Item item) {
        String sql = "INSERT INTO [dbo].[bill_detail]\n"
                + "           ([bill_id]\n"
                + "           ,[product_id]\n"
                + "           ,[quantity]\n"
                + "           ,[size]\n"
                + "           ,[color]\n"
                + "           ,[price])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, billId);
            ps.setString(2, item.getProduct().getId());
            ps.setInt(3, item.getQuantity());
            ps.setString(4, item.getSize());
            ps.setString(5, item.getColor());
            ps.setDouble(6, item.getProduct().getPrice());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void clearCart(int userId) {
        String sql = "DELETE FROM cart WHERE user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateBillAddress(int billId, String address, int phone) {
        String sql = "UPDATE [dbo].[bill]\n"
                + "   SET [address] = ?\n"
                + "      ,[phone] = ?\n"
                + " WHERE bill_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, address);
            ps.setInt(2, phone);
            ps.setInt(3, billId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateAccountInfo(Account acc) {
        String sql = "UPDATE [dbo].[users]\n"
                + "   SET [user_name] = ?,\n"
                + "       [user_email] = ?,\n"
                + "       [user_pass] = ?\n"
                + " WHERE [user_id] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, acc.getUser_name());
            ps.setString(2, acc.getEmail());
            ps.setString(3, acc.getPassword());
            ps.setInt(4, acc.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(Product p) {
        String sql = "UPDATE [dbo].[product]\n"
                + "   SET [category_id] = ?\n"
                + "      ,[product_name] = ?\n"
                + "      ,[product_price] = ?\n"
                + "      ,[product_describe] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[img] = ?\n"
                + " WHERE [product_id] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, p.getCate().getCid());
            ps.setString(2, p.getName());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getDescription());
            ps.setInt(5, p.getQuantity());
            ps.setString(6, p.getImage());
            ps.setString(7, p.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Product getProductByIDDetail(String pid) {
        Product product = null;
        String query = "SELECT * FROM product WHERE product_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            rs = ps.executeQuery();
            if (rs.next()) {
                product = new Product(
                        rs.getString("product_id"),
                        rs.getString("product_name"),
                        rs.getDouble("product_price"),
                        rs.getString("product_describe"),
                        rs.getInt("category_id"),
                        rs.getString("img")
                );

                // Gán danh sách size và color
                product.setSize(getSizesByProductID(pid));
                product.setColor(getColorsByProductID(pid));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // đóng kết nối nếu dùng conn riêng
        }
        return product;
    }

    public List<Size> getSizesByProductID(String pid) {
        List<Size> sizes = new ArrayList<>();
        String query = "SELECT size FROM product_size WHERE product_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            rs = ps.executeQuery();
            while (rs.next()) {
                sizes.add(new Size(pid, rs.getString("size")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sizes;
    }

    public List<Color> getColorsByProductID(String pid) {
        List<Color> colors = new ArrayList<>();
        String query = "SELECT color FROM product_color WHERE product_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            rs = ps.executeQuery();
            while (rs.next()) {
                colors.add(new Color(pid, rs.getString("color")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return colors;
    }

    public List<Product> getAllProductDetail() {
    List<Product> list = new ArrayList<>();
    String query = "SELECT * FROM product";

    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();

        while (rs.next()) {
            // Lấy dữ liệu từ cột theo thứ tự
            String productId = rs.getString(1);
            String name = rs.getString(3);
            double price = rs.getDouble(4);
            String description = rs.getString(5);
            int quantity = rs.getInt(6);
            String image = rs.getString(7);

            // Tạo Product
            Product p = new Product(productId, name, price, description, quantity, image);

            // Gán size và color từ bảng phụ
            p.setSize(getSizesByProductID(productId));
            p.setColor(getColorsByProductID(productId));

            list.add(p);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
}
