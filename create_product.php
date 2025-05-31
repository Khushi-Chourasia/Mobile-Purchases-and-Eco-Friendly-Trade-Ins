<?php
// Load inventory data if editing
if (isset($_GET['id']) && $_GET['id'] > 0) {
    $qry = $conn->query("SELECT * FROM `inventory` WHERE id = '{$_GET['id']}' ");
    if ($qry->num_rows > 0) {
        foreach ($qry->fetch_assoc() as $k => $v) {
            $$k = $v;
        }
    }
}
?>

<div class="row">
    <!-- Create Product -->
    <div class="col-md-6">
        <div class="card card-outline card-info">
            <div class="card-header">
                <h3 class="card-title">Create New Product</h3>
            </div>
            <div class="card-body">
                <form action="" id="new-product-form">
                    <!-- Brand -->
                    <div class="form-group">
                        <label for="brand_id" class="control-label">Brand</label>
                        <select name="brand_id" id="brand_id" class="custom-select select2" required>
                            <option value=""></option>
                            <?php
                            $qry = $conn->query("SELECT * FROM `brands` ORDER BY `name` ASC");
                            while ($row = $qry->fetch_assoc()):
                            ?>
                                <option value="<?= $row['id'] ?>"><?= $row['name'] ?></option>
                            <?php endwhile; ?>
                        </select>
                    </div>

                    <!-- Category -->
                    <div class="form-group">
                        <label for="category_id" class="control-label">Category</label>
                        <select name="category_id" id="category_id" class="custom-select select2" required>
                            <option value=""></option>
                            <?php
                            $qry = $conn->query("SELECT * FROM `categories` ORDER BY category ASC");
                            while ($row = $qry->fetch_assoc()):
                            ?>
                                <option value="<?= $row['id'] ?>"><?= $row['category'] ?></option>
                            <?php endwhile; ?>
                        </select>
                    </div>

                    <!-- Sub Category -->
                    <div class="form-group">
                        <label for="sub_category_id" class="control-label">Sub Category</label>
                        <select name="sub_category_id" id="sub_category_id" class="custom-select">
                            <option value="" disabled selected>Select Category First</option>
                        </select>
                    </div>

                    <!-- Name -->
                    <div class="form-group">
                        <label for="name" class="control-label">Product Name</label>
                        <input type="text" name="name" id="name" class="form-control" required>
                    </div>

                    <!-- Specs -->
                    <div class="form-group">
                        <label for="specs" class="control-label">Specs</label>
                        <textarea name="specs" class="form-control summernote"></textarea>
                    </div>

                    <!-- Status -->
                    <div class="form-group">
                        <label for="status" class="control-label">Status</label>
                        <select name="status" id="status" class="custom-select">
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                        </select>
                    </div>

                    <!-- Images -->
                    <div class="form-group">
                        <label class="control-label">Images</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" name="img[]" multiple accept=".png,.jpg,.jpeg" onchange="displayImg(this,$(this))">
                            <label class="custom-file-label">Choose files</label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="card-footer">
                <button class="btn btn-primary" form="new-product-form">Save Product</button>
            </div>
        </div>
    </div>

    <!-- Manage Inventory -->
    <div class="col-md-6">
        <div class="card card-outline card-info">
            <div class="card-header">
                <h3 class="card-title"><?= isset($id) ? "Update " : "Create New " ?> Inventory</h3>
            </div>
            <div class="card-body">
                <form action="" id="inventory-form">
                    <input type="hidden" name="id" value="<?= isset($id) ? $id : '' ?>">
                    <div class="form-group">
                        <label for="product_id" class="control-label">Product</label>
                        <select name="product_id" id="product_id" class="custom-select select2" required>
                            <option value=""></option>
                            <?php
                            $qry = $conn->query("SELECT * FROM `products` ORDER BY `name` ASC");
                            while ($row = $qry->fetch_assoc()):
                                foreach ($row as $k => $v) {
                                    $row[$k] = trim(stripslashes($v));
                                }
                            ?>
                                <option value="<?= $row['id'] ?>" <?= isset($product_id) && $product_id == $row['id'] ? 'selected' : '' ?>><?= $row['name'] ?></option>
                            <?php endwhile; ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="quantity" class="control-label">Beginning Quantity</label>
                        <input type="number" class="form-control" required name="quantity" value="<?= isset($quantity) ? $quantity : '' ?>">
                    </div>

                    <div class="form-group">
                        <label for="price" class="control-label">Price</label>
                        <input type="number" step="any" class="form-control" required name="price" value="<?= isset($price) ? $price : '' ?>">
                    </div>
                </form>
            </div>
            <div class="card-footer">
                <button class="btn btn-primary" form="inventory-form">Save Inventory</button>
                <a class="btn btn-secondary" href="?page=inventory">Cancel</a>
            </div>
        </div>
    </div>
</div>

<script>
    function displayImg(input, _this) {
        let fnames = [];
        Object.keys(input.files).map(k => fnames.push(input.files[k].name));
        _this.siblings('.custom-file-label').html(fnames.join(', '));
    }

    let sub_categories = {};

    $(document).ready(function () {
        <?php
        $subs = [];
        $qry = $conn->query("SELECT * FROM `sub_categories` ORDER BY sub_category ASC");
        while ($row = $qry->fetch_assoc()) {
            $subs[$row['parent_id']][] = $row;
        }
        ?>
        sub_categories = <?= json_encode($subs) ?>;

        $('#category_id').change(function () {
            const cid = $(this).val();
            let options = '<option value="">Select</option>';
            if (sub_categories[cid]) {
                sub_categories[cid].forEach(sub => {
                    options += `<option value="${sub.id}">${sub.sub_category}</option>`;
                });
            }
            $('#sub_category_id').html(options).select2();
        });

        $('.select2').select2({ placeholder: "Select here", width: "100%" });
        $('.summernote').summernote({ height: 150 });

        $('#new-product-form').submit(function (e) {
            e.preventDefault();
            let form = $(this);
            start_loader();
            $.ajax({
                url: _base_url_ + "classes/Master.php?f=save_product",
                data: new FormData(form[0]),
                method: 'POST',
                contentType: false,
                processData: false,
                dataType: 'json',
                success: function (resp) {
                    if (resp.status === 'success') {
                        alert_toast("Product Saved", "success");
                        setTimeout(() => {
                            location.href = "./";
                        }, 1000); // delay for toast to show
                    } else {
                        alert_toast("Error: " + (resp.msg || "Saving failed"), "error");
                    }
                    end_loader();
                },
                error: err => {
                    console.log(err);
                    alert_toast("AJAX error occurred", "error");
                    end_loader();
                }
            });
        });

        $('#inventory-form').submit(function (e) {
            e.preventDefault();
            let form = $(this);
            start_loader();
            $.ajax({
                url: _base_url_ + "classes/Master.php?f=save_inventory",
                data: new FormData(form[0]),
                method: 'POST',
                contentType: false,
                processData: false,
                dataType: 'json',
                success: function (resp) {
                    if (resp.status === 'success') {
                        location.href = "./?page=inventory";
                    } else if (resp.status === 'failed' && resp.msg) {
                        var el = $('<div>').addClass("alert alert-danger err-msg").text(resp.msg);
                        form.prepend(el);
                        el.show('slow');
                        $("html, body").animate({ scrollTop: form.closest('.card').offset().top }, "fast");
                    } else {
                        alert_toast("Error occurred", "error");
                        console.log(resp);
                    }
                    end_loader();
                },
                error: err => {
                    console.log(err);
                    alert_toast("AJAX error", "error");
                    end_loader();
                }
            });
        });
    });
</script>
