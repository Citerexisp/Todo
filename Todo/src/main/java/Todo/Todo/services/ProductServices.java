package Todo.Todo.services;

import Todo.Todo.models.Product;

import Todo.Todo.repositories.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;


import java.util.List;


@Slf4j
@Service
@RequiredArgsConstructor
public class ProductServices {
    private final ProductRepository productRepositoriy;

    public List<Product> listProduct(String name){

        List<Product> products = productRepositoriy.findAll();
        if (name != null && !name.isEmpty()) productRepositoriy.findByName(name);
        return productRepositoriy.findAll();
    }

    public void saveProduct(Product product){
        log.info("Saving product: {}" + product);
        productRepositoriy.save(product);
    }

    public void deleteProduct(Long id){
        productRepositoriy.deleteById(id);
    }

    public Product getProductById(Long id){
        return productRepositoriy.findById(id).orElse(null);
    }
}
