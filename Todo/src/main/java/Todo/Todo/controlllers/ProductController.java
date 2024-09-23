package Todo.Todo.controlllers;

import Todo.Todo.models.Product;
import Todo.Todo.services.ProductServices;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final ProductServices productServices;

    @GetMapping("/")
    public String product(@RequestParam(name = "name", required = false) String name, Model model) {
        model.addAttribute("products", productServices.listProduct(name));
        return "products";
    }

    @PostMapping("/product/create")
    public String createProduct(Product product) {
        productServices.saveProduct(product);
        return "redirect:/";
    }

    @PostMapping("/product/delete")
    public String deleteProduct(@RequestParam Long id) {
        productServices.deleteProduct(id);
        return "redirect:/";
    }
}
