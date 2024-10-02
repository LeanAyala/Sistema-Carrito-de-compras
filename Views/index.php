<?php include "Views/template/header.php"; ?>

<!-- Categories Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Nuestros productos</h2>
                </div>
                <div class="featured__controls">
                    <ul>
                        <li class="active" data-filter="*">Todas</li>
                        <?php foreach ($data['categorias'] as $categoria) { ?>
                            <li data-filter=".cat_<?php echo $categoria['id']; ?>"><?php echo $categoria['categoria']; ?></li>
                        <?php } ?>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row featured__filter">
            <?php foreach ($data['destacados'] as $producto) { ?>
                <div class="col-lg-3 col-md-4 col-sm-6 mix cat_<?php echo $producto['id_categoria']; ?> fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="<?php echo BASE_URL . 'public/img/productos/' . $producto['imagen']; ?>">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#" stock="<?php echo $producto['cantidad']; ?>" class="producto-agregar" id="<?php echo $producto['id']; ?>"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"><?php echo $producto['nombre']; ?></a></h6>
                            <h5>$<?php echo $producto['precio']; ?></h5>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
</section>
<!-- Featured Section End -->
<?php include "Views/template/footer.php"; ?>

<script src="<?php echo BASE_URL; ?>public/js/cart.js"></script>

</body>

</html>