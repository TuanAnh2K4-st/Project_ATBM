package hcmuaf.edu.vn.fit.pj_web_hc.Model;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<Integer, CartItem> items = new HashMap<>();

    public void addItem(CartItem item) {
        int productId = item.getProduct().getProductId();
        if (items.containsKey(productId)) {
            CartItem existing = items.get(productId);
            existing.setQuantity(existing.getQuantity() + item.getQuantity());
        } else {
            items.put(productId, item);
        }
    }

    public void removeItem(int productId) {
        items.remove(productId);
    }

    public CartItem getItem(int productId) {
        return items.get(productId);
    }

    public Collection<CartItem> getItems() {
        return items.values();
    }

    public int getTotalPrice() {
        return items.values().stream().mapToInt(CartItem::getTotalPrice).sum();
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }
}
